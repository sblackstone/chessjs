describe "white pawn moves moves", ->
  it "should know the initial moves", ->
    s = new Chess.State(null)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(17)).toEqual([ 33, 49 ])

  it "cant move forward when blocked", ->
    s = new Chess.State(null)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    s.set(33, Chess.Pieces.BLACK_PAWN)
    expect(mg.pawn_moves(17)).toEqual([])


  it "should know it can take left", ->
    s = new Chess.State(null)
    s.set(32, Chess.Pieces.BLACK_PAWN)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(17)).toEqual([ 33, 32, 49 ])

  it "should know it can take right", ->
    s = new Chess.State(null)
    s.set(34, Chess.Pieces.BLACK_PAWN)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(17)).toEqual([ 33, 34, 49 ])

describe "black pawn moves moves", ->
  it "should know the initial moves", ->
    s = new Chess.State(null)
    s.set_turn(Chess.Colors.BLACK)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    s.set_turn(Chess.Colors.BLACK)
    expect(mg.pawn_moves(97)).toEqual([ 81, 65])

  it "cant move forward when blocked", ->
    s = new Chess.State(null)
    s.set_turn(Chess.Colors.BLACK)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    s.set(81, Chess.Pieces.BLACK_PAWN)
    expect(mg.pawn_moves(97)).toEqual([])


  it "should know it can take left", ->
    s = new Chess.State(null)
    s.set_turn(Chess.Colors.BLACK)
    s.set(80, Chess.Pieces.WHITE_PAWN)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(97)).toEqual([ 81, 80, 65 ])

  it "should know it can take right", ->
    s = new Chess.State(null)
    s.set_turn(Chess.Colors.BLACK)
    s.set(82, Chess.Pieces.WHITE_PAWN)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(97)).toEqual([ 81, 82, 65 ])