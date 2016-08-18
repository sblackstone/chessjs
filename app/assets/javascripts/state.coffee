class Chess.State extends Chess.Board
  SQ_TURN      = 120
  SQ_CASTLE_BK = 121
  SQ_CASTLE_BQ = 122
  SQ_CASTLE_WK = 123
  SQ_CASTLE_WQ = 124
  SQ_ENPASSANT = 125
  
  set_turn: (val)->
    @board[SQ_TURN] = val

  set_castle_bk: (val)->
    @board[SQ_CASTLE_BK] = val

  set_castle_bq: (val)->
    @board[SQ_CASTLE_BQ] = val

  set_castle_wk: (val)->
    @board[SQ_CASTLE_WK] = val

  set_castle_wq: (val)->
    @board[SQ_CASTLE_WQ] = val

  set_enpassant: (val)->
    @board[SQ_ENPASSANT] = val
  
  
  turn: ->
    @board[SQ_TURN]
    
  castle_bk: ->
    @board[SQ_CASTLE_BK]

  castle_bq: ->
    @board[SQ_CASTLE_BQ]

  castle_wk: ->
    @board[SQ_CASTLE_WK]

  castle_wq: ->
    @board[SQ_CASTLE_WQ]

  enpassant: ->
    @board[SQ_ENPASSANT]    

  dump: ->
    super()
    console.log "Turn: #{@turn()}"
    console.log "CWK: #{@castle_wk()}"
    console.log "CWQ: #{@castle_wq()}"
    console.log "CBK: #{@castle_bk()}"
    console.log "CBQ: #{@castle_bq()}"
    console.log "ENP: #{@enpassant()}"

    
  reset_state: ->
    console.log "state: reset state"
    @set_turn(Chess.Colors.WHITE)
    @set_castle_bk 1
    @set_castle_bq 1
    @set_castle_wk 1
    @set_castle_wq 1
    @set_enpassant 0

  
  constructor: (view)->
    window.state = @
    console.log "state: construct"
    super()
    @reset_state()
    @view = view
    unless @view == null
      @view.set_state(@)
    @dump()
  
  #####
  #####
  
  square_off_board: (sq)->
    return sq & 0x88
  
  
  sliding_moves: (base_sq, vectors)->
    arr = []
    for k in vectors
      t = if (k < 0) then 0 else 119
      for sq in [(base_sq+k)..t] by k
        break if @square_off_board(sq)
        console.log @turn()
        break if @sq_is_color(sq, @turn())
        arr.push sq
        break if @sq_is_opp_color(sq, @turn())
    return arr    

  jump_moves: (base_sq, vectors)->
    arr = []
    for k in vectors
      arr.push (base_sq + k) unless @square_off_board(base_sq+k)
    return arr    
    

  bishop_moves: (base_sq)->
    @sliding_moves(base_sq, [15, 17, -15, -17])
  
  rook_moves: (base_sq)->
    @sliding_moves(base_sq, [16, -16, 1, -1])

  queen_moves: (base_sq)->
    @sliding_moves(base_sq, [15, 17, -15, -17, 16, -16, 1, -1])

  knight_moves: (base_sq)->
    @jump_moves(base_sq, [33, 31, 14, 18, -18, -14, -33, -31])
    
  king_moves: (base_sq)->
    @jump_moves(base_sq, [1, -1, 15, 16, 17, -15, -16, -17])
  
  pawn_moves: (base_sq)->
    if @turn() == Chess.Colors.WHITE
      @white_pawn_moves(base_sq)
      console.log "white pawns"
    else
      console.log "black pawns"
      @black_pawn_moves(base_sq)

  white_pawn_moves: (base_sq)->
    moves = @jump_moves(base_sq, [16])
    if @sq_is_color(base_sq + 15, Chess.Colors.BLACK)
      moves.push base_sq + 15

    if @sq_is_color(base_sq + 17, Chess.Colors.BLACK)
      moves.push base_sq + 17

    return moves
      
  black_pawn_moves: (base_sq)->
    moves = @jump_moves(base_sq, [-16])
    if @sq_is_color(base_sq - 15, Chess.Colors.WHITE)
      moves.push base_sq - 15

    if @sq_is_color(base_sq - 17, Chess.Colors.WHITE)
      moves.push base_sq - 17
    return moves

  
    
        
  light_up_moves: (base_sq, fn)->
    $(".square[data-num=#{base_sq}]").css("background-color", "blue")
    for j in @pawn_moves(base_sq)
      $(".square[data-num=#{j}]").css("background-color", "red")
      