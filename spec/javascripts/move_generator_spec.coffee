describe "Move Generator", ->
  it "can generates moves for a square", ->
    s = new Chess.State(null)
    m = new Chess.MoveGenerator(s)
    s.reset_state()
    expect(m.moves_for_sq(16)).toEqual(m.white_pawn_moves(16))
    
    s.set(1,0, Chess.Pieces.EMPTY)
    expect(m.moves_for_sq(0)).toEqual(m.rook_moves(0))
    
    s.reset_state()
    console.log m.knight_moves(1)
    expect(m.moves_for_sq(1)).toEqual(m.knight_moves(1))


    s.reset_state()
    s.set_rc(1,1, Chess.Pieces.EMPTY)
    s.set_rc(1,3, Chess.Pieces.EMPTY)
    expect(m.moves_for_sq(2)).toEqual(m.bishop_moves(2))
    
    s.reset_state()
    s.set_rc(1,2, Chess.Pieces.EMPTY)
    s.set_rc(1,3, Chess.Pieces.EMPTY)
    s.set_rc(1,4, Chess.Pieces.EMPTY)
    expect(m.moves_for_sq(3)).toEqual(m.queen_moves(3))

    s.reset_state()
    s.set_rc(1,3, Chess.Pieces.EMPTY)
    s.set_rc(1,4, Chess.Pieces.EMPTY)
    s.set_rc(1,5, Chess.Pieces.EMPTY)
    expect(m.moves_for_sq(4)).toEqual(m.king_moves(4))
    
    expect(-> m.moves_for_sq(35)).toThrow()