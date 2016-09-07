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
    expect(mg.pawn_moves(17).sort()).toEqual([ 32, 33, 49 ])

  it "should know it can take right", ->
    s = new Chess.State(null)
    s.set(34, Chess.Pieces.BLACK_PAWN)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(17).sort()).toEqual([ 33, 34, 49 ])


  it "can take left enpassant", ->
    s = new Chess.Game()
    mg = new Chess.MoveGenerator(s)    
    s.set(66, Chess.Pieces.WHITE_PAWN)
    
    s.make_move(99, 67)
        
    expect(mg.pawn_moves(66).sort()).toEqual([ 82, 83])

  it "can take right enpassant", ->
    s = new Chess.Game()
    mg = new Chess.MoveGenerator(s)    
    s.set(68, Chess.Pieces.WHITE_PAWN)
    
    s.make_move(99, 67)
        
    expect(mg.pawn_moves(68).sort()).toEqual([ 83, 84])

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
    expect(mg.pawn_moves(97).sort()).toEqual([ 65, 80, 81 ])

  it "should know it can take right", ->
    s = new Chess.State(null)
    s.set_turn(Chess.Colors.BLACK)
    s.set(82, Chess.Pieces.WHITE_PAWN)
    mg = new Chess.MoveGenerator()    
    mg.set_state(s)    
    expect(mg.pawn_moves(97).sort()).toEqual([ 65, 81, 82 ])
  
  it "can take left enpassant", ->
    s = new Chess.Game()
    mg = new Chess.MoveGenerator(s)    
    s.set(50, Chess.Pieces.BLACK_PAWN)
    
    s.make_move(17, 49)
        
    expect(mg.pawn_moves(50).sort()).toEqual([ 33, 34 ])

  it "can take right enpassant", ->
    s = new Chess.Game()
    mg = new Chess.MoveGenerator(s)    
    s.set(50, Chess.Pieces.BLACK_PAWN)
    
    s.make_move(19, 51)
        
    expect(mg.pawn_moves(50).sort()).toEqual([ 34, 35])
  
    