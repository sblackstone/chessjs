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

  _handle_enpassant_take: (src, dst)->
    if @at(src) == Chess.Pieces.WHITE_PAWN && dst == @enpassant()
      @set dst-16, Chess.Pieces.EMPTY

    if @at(src) == Chess.Pieces.BLACK_PAWN && dst == @enpassant()
      @set dst+16, Chess.Pieces.EMPTY


  _handle_castling_move: (src,dst) ->
    if @at(src) == Chess.Pieces.WHITE_KING && src == 4 && dst == 6
      @set 5, Chess.Pieces.WHITE_ROOK
      @set 7, Chess.Pieces.EMPTY

    if @at(src) == Chess.Pieces.WHITE_KING && src == 4 && dst == 2
      @set 3, Chess.Pieces.WHITE_ROOK
      @set 0, Chess.Pieces.EMPTY

    if @at(src) == Chess.Pieces.BLACK_KING && src == 115 && dst == 117
      @set 116, Chess.Pieces.BLACK_ROOK
      @set 119, Chess.Pieces.EMPTY

    if @at(src) == Chess.Pieces.WHITE_KING && src == 115 && dst == 113
      @set 114, Chess.Pieces.BLACK_ROOK
      @set 112, Chess.Pieces.EMPTY


      
  # s[0] = Src Square
  # s[1] = Dst Square
  # s[2] = Taken Piece
  # s[4] = Meta state (Array)

  make_move: (src,dst)->
    @move_stack.push [src, dst, @at(dst), @export_meta_state()]
    @_handle_enpassant_take(src,dst)
    @_set_enpassant_from_move(src, dst)
    @_handle_castling_move(src, dst)
    @set dst, @at src
    @set src, Chess.Pieces.EMPTY
 
  unmake_move: ->
    s           = @move_stack.pop()
    src         = s[0]
    dst         = s[1]
    taken_piece = s[2]
    meta_state  = s[3]
    moved_piece = @at dst
    diff        = dst - src
    @set src, moved_piece
    @set dst, taken_piece
    @import_meta_state meta_state

    # Unmake Enpassant gets a little tricky...
    if (moved_piece == Chess.Pieces.WHITE_PAWN) && (diff == 15 || diff == 17) and (taken_piece == Chess.Pieces.EMPTY)
      @set dst-16, Chess.Pieces.BLACK_PAWN

    if (moved_piece == Chess.Pieces.BLACK_PAWN) && (diff == -15 || diff == -17) and (taken_piece == Chess.Pieces.EMPTY)
      @set dst+16, Chess.Pieces.WHITE_PAWN


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

  run_test: ->
    setInterval Chess.View.trigger_draw, 1000
    @make_move(16, 64)
    @make_move(97, 65)
    @make_move(64, 81)
    @unmake_move()

  run_test2: ->
    setInterval Chess.View.trigger_draw, 1000
    @make_move(16, 48)    
    @make_move(99, 51)
    @make_move(20, 52)
    @make_move(52, 35)
    @unmake_move()
    
  light_up_moves: (base_sq)->
    $(".square[data-num=#{base_sq}]").css("background-color", "blue")
    for j in @moves_for_sq(base_sq)
      console.log j
      $(".square[data-num=#{j}]").css("background-color", "red")
  