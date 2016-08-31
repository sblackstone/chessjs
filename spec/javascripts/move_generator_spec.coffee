describe "Move Generator", ->
  it "can generates moves for a square", ->
    s = new Chess.State(null)
    m = new Chess.MoveGenerator(s)
    s.reset_state()
    expect(m.moves_for_sq(16)).toEqual(m.white_pawn_moves(16))
    
    s.set(1,0, Chess.Pieces.EMPTY)
    expect(m.moves_for_sq(0)).toEqual(m.rook_moves(0))
    
    s.reset_state()
    expect(m.moves_for_sq(1)).toEqual(m.knight_moves(1))
    