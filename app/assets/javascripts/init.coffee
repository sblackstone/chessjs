ready = ->
  console.log "game: ready"
  window.state      = new Chess.Game()    
  window.view       = new Chess.View(state)
  window.controller = new Chess.Controller(state, view)
  
$(document).on "turbolinks:load", ready