class Chess.View

  set_state: (state)->
    @state = state
    @draw()
      
  draw: ->
    console.log "view: draw"

    for sq in $('.square')
      s = @state.str_at($(sq).data("num"))
      $(sq).find('.piece').removeClass().addClass("piece").addClass(s)
      s = "" if s == "EE"
      $(sq).find('.piece').html s


