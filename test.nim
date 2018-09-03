import nimtorch
import fragments/memory
import fragments/ffi/cpp

var x = torch.zeros(@[2, 2])
echo x.use_count()
x.print()

proc doSomething(a, b: Tensor): Tensor = a + b

var x1 = doSomething(x, x)
echo "x1 ", x1.use_count()
echo "x ", x.use_count()

block:
  var y = x
  echo x.use_count()
  x.print()
  echo y.use_count()
  y.print()

echo x.use_count()
x.print()

type
  MyNetwork = object
    x: Tensor
    y: Tensor

var net: MyNetwork
net.x = torch.ones(@[2, 2])
net.y = torch.ones(@[2, 2])
echo net.x.use_count()
echo net.y.use_count()

block:
  var netCopy = net
  echo net.x.use_count()
  echo net.y.use_count()

echo net.x.use_count()
echo net.y.use_count()

var netPtr: ptr MyNetwork
cppnewptr netPtr
netPtr.x = torch.ones(@[2, 2])
netPtr.y = torch.ones(@[2, 2])
echo netPtr.x.use_count()
echo netPtr.y.use_count()

cppdelptr netPtr
echo netPtr.x.use_count()
echo netPtr.y.use_count()