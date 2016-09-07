class Chess.MoveGenerator extends Chess.PseudoMoveGenerator
  generate_moves: (color = @state.turn())->
    moves = super(color)