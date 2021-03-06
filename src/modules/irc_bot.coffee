irc = require 'irc'

module.exports = (bot, config, client) ->
  unless client
    client = new irc.Client config.server, config.username,
      port: config.port
      secure: config.secure
      debug: config.debug
      channels: config.channels
      userName: config.userName
      realName: config.realName
      floodProtection: config.floodProtection
      retryDelay: config.retryDelay
      retryCount: config.retryCount
  
  client.on 'join', (channel, nick, message) ->
    bot.emit 'join', nick
  
  client.on 'part', (channel, nick, reason, message) ->
    bot.emit 'quit', nick

  client.on 'quit', (nick, reason, channel) ->
    bot.emit 'quit', nick

  client.on 'nick', (old_nick, new_nick, channels, message) ->
    bot.emit 'quit', old_nick
    bot.emit 'join', new_nick

  client.on 'names', (channel, nicks) ->
    for nick, perms of nicks
      bot.emit 'join', nick
