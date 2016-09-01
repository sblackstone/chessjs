class Chess.Game extends Chess.State  
  constructor: ->
    super()
    @move_stack     = []
    @move_generator = new Chess.MoveGenerator(@)

  trigger_draw: ->
    $(document).trigger("draw-board")

  make_move: (src,dst)->
    @move_stack.push [src, dst, @at(dst), @export_meta_state()]
    console.log @move_stack
    @set dst, @at src
    @set src, Chess.Pieces.EMPTY
 
  unmake_move: ->
    s = @move_stack.pop()
    src = s[0]
    dst = s[1]
    @set src, @at dst
    @set dst, s[2]
    @import_meta_state s[3]
 
  make_human_move: (src, dst)->
    return if src == dst
    moves = @move_generator.generate_moves(@human_color())
    console.log "possibles:"
    console.log moves[src]    
    
    if moves[src].indexOf(parseInt(dst)) == -1
      console.log "bad move"
      return
          
    @make_move(src, dst)

    @set_turn Chess.Colors.opp_color(@turn())
    @make_computer_move()
    @trigger_draw()
  
  make_computer_move: ->
    console.log "computer move time"
    @trigger_draw()
    moves = @move_generator.generate_moves(@turn())
    keys = Object.keys(moves)
    src = parseInt(keys[Math.floor(Math.random() * keys.length)])
    dst = moves[src][Math.floor(Math.random() * moves[src].length)]
    @make_move(src, dst)
    @set_turn Chess.Colors.opp_color(@turn())

    
  light_up_moves: (base_sq)->
    $(".square[data-num=#{base_sq}]").css("background-color", "blue")
    for j in @moves_for_sq(base_sq)
      console.log j
      $(".square[data-num=#{j}]").css("background-color", "red")
  