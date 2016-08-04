class Chess.State


  reset_state: ->
    console.log "state: reset state"
      
  constructor: (view)->
    @reset_state()


    @view = view
    @view.set_state(@)



  



