class Chess.PseudoMoveGenerator extends Chess.AttackGenerator
  white_pawn_moves: (base_sq)->
    moves = super(base_sq)
    if @state.square_on_board(base_sq + 16) && @state.square_is_empty(base_sq + 16)
      moves.push base_sq + 16
    
    if @state.rank_of_square(base_sq) == 1 && @state.square_is_empty(base_sq + 16) && @state.square_is_empty(base_sq + 32)
      moves.push base_sq + 32
    
    return moves
          
  black_pawn_moves: (base_sq)->
    moves = super(base_sq)
    if @state.square_on_board(base_sq - 16) && @state.square_is_empty(base_sq - 16)
      moves.push base_sq - 16
      
    if @state.rank_of_square(base_sq) == 6 && @state.square_is_empty(base_sq - 16) && @state.square_is_empty(base_sq - 32)
      moves.push base_sq - 32
    
    return moves