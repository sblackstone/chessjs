class Chess.Controller

  constructor: (state, view)->
    @state = state
    @view  = view
    @setup_listeners()
        
  setup_listeners: ->
    console.log "controller: setup_listeners"
     
    $(document).on "dragstart", ".piece", (e) =>
      e.originalEvent.dataTransfer.effectAllowed = "move"
      window.crap = e
      orig_num = e.target.parentElement.dataset["num"]
      piece    = $(e.target).data("piece")
      i = new Image()
      i.width = 70
      i.height = 70
      piece = "wq"
      i.src = "/pieces/#{piece}.svg"
      e.originalEvent.dataTransfer.setDragImage(i, 0,0)
      #@view.cover_square(orig_num)

      window.crap = e
      console.log "whee"
