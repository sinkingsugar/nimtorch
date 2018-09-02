import ../nimtorch
import derivatives

var
  t = torch.zeros(@[2, 2])
  sig = t.sigmoid()
  bsig = sig.sigmoid_bwd(sig, t)

bsig.self.print()

var x = torch.ones(@[2, 2])
print(x)

###############################################################
#
# print(x.data)

###############################################################
#
# print(x.grad)

###############################################################
#

# print(x.grad_fn)  # we've created x ourselves

###############################################################
# Do an operation of x:

var y = x + 2
print(y)

###############################################################
# y was created as a result of an operation,
# so it has a grad_fn
# print(y.grad_fn)

###############################################################
# More operations on y:

var
  z = y * y * 3
  o = z.mean()

print(o)

var
  w = torch.ones(@[2, 2])
o = w.mean()

var gmean = mean_bwd(o, o, z)
print(gmean.self)

################################################################
# ``.requires_grad_( ... )`` changes an existing Tensor's ``requires_grad``
# flag in-place. The input flag defaults to ``True`` if not given.
# a = torch.randn(2, 2)
# a = ((a * 3) / (a - 1))
# print(a.requires_grad)
# a.requires_grad_(True)
# print(a.requires_grad)
# b = (a * a).sum()
# print(b.grad_fn)

###############################################################
# Gradients
# ---------
#
# let's backprop now and print gradients d(out)/dx

# o.backward()
# print(x.grad)

var emptyList: IntList
let zeroTensor = torch.zeros(emptyList)
zeroTensor.print()