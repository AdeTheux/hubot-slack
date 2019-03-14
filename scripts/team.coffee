# Description
#   Team stuff
#
# Configuration
#   Nada
#
# Commands
#  None - trigger based
#
# Author
#	Arnaud de Theux
#
#
#module.exports = (robot) ->
#  robot.hear /\bexpenses\b/i, (msg) ->
#    msg.send "http://cdn.arnaud.detheux.org/image/320j3S2C2w2k/200.gif"
#
#  robot.hear /\btwss\b/i, (msg) ->
#    msg.send "http://cdn.arnaud.detheux.org/image/2a0z2A0R0H0c/k9rrFGA.gif"
#
#  robot.hear /\bwtf\b/i, (msg) ->
#    msg.send "http://media2.giphy.com/media/xTiTnHXbRoaZ1B1Mo8/giphy.gif"
#
#  robot.hear /\bgraham\b/i, (msg) ->
#    msg.send "Faceted knowledge base, self healing & resilience!"
#
#  robot.hear /\bcelebration\b/i, (msg) ->
#    msg.send "http://res.cloudinary.com/luizfaias-com/image/upload/v1416477820/bjorn_dancing_kvuj5s.gif"
#
#  robot.hear /\bjust working\b/i, (msg) ->
#    msg.send "http://cdn.arnaud.detheux.org/image/0s0u2i1l0m32/just_working.gif"
#
#  robot.hear /\bteam digest\b/i, (msg) ->
#    msg.send "
#-------------------------\n
#      D i g e s t \n
#-------------------------\n
#\n
#\n
#:computer: https://bluejeans.com/764992187\n
#:telephone: +1 408 740 7256\n
#Meeting ID 764992187\n
#\n
#\n
#GoToMeeting\n
#create meeting\n
#\n
#\n
#:moneybag: Solutions Consulting\n
#  • SFDC report https://zendesk.my.salesforce.com/00O800000065Cpb\n
#  • SFDC opps without SC assigned https://zendesk.my.salesforce.com/00O80000005kVrq\n
#\n
#:wrench: Launch\n
#  • SFDC PS report https://na6.salesforce.com/00O80000005kXz9\n
#  • SFDC PS - EMEA - ALL https://na6.salesforce.com/00O80000005lI8X\n
#  • Global ProServ dashboard https://na6.salesforce.com/01Z80000000zLIu\n
#  • ProServ Gaps https://na6.salesforce.com/00O80000005kk1H\n
#\n
#:buddhy: Success\n
#  • LG dashboard https://na6.salesforce.com/00O80000005kgTH\n"
#
#  robot.respond /quote toni/i, (msg) ->
#    messages = [
#          "Nanx !",
#          "Squaaaaaaare !",
#          "I've got class now"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote ben/i, (msg) ->
#    messages = [
#        "Sure has an issue with their SLA",
#        "WHAT?"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote henry/i, (msg) ->
#    messages = [
#        "Alright, I'll see you chaps tomorrow!",
#        "It's 6PM, get the fuck out!",
#        "One time, I thought I was wrong, but I was mistaken."
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote bjorn/i, (msg) ->
#    messages = [
#        "I may have forgotten to mute my microphone while in the toilets",
#        "http://f.cl.ly/items/1W3t0V3T16112g3l301U/quotes2.coffee-2.png"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote greg/i, (msg) ->
#    messages = [
#        "I'm hungry!",
#        "Big Easy anyone?"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote pierre/i, (msg) ->
#    messages = [
#        "NO.",
#        "Noiiice!",
#        "http://f.cl.ly/items/3v1d3a3n0v3L2S2B3a09/sir_doge_by_artspell-d6vtqn2.jpg",
#        "Hold on, I'm going to buy some charcuterie first",
#        "Thanks for being awesome and professional, some of you are c*nts but I love you all the same"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote luiz/i, (msg) ->
#    messages = [
#        "http://cdn.arnaud.detheux.org/image/1V1p2r1T0U3x/0BB98B4D5C1154941131222925312_37f480f752d.1.3.9693650237820407815.gif"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote max/i, (msg) ->
#    messages = [
#        "Apps."
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote leo/i, (msg) ->
#    messages = [
#        "Where is the fooking trigger?",
#        "Quick question mate"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote pim/i, (msg) ->
#    messages = [
#        "Tomatensoep!"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote elliot/i, (msg) ->
#    messages = [
#        "I am Lord Byron",
#        "http://farm3.static.flickr.com/2215/2220799035_828e3bcb2f.jpg",
#        "Go oooooon"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote arnaud/i, (msg) ->
#    messages = [
#        "http://chefmag.co.za/wp-content/uploads/2012/03/MAYONAISE.jpg",
#        "Internal note is the condom of ticket sharing"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote (nils|niels)/i, (msg) ->
#    messages = [
#        "Sacrebleu !!!"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote (andrey)/i, (msg) ->
#    messages = [
#        "водка"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
#
#  robot.respond /quote (inbox zero)/i, (msg) ->
#    messages = [
#        "http://cdn.arnaud.detheux.org/image/18432p3L090w/Screen%20Shot%202015-09-17%20at%2013.49.19.png"
#    ]
#    msg.send("#{messages[Math.floor(Math.random() * messages.length)]}")
