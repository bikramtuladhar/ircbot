# The modules that statbot will load.  See the README for details about which 
#   ones you'll want to use.
module.exports.statbot =
  modules: ['irc_bot', 'ticker', 'scribe', 'users', 'prophet', 'api', 'logger', 'persistence']

# All the settings for the irc_bot module.  If you are using statbot as a
#   rabbitbot module, this block can safely be deleted.
module.exports.irc_bot =
  server: 'irc.chatsansar.com'
  username: 'CsGuest1234'
  port: 6697
  secure: true
  userName: 'CsGuest1234'
  realName: 'CsGuest1234'
  floodProtection: true
  retryDelay: 2000
  retryCount: 100
  debug: true
  channels: ['#nepal']

# This configures the file that all statbot's counters are saved to.  For normal statbot, this
#  should probably be left unchanged.  If you're using statbot as a rabbitbot
#  module, change this to 'lib/statbot/data/counters'.
module.exports.persistence =
  datafile: 'data/counters'

# This controls where statbot's api server will listen.  It should either be
#   a port for the server to listen on, or the name of a unix socket file.
module.exports.api =
  listen: 3001
