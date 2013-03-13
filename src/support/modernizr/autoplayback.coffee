# -----------------------------------------------------------------
# Modernizr test: audio playback can start without user interaction
# -----------------------------------------------------------------

# Note that this test is asynchronous
# - it won't set result until after a few seconds
try
  source = document.createElement 'source'
  source.setAttribute 'type', 'audio/mpeg'
  source.setAttribute 'src', 'audio/silence.mp3'
  
  # Note the absent document.body.appenChild audio
  # It works without it and this test would be very complicated it would be
  # necessary because it requires hooking into the equivalent of
  # $(document).ready event (without jQuery).
  audio = document.createElement 'audio'
  audio.appendChild source
  audio.play()

  # Just fail the test on timeout
  setTimeout(
    -> Modernizr.addTest 'autoplayback', false unless Modernizr.autoplayback?
    5000
  )
    
  audio.addEventListener 'timeupdate', ->
    if not Modernizr.autoplayback? and not isNaN(audio.currentTime) and audio.currentTime > 0
      Modernizr.addTest 'autoplayback', true
      audio.pause()
catch e
  # NOP
