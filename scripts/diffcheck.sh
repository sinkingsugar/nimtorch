# Notify if we have changes in declarations
export DIFF=`git diff --exit-code torch/declarations.nim`
test -z "$DIFF" || curl -X POST -H 'Content-Type: application/json' -d "{\"value1\":\"Changes in declarations.nim\",\"value2\":\"$CI_COMMIT_SHA\",\"value3\":\"$DIFF\"}" https://maker.ifttt.com/trigger/trello_works_notify/with/key/$IFTTT_KEY && true
# Notify if we have changes in derivatives
export DIFF=`git diff --exit-code torch/derivatives.nim`
test -z "$DIFF" || curl -X POST -H 'Content-Type: application/json' -d "{\"value1\":\"Changes in derivatives.nim\",\"value2\":\"$CI_COMMIT_SHA\",\"value3\":\"$DIFF\"}" https://maker.ifttt.com/trigger/trello_works_notify/with/key/$IFTTT_KEY && true