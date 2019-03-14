# Description:
#   Get a stock price
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   nestor stock <ticker>
#
# Author:
#   eliperkins
#   maddox
#   johnwyles

module.exports = (robot) ->
  robot.respond /stock (?:info|price|quote)?\s?(?:for|me)?\s?@?([A-Za-z0-9.-_]+)\s?(\d+\w+)?/i, (msg) ->
    ticker = escape(msg.match[1])
    time = msg.match[2] || '1d'
    msg.http('http://finance.google.com/finance/info?client=ig&q=' + ticker)
      .get() (err, res, body) ->
        result = JSON.parse(body.replace(/\/\/ /, ''))
        msg.send "https://www.google.co.uk/finance/getchart?q=#{ticker}&x=NYSE&p=5dd&i=240&ei=iRFSVomOMoiJU7rOkYAE.jpg"
        msg.send ":chart_with_upwards_trend: " + result[0].l_cur + " (#{result[0].c}%)"
        msg.send ":information_source: *make sure you type the ticker in CAPITAL letters*"