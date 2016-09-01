class Chess.Game extends Chess.State  
  constructor: ->
    super()
    @move_stack     = []
    @move_generator = new Chess.MoveGenerator(@)

  _set_enpassant_from_move: (src,dst) ->
    if @at(src) == Chess.Pieces.WHITE_PAWN && (dst-src) == 32
      @set_enpassant(src + 16)
    else if @at(src) == Chess.Pieces.BLACK_PAWN && (dst-src) == -32
      @set_enpassant(src - 16)
    else
      @set_enpassant(-1)

  make_move: (src,dst)->
    @move_stack.push [src, dst, @at(dst), @export_meta_state()]
    @_set_enpassant_from_move(src, dst)
    @set dst, @at src
    @set src, Chess.Pieces.EMPTY
 
  unmake_move: ->
    # TODO: PUT ENPASSANT PIECE BACK
    s = @move_stack.pop()
    src = s[0]
    dst = s[1]
    @set src, @at dst
    @set dst, s[2]
    @import_meta_state s[3]
 
  make_human_move: (src, dst)->
    return if src == dst
    src = parseInt(src)
    dst = parseInt(dst)
    moves = @move_generator.generate_moves(@human_color())
    console.log "possibles:"
    console.log moves[src]    
    
    if moves[src].indexOf(parseInt(dst)) == -1
      console.log "bad move"
      return
          
    @make_move(src, dst)

    @set_turn Chess.Colors.opp_color(@turn())
    @make_computer_move()
    Chess.View.trigger_draw()  

  make_computer_move: ->
    console.log "computer move time"
    moves = @move_generator.generate_moves(@turn())
    keys = Object.keys(moves)
    src = parseInt(keys[Math.floor(Math.random() * keys.length)])
    dst = moves[src][Math.floor(Math.random() * moves[src].length)]
    @make_move(src, dst)
    @set_turn Chess.Colors.opp_color(@turn())
    Chess.View.trigger_draw()      

    
  light_up_moves: (base_sq)->
    $(".square[data-num=#{base_sq}]").css("background-color", "blue")
    for j in @moves_for_sq(base_sq)
      console.log j
      $(".square[data-num=#{j}]").css("background-color", "red")
  