describe "knight moves", ->
  it "should know the moves in an empty board", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_KNIGHT)    
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.knight_moves(67)).toEqual([ 100, 98, 81, 85, 49, 53, 34, 36 ])

  it "should know the moves in an empty board in corner", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set(67, Chess.Pieces.WHITE_KNIGHT)    
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.knight_moves(0)).toEqual([ 33, 18 ])


  it "should know the moves when blocked by own piece", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_turn(Chess.Colors.WHITE)
    s.set(67, Chess.Pieces.WHITE_KNIGHT)   
    s.set(100, Chess.Pieces.WHITE_KING) 
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    
    expect(mg.knight_moves(67)).toEqual( [ 98, 81, 85, 49, 53, 34, 36 ])

