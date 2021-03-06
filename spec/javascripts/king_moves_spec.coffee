describe "king moves", ->
  it "should know the moves in the middle of an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_KING)    
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)
    expect(mg.king_moves(67)).toEqual([ 68, 66, 82, 83, 84, 52, 51, 50])

  it "should know the moves in the corner of an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(0, Chess.Pieces.WHITE_KING)    
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)
    expect(mg.king_moves(0)).toEqual([1,16,17])


  it "should know the moves when blocked by own piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_KING)   
    s.set(50, Chess.Pieces.WHITE_ROOK) 
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)
    expect(mg.king_moves(67)).toEqual( [ 68, 66, 82, 83, 84, 52, 51 ] )

  it "should know the moves when blocked by opponent piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_KING)   
    s.set(50, Chess.Pieces.BLACK_ROOK) 
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)
    expect(mg.king_moves(67)).toEqual([ 68, 66, 82, 83, 84, 52, 51, 50])