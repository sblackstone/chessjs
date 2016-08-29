class Chess.View

  constructor: (state)->
    @state = state
    @draw()
    $(document).on "draw-board", => 
      @draw()
    
  draw: ->
    console.log "view: draw"    
    $('.cover').remove()
    for sq in $('.square')
      s = @state.str_at($(sq).data("num"))
      $(sq).find('.piece').removeClass().addClass("piece").addClass(s).data("piece", s)


  cover_square: (pos)->
    $(".square[data-num='#{pos}']").append($("<div class='cover'></div>"))


