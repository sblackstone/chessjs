class Chess.State


  reset_state: ->
    @board = new Chess.Board
    console.log "state: reset state"
      
  constructor: (view)->
    window.state = @
    @reset_state()


    @view = view
    @view.set_state(@)



  



