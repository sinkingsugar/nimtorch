import fragments/ffi/cpp, torch/torch_cpp
export cpp, torch_cpp

when defined cuda:
  import torch/torch_cuda_cpp
  export torch_cuda_cpp

import torch/[
  tensors,
  tensor_ops,
  autograd_macro,
  autograd_backward]

export
  tensors,
  tensor_ops,
  autograd_macro,
  autograd_backward

when isMainModule:
  var
    z = zeros(@[2, 1, 4])

    x = tensor([
        [
          [ 0.1,  0.2,  0.3,  0.4],
          [-0.1, -0.2, -0.3, -0.4],
          [ 0.5,  0.6,  0.7,  0.8]
        ],
        [
          [ 0.1,  0.2,  0.3,  0.4],
          [-0.1, -0.2, -0.3, -0.4],
          [ 0.5,  0.6,  0.7,  0.8]
        ]
      ])

    hidden = tensor([
        [
          [ -1.0, -1.0],
          [ -1.0, -1.0],
          [ -1.0, -1.0]
        ],
        [
          [ -1.0, -1.0],
          [ -1.0, -1.0],
          [ -1.0, -1.0]
        ]
      ])

    w_input = tensor([
        [
          [0.9, 0.8, 0.7, 0.6],
          [0.8, 0.7, 0.6, 0.5],
          [0.7, 0.6, 0.5, 0.4],
          [0.6, 0.5, 0.4, 0.3],
          [0.5, 0.4, 0.3, 0.2],
          [0.4, 0.3, 0.2, 0.1]
        ],
        [
          [0.9, 0.8, 0.7, 0.6],
          [0.8, 0.7, 0.6, 0.5],
          [0.7, 0.6, 0.5, 0.4],
          [0.6, 0.5, 0.4, 0.3],
          [0.5, 0.4, 0.3, 0.2],
          [0.4, 0.3, 0.2, 0.1]
        ]
      ])

    w_recur = tensor([
        [
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
        ],
        [
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
          [-0.3, -0.1],
          [-0.2,  0.0],
        ]
      ])

    b_input = tensor([
        [
          [0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
        ],
        [
          [0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
        ]
      ])

    b_recur = tensor([
        [
          [-0.1, -0.2, -0.3, -0.4, -0.5, -0.6],
        ],
        [
          [-0.1, -0.2, -0.3, -0.4, -0.5, -0.6],
        ]
      ])

  z.print()
  x.print()
  echo z.size(0)

  var emptyTensor: Tensor

  let zmul = z * 3

  # grucell
  var
    gi = x.matmul(w_input.transpose(1, 2)) + b_input
    gh = hidden.matmul(w_recur.transpose(1, 2)) + b_recur
    (i_r, i_i, i_nn) = gi.chunk(3, 2)
    (h_r, h_i, h_n) = gh.chunk(3, 2)
    resetgate = (i_r + h_r).sigmoid()
    presigmoid = i_i + h_i
    inputgate = presigmoid.sigmoid()
    newgate = (i_nn + resetgate * h_n).tanh()
    hy = newgate + inputgate * (hidden - newgate)
  
  hy.print()

  when not defined wasm:
    var hycopy = hy.copy()

    var longt = zeros(@[1, 1, 1], dtype = LongTensor)
    longt.print()

    var ht = zeros(@[1, 1, 1], dtype = ByteTensor)
    ht.print()

    var tensorList: TensorList
    tensorList = @[z, x]
    for i in 0..tensorList.high:
      tensorList[i].print()
    
    var
      c0 = tensor([1.0, 0.0])
      c1 = tensor([0.2, 1.1])
      c2 = cat(@[c0, c1])
    
    echo "cat test:"
    c2.print()
    
    # var tupleTest = multilabel_margin_loss_forward(c0, c1, 0)
    
    var intList: IntList = @[10, 20, 30]
    for i in 0..intList.high:
      echo "IntList[", i, "] = ", intList[i]
    
    for item in intList:
      echo item

    var
      tos = toSeq[float32](hy)
      froms = tos.toTensor(2, 3, 2)
      
    # var (ra, rb) = prelu_backward(gi, gh, hy, @[true, true])
    
    echo tos
    froms.print()

    var accessorsTest = zeros(@[5, 2, 3])
    # echo accessorsTest.sizes()[0]
    # var act1s = accessorsTest.select(1, 0)
    # var act2s = accessorsTest.select(1, 1)
    var act1 = accessorsTest[_, 0]
    var act2 = accessorsTest[_, 1]
    # var indexTensor = range(0.float, 4.float, LongTensor)
    # act1.index_put_inplace([indexTensor], full_like(act1, 10.float))
    # act2.index_put_inplace([indexTensor], full_like(act1, 100.float))
    accessorsTest[_, 0] = 10
    accessorsTest[_, 1] = 100
    accessorsTest[_, _, 2] = 1020
    echo accessorsTest
    
    when defined cuda:
      if globalContext().hasCUDA().to(bool):
        echo "Cuda available"
        echo "Cuda device ", globalContext().current_device().to(int)
        var cudaTensor = zeros(@[7, 7, 7], device = device("cuda"), dtype = DoubleTensor)
        cudaTensor.print()

        froms = froms.cuda()
        froms.print()

        x = x.cuda()
        hidden = hidden.cuda()
        b_input = b_input.cuda()
        b_recur = b_recur.cuda()
        w_input = w_input.cuda()
        w_recur = w_recur.cuda()
        gi = x.matmul(w_input.transpose(1, 2)) + b_input
        gh = hidden.matmul(w_recur.transpose(1, 2)) + b_recur
        (i_r, i_i, i_nn) = gi.chunk(3, 2)
        (h_r, h_i, h_n) = gh.chunk(3, 2)
        resetgate = (i_r + h_r).sigmoid()
        presigmoid = i_i + h_i
        inputgate = sigmoid(presigmoid)
        newgate = (i_nn + resetgate * h_n).tanh()
        hy = newgate + inputgate * (hidden - newgate)

        hy.print()
    
    # tensor([[-0.5317, -0.4753],
    #         [-0.3930, -0.3210],
    #         [-0.7325, -0.6430]])

    when not defined inference:
      var a = tensor([
        [1, 2],
        [3, 4]
      ])

      var b = tensor([
        [5, 6],
        [8, 7]
      ])
    
      a.requires_grad = true
      let a1 = sin(a)
      echo a1.requires_grad
      a1.backward()
      print a.grad

    import torch/nn/functional

    block:  
      let
        in_channels = 1
        out_channels = 1
        input = randn([1, in_channels, 100, 100])
        weight = randn([out_channels, in_channels, 10, 10])
        bias = randn([out_channels])

      weight.requires_grad = true
      bias.requires_grad = true

      let
        x = conv2d(input, weight, bias, [1, 1], [0, 0], [1, 1], 1)
        
      x.backward()
      echo weight.grad.sizes()
