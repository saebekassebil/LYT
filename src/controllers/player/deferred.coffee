# Requires `/controllers/player/command`
# --------------------------------------

# ########################################################################### #
# Wrap a jQuery.Deferred() into a LYT.player.Command object                   #
# ########################################################################### #

class LYT.player.Command.Deferred extends LYT.player.Command

  # Using def in stead of deferred due to name clash when coffeescript
  # compiles to JavaScript
  constructor: (el, def) ->
    super el, def
