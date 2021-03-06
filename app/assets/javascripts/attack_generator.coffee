class Chess.AttackGenerator

  constructor: (state = null)->
    @state = state
  
  set_state: (state)->
    @state = state
  
  sliding_moves: (base_sq, vectors)->
    arr = []
    for k in vectors
      t = if (k < 0) then 0 else 119
      for sq in [(base_sq+k)..t] by k
        break if @state.square_off_board(sq)
        break if @state.square_is_color(sq, @state.turn())
        arr.push sq
        break if @state.square_is_opp_color(sq, @state.turn())
    return arr    

  jump_moves: (base_sq, vectors)->
    arr = []
    for k in vectors
      t = base_sq + k
      unless @state.square_off_board(t) || @state.square_is_color(t, @state.turn())
        arr.push t
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
    if @state.square_is_color(base_sq, Chess.Colors.WHITE)
      return @white_pawn_moves(base_sq)
    else
      return @black_pawn_moves(base_sq)

  white_pawn_moves: (base_sq)->
    moves = []

  
    if @state.square_on_board(base_sq + 15) && (@state.square_is_color(base_sq + 15, Chess.Colors.BLACK) || @state.enpassant() == (base_sq + 15))
      moves.push base_sq + 15

    if @state.square_on_board(base_sq + 17) && (@state.square_is_color(base_sq + 17, Chess.Colors.BLACK) || @state.enpassant() == (base_sq + 17))
      moves.push base_sq + 17

    return moves
      
  black_pawn_moves: (base_sq)->
    moves = []

  
    if @state.square_on_board(base_sq - 15) && (@state.square_is_color(base_sq - 15, Chess.Colors.WHITE) || @state.enpassant() == (base_sq - 15))
      moves.push base_sq - 15

    if @state.square_on_board(base_sq - 17) && (@state.square_is_color(base_sq - 17, Chess.Colors.WHITE) || @state.enpassant() == (base_sq - 17))
      moves.push base_sq - 17


    return moves

  moves_for_sq: (sq)->
    piece = @state.generic_piece_at(sq)
    return @pawn_moves(sq)    if piece == Chess.Pieces.PAWN
    return @rook_moves(sq)    if piece == Chess.Pieces.ROOK
    return @knight_moves(sq)  if piece == Chess.Pieces.KNIGHT
    return @bishop_moves(sq)  if piece == Chess.Pieces.BISHOP
    return @queen_moves(sq)   if piece == Chess.Pieces.QUEEN
    return @king_moves(sq)    if piece == Chess.Pieces.KING
    throw new Error("moves_for_sq: piece error")
              
  generate_moves: (color = @state.turn())->
    moves = {}
    for r in [0..7] 
      for c in [0..7]
        sq = r*16 + c
        if @state.square_is_color(sq, color)
          m = @moves_for_sq(sq)
          moves[sq] = m unless m.length == 0
    return moves
  