DATE=`date`
# Notify if we have changes in declarations
DIFF=`git diff --exit-code torch/declarations.nim`
MSG="Changes in declarations.nim, $DATE"
test -z "$DIFF" || curl -X POST -H 'Content-Type: application/json' -d '{"value1":"'"$MSG"'","value2":"'"$CI_COMMIT_SHA"'","value3":""}' https://maker.ifttt.com/trigger/trello_works_notify/with/key/$IFTTT_KEY && true
# Notify if we have changes in derivatives
DIFF=`git diff --exit-code torch/derivatives.nim`
MSG="Changes in derivatives.nim, $DATE"
test -z "$DIFF" || curl -X POST -H 'Content-Type: application/json' -d '{"value1":"'"$MSG"'","value2":"'"$CI_COMMIT_SHA"'","value3":""}' https://maker.ifttt.com/trigger/trello_works_notify/with/key/$IFTTT_KEY && true