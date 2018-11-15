import os, strformat

const steps = 1000
for cuda in {false, true}:
  echo "==============================="
  echo if cuda: "CUDA" else: "CPU"
  echo "==============================="
  for batchSize in [1, 2, 4, 8, 16, 32, 64, 2*64, 3*64, 4*64, 5*64, 6*64, 7*64, 8*64]:
    for hiddenCount in [1, 2, 4, 8, 16, 32, 64, 2*64, 3*64, 4*64, 5*64, 6*64, 7*64, 8*64]:
      echo "-------------------------------"
      echo fmt"batchSize={batchSize}, hiddenCount={hiddenCount}"
      echo "-------------------------------"

      block:
        echo "NIM:"
        let cudaDef = if cuda: "-d:cuda" else: ""
        if 0 != os.execShellCmd(fmt"nim cpp -d:release --verbosity:0 --hints:off {cudaDef} --d:totalStepCount={steps} --d:logSteps={steps} --d:batchSize={batchSize} --d:hiddenCount:{hiddenCount} tests/test_a2c"):
          quit()
        if 0 != os.execShellCmd("tests/test_a2c"):
          quit()

      # block:
      #   echo "PYTHON:"
      #   let cudaDef = if cuda: "--cuda=True" else: ""
      #   if 0 != os.execShellCmd(fmt"python tests/test_a2c.py {cudaDef} --totalStepCount={steps} --logSteps={steps} --batchSize={batchSize} --hiddenCount={hiddenCount}"):
      #     quit()