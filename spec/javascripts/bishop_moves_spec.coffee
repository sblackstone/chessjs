describe "bishop moves", ->
  it "should know the moves in an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_BISHOP)    
    mg = new Chess.MoveGenerator(s)      
    expect(mg.bishop_moves(67)).toEqual(  [ 82, 97, 112, 84, 101, 118, 52, 37, 22, 7, 50, 33, 16 ])

  it "should know the moves when blocked by own piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_BISHOP)   
    s.set(50, Chess.Pieces.WHITE_PAWN) 
    mg = new Chess.MoveGenerator(s)    
    expect(mg.bishop_moves(67)).toEqual( [ 82, 97, 112, 84, 101, 118, 52, 37, 22, 7 ])

  it "should know the moves when blocked by opponent piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_BISHOP)   
    s.set(50, Chess.Pieces.BLACK_BISHOP) 
    mg = new Chess.MoveGenerator(s)    
    expect(mg.bishop_moves(67)).toEqual( [ 82, 97, 112, 84, 101, 118, 52, 37, 22, 7, 50 ])