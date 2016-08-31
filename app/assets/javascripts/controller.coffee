class Chess.Controller

  constructor: (state, view)->
    @state = state
    @view  = view
    @setup_listeners()
        
  setup_listeners: ->
    console.log "controller: setup_listeners"
     
    $(document).on "dragstart", ".piece", (e) =>
      orig_num = e.target.parentElement.dataset["num"]
      piece    = $(e.target).data("piece")
      console.log orig_num
      e.originalEvent.dataTransfer.setData("text/plain", orig_num)
      window.stuff = e
      #@view.cover_square(orig_num)
      console.log "whee"

    $(document).on "dragover", ".square", (e)=>
      console.log "dragover a square"
      e.preventDefault()

    $(document).on "drop", ".square", (e)=>
      e.preventDefault()
      orig_num =  e.originalEvent.dataTransfer.getData("text/plain")
      target_num = e.target.parentElement.dataset["num"]

      @state.make_human_move(orig_num, target_num)
      console.log "Move #{orig_num} to #{target_num}"
      console.log("drop")


