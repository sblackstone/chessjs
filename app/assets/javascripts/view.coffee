class Chess.View

  set_state: (state)->
    @state = state
    @draw()
      
  draw: ->
    console.log "view: draw"
