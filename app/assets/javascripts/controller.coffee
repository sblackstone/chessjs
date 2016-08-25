class Chess.Controller

  constructor: (state, view)->
    @state = state
    @view  = view
    @setup_listeners()
        
  setup_listeners: ->
    console.log "controller: setup_listeners"
     
    $(document).on "dragstart", ".piece", (e) =>
      window.crap = e
      orig_num = e.target.parentElement.dataset["num"]
      piece    = $(e.target).data("piece")
      @view.cover_square(orig_num)
      i = $('<img>')
      i.src = ""
      window.crap = e
      console.log "whee"
