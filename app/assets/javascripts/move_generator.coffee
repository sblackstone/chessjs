class Chess.MoveGenerator extends Chess.PseudoMoveGenerator
  generate_moves: (color = @state.turn())->
    super(color)