# Description:
#   Time to do it right.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   nestor fab me - Tell you to do it right
#   nestor fab N - Tell N to do it right

module.exports = (robot) ->

  robot.respond /fab (.*)/i, (msg) ->
    user = msg.match[1]

    if user is "me"
      msg.reply "Do it right!"
    else
      msg.send "#{user}: Please, do it right!"
