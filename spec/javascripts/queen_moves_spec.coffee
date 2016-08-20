describe "queen moves", ->
  it "should know the moves in an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_QUEEN)    
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)        
    expect(mg.queen_moves(67)).toEqual(  [ 82, 97, 112, 84, 101, 118, 52, 37, 22, 7, 50, 33, 16, 83, 99, 115, 51, 35, 19, 3, 68, 69, 70, 71, 66, 65, 64 ])

  it "should know the moves when blocked by own piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_QUEEN)   
    s.set(50, Chess.Pieces.WHITE_PAWN) 
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)        
    expect(mg.queen_moves(67)).toEqual( [ 82, 97, 112, 84, 101, 118, 52, 37, 22, 7, 83, 99, 115, 51, 35, 19, 3, 68, 69, 70, 71, 66, 65, 64 ])

  it "should know the moves when blocked by opponent piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_QUEEN)   
    s.set(50, Chess.Pieces.BLACK_BISHOP) 

    mg = new Chess.MoveGenerator()    
    mg.set_state(s)        
    expect(mg.queen_moves(67)).toEqual( [ 82, 97, 112, 84, 101, 118, 52, 37, 22, 7, 50, 83, 99, 115, 51, 35, 19, 3, 68, 69, 70, 71, 66, 65, 64 ])