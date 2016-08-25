# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  console.log "game: ready"
  window.state      = new Chess.State()    
  window.view       = new Chess.View(state)
  window.controller = new Chess.Controller(state, view)
  
$(document).on "turbolinks:load", ready