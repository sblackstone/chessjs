class Chess.State


  reset_state: ->
    @board = new Chess.Board
    console.log "state: reset state"
      
  constructor: (view)->
    @reset_state()


    @view = view
    @view.set_state(@)



  



