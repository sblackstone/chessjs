ready = ->
  console.log "game: ready"
  Chess.Board.setup_valid_squares_numbers()
  window.state      = new Chess.Game()    
  window.view       = new Chess.View(state)
  window.controller = new Chess.Controller(state, view)
  
$(document).on "turbolinks:load", ready