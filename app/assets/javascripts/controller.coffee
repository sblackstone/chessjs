class Chess.Controller

  constructor: (state)->
    @state = state
    @setup_listeners()
        
  setup_listeners: ->
    console.log "controller: setup_listeners"
     
