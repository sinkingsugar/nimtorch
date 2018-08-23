import ../nimtorch
import derivatives

var
  t = torch.zeros(@[2, 2])
  sig = t.sigmoid()
  bsig = sig.sigmoid_bwd(sig, t)

bsig.self.print()