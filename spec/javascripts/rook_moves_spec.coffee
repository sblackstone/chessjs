describe "rook moves", ->
  it "should know the moves in an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_ROOK)    
    s.dump()
    expect(s.rook_moves(67)).toEqual( [ 83, 99, 115, 51, 35, 19, 3, 68, 69, 70, 71, 66, 65, 64 ])

  it "should know the moves when blocked by own piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_ROOK)   
    s.set(65, Chess.Pieces.WHITE_KING) 
    s.dump()
    expect(s.rook_moves(67)).toEqual( [ 83, 99, 115, 51, 35, 19, 3, 68, 69, 70, 71, 66 ])

  it "should know the moves when blocked by opponent piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_ROOK)   
    s.set(65, Chess.Pieces.BLACK_ROOK) 
    s.dump()
    expect(s.rook_moves(67)).toEqual( [ 83, 99, 115, 51, 35, 19, 3, 68, 69, 70, 71, 66, 65 ])