# Description:
#   Find the currently deployed Carson version
#
# Commands:
#   nestor carson version - display the version of carson deployed to production
#   nestor carson staging version - display the version of carson deployed to staging
#   nestor carson acceptance version - display the version of carson deployed to acceptance

module.exports = (robot) ->
  urls = {
    carson: {
      production: "https://support.zendesk.com/carson/version"
      staging:    "https://support.zendesk-staging.com/carson/version"
      acceptance: "https://support.zendesk-acceptance.com/carson/version"
    }
  }

  logVersion = (msg, product, environment) ->
    url = urls[product][environment]

    unless url
      msg.send "#{environment} is an invalid Carson environment"
      return

    msg.send "Fetching #{product} version in #{environment}. please wait..."

    robot.http(url)
      .get() (err, res, body) ->
        versions = ''
        try
          response = JSON.parse body
        catch e
          msg.send "Could not fetch current version of Carson"
          return

        Object.keys(response).forEach (key) ->
          versions += "#{key}: #{response[key]} \n"
          return

        msg.send "Currently deployed: \n#{versions}"

  robot.respond /carson\s?(.*?) version/i, (msg) ->
    environment = msg.match[1] or 'production'
    product = 'carson'
    logVersion msg, product, environment