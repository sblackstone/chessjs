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


window.blarg = (pos)->
  $(".square[data-num='#{pos}']").append($("<div class='cover'></div>"))


ready = ->
  $(document).on "dragstart", ".piece", (e)->
    window.crap = e
    e.originalEvent.dataTransfer.effectAllowed = 'move'
    
    
$(document).on "turbolinks:load", ready