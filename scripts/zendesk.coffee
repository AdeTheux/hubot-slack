# Description:
#   Queries Zendesk for information about support tickets
#
# Configuration:
#   HUBOT_ZENDESK_USER
#   HUBOT_ZENDESK_PASSWORD
#   HUBOT_ZENDESK_SUBDOMAIN
#
# Commands:
#   nestor zd (all) tickets - returns the total count of all unsolved tickets. The 'all' keyword is optional.
#   nestor zd new tickets - returns the count of all new (unassigned) tickets
#   nestor zd open tickets - returns the count of all open tickets
#   nestor zd sc tickets - returns a count of tickets with pre-sales tag that are open or pending
#   nestor zd ps tickets - returns a count of tickets with services tag that are open or pending
#   nestor zd mentor tickets - returns a count of tickets with mentor tag that are open or pending
#   nestor zd list new tickets - returns a list of all new tickets
#   nestor zd list sla - returns a list of all unresolved tickets which breached the SLA
#   nestor zd ticket <ID> - returns information about the specified ticket

tickets_url = "https://#{process.env.HUBOT_ZENDESK_SUBDOMAIN}.zendesk.com/tickets"
queries =
  unsolved: "search.json?query=status<solved+type:ticket"
  open: "search.json?query=status:open+type:ticket"
  new: "search.json?query=status:new+type:ticket"
  sc: "search.json?query=tags:pre_sales+status:new"
  ps: "search.json?query=tags:services+status:new"
  mentor: "search.json?query=tags:mentor_program+status:new"
  sla: "search.json?query=tags:sla_frt_breached"
  tickets: "tickets"
  users: "users"


zendesk_request = (msg, url, handler) ->
  zendesk_user = "#{process.env.HUBOT_ZENDESK_USER}"
  zendesk_password = "#{process.env.HUBOT_ZENDESK_PASSWORD}"
  auth = new Buffer("#{zendesk_user}:#{zendesk_password}").toString('base64')
  zendesk_url = "https://#{process.env.HUBOT_ZENDESK_SUBDOMAIN}.zendesk.com/api/v2"

  msg.http("#{zendesk_url}/#{url}")
    .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "Computer says no. And Zendesk says: #{err}"
          return

        content = JSON.parse(body)

        if content.error?
          if content.error?.title
            msg.send "Computer says no. And Zendesk says: #{content.error.title}"
          else
            msg.send "Computer says no. And Zendesk says: #{content.error}"
          return

        handler content

zendesk_update_request = (msg, url, data, handler) ->
  zendesk_user = "#{process.env.HUBOT_ZENDESK_USER}"
  zendesk_password = "#{process.env.HUBOT_ZENDESK_PASSWORD}"
  auth = new Buffer("#{zendesk_user}:#{zendesk_password}").toString('base64')
  zendesk_url = "https://#{process.env.HUBOT_ZENDESK_SUBDOMAIN}.zendesk.com/api/v2"

  msg.http("#{zendesk_url}/#{url}")
    .headers(Authorization: "Basic #{auth}", Accept: "application/json", "Content-Type": "application/json")
      .put(JSON.stringify(data)) (err, res, body) ->
        if err
          msg.send "Computer says no. And Zendesk says: #{err}"
          return

        content = JSON.parse(body)

        if content.error?
          if content.error?.title
            msg.send "Computer says no. And Zendesk says: #{content.error.title}"
          else
            msg.send "Computer says no. And Zendesk says: #{content.error}"
          return

        handler content

# FIXME this works about as well as a brick floats
zendesk_user = (msg, user_id) ->
  zendesk_request msg, "#{queries.users}/#{user_id}.json", (result) ->
    if result.error
      msg.send result.description
      return
    result.user

agents_ids = {
  "arnaud": {id:344486768, group_id:24037689},
  "nils": {id:279394212, group_id:24037689},
  "rav": {id:331018109, group_id:24102225},
  "henry": {id:348572907, group_id:24102225},
  "julie": {id:349371159, group_id:24037689},
  "treasa": {id:428783569, group_id:20381087},
  "bjorn": {id:435353326, group_id:24037689},
  "andrey": {id:447259378, group_id:20381087},
  "vlad": {id:462825616, group_id:20381087},
  "sandra": {id:630250763, group_id:24037689},
  "emilie": {id:686659115, group_id:24102225},
  "lynne": {id:708210468, group_id:24102225},
  "romain": {id:711930369, group_id:24037689},
  "sofyan": {id:926668299, group_id:20381087},
  "dan": {id:1082164175, group_id:20381087},
  "klaus": {id:1154776105, group_id:20381087},
  "frank": {id:1504381155, group_id:20381087}
}

module.exports = (robot) ->

  robot.respond /(?:zd)? assign ticket ([0-9]+) to ([a-zA-Z]+)$/i, (msg) ->
  	ticket_id = msg.match[1]
  	agent = msg.match[2]
  	agent_details = agents_ids[agent]
  	if not agent_details
  	  msg.send "#{agent} unknown :weary:"
  	  return
  	data = {
	  ticket: {
	    assignee_id: agent_details.id,
	    group_id: agent_details.group_id
	  }
  	}

  	zendesk_update_request msg, "tickets/#{ticket_id}.json", data, (content) ->
      msg.send "Ticket #{ticket_id} is now assigned to @#{agent}"

  robot.respond /(?:zd) (all )?tickets$/i, (msg) ->
    zendesk_request msg, queries.unsolved, (results) ->
      ticket_count = results.count
      msg.send "#{ticket_count} unsolved tickets"

  robot.respond /(?:zd) new tickets$/i, (msg) ->
    zendesk_request msg, queries.new, (results) ->
      ticket_count = results.count
      msg.send "#{ticket_count} new tickets"

  robot.respond /(?:zd) sc tickets$/i, (msg) ->
    zendesk_request msg, queries.sc, (results) ->
      ticket_count = results.count
      msg.send ":moneybag: #{ticket_count} new tickets in Solutions Consulting queue"

  robot.respond /(?:zd) ps tickets$/i, (msg) ->
    zendesk_request msg, queries.ps, (results) ->
      ticket_count = results.count
      msg.send ":wrench: #{ticket_count} new tickets in Launch (Services) queue"

  robot.respond /(?:zd) mentor tickets$/i, (msg) ->
    zendesk_request msg, queries.success, (results) ->
      ticket_count = results.count
      msg.send ":couple_with_heart: #{ticket_count} new tickets in Mentor queue"

  robot.respond /(?:zd) open tickets$/i, (msg) ->
    zendesk_request msg, queries.open, (results) ->
      ticket_count = results.count
      msg.send "#{ticket_count} open tickets"

  robot.respond /(?:zd) list (all )?tickets$/i, (msg) ->
    zendesk_request msg, queries.unsolved, (results) ->
      for result in results.results
        msg.send "Ticket #{result.id} is #{result.status}: #{tickets_url}/#{result.id}"

  robot.respond /(?:zd) list new tickets$/i, (msg) ->
    zendesk_request msg, queries.new, (results) ->
      for result in results.results
        msg.send "Ticket #{result.id} is #{result.status}: #{tickets_url}/#{result.id}"

  robot.respond /(?:zd) list sla$/i, (msg) ->
    zendesk_request msg, queries.sc, (results) ->
      ticket_count = results.count
      msg.send ":rotating_light:  #{ticket_count} tickets currently breaching our SLA"

  robot.respond /(?:zd) list open tickets$/i, (msg) ->
    zendesk_request msg, queries.open, (results) ->
      for result in results.results
        msg.send "Ticket #{result.id} is #{result.status}: #{tickets_url}/#{result.id}"

  robot.respond /(?:zd) ticket ([\d]+)$/i, (msg) ->
    ticket_id = msg.match[1]
    zendesk_request msg, "#{queries.tickets}/#{ticket_id}.json", (result) ->
      if result.error
        msg.send result.description
        return
      message = ":ticket:  #{tickets_url}/#{result.ticket.id} ##{result.ticket.id} (#{result.ticket.status.toUpperCase()})"
      message += "\n>By: #{result.ticket.author_id}"
      message += "\n>Created: #{result.ticket.created_at}"
      message += "\n>"
      message += "\n>#{result.ticket.description}"
      msg.send message