# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  console.log "game: ready"
  window.view       = new Chess.View()
  window.state      = new Chess.State(view)    
  window.controller = new Chess.Controller(state)
  
$(document).on "turbolinks:load", ready