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
	
  king_moves: (base_sq)->
    console.log("KING MOVES")
    moves = super(base_sq)
    if base_sq == 4 && @state.square_is_empty(3) && @state.square_is_empty(2) && @state.square_is_empty(1) && @state.castle_wq() == 1 
  	  moves.push 2

    if base_sq == 4 && @state.square_is_empty(5) && @state.square_is_empty(6) && @state.castle_wk() == 1 
	    moves.push 6

    if base_sq == 115 && @state.square_is_empty(116) && @state.square_is_empty(117) && @state.square_is_empty(118) && @state.castle_bq() == 1 
	    moves.push 118

    if base_sq == 115 && @state.square_is_empty(114) && @state.square_is_empty(113) && @state.castle_bk() == 1 
	    moves.push 113
	  		
    return(moves)
	