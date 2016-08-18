describe "king moves", ->
  it "should know the moves in an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_KING)    
    s.dump()
    expect(s.king_moves(67)).toEqual([ 68, 66, 82, 83, 84, 52, 51, 50])

  it "should know the moves when blocked by own piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_BISHOP)   
    s.set(50, Chess.Pieces.WHITE_ROOK) 
    s.dump()
    expect(s.king_moves(67)).toEqual( [ 68, 66, 82, 83, 84, 52, 51 ] )

  it "should know the moves when blocked by opponent piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_KING)   
    s.set(50, Chess.Pieces.BLACK_ROOK) 
    s.dump()
    expect(s.king_moves(67)).toEqual([ 68, 66, 82, 83, 84, 52, 51, 50])