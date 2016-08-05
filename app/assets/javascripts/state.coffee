class Chess.State extends Chess.Board
  STATE_SQUARE = 127
    
  reset_state: ->
    @turn          = Chess.Colors.WHITE    
    console.log "state: reset state"
  
  constructor: (view)->
    window.state = @
    console.log "state: construct"
    super()
    @reset_state()
    @view = view
    @view.set_state(@)



  



