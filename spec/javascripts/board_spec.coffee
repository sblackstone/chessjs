describe "Board", ->
  describe "has colored pieces", ->

    it "can detect piece colors", ->
      s = new Chess.State(null)
      s.clear_board()
      s.set(67, Chess.Pieces.WHITE_ROOK)        
      expect(s.sq_is_color(67, Chess.Colors.WHITE)).toBe(true)
      expect(s.sq_is_color(67, Chess.Colors.BLACK)).toBe(false)
      s.set(67, Chess.Pieces.BLACK_ROOK)        
      expect(s.sq_is_color(67, Chess.Colors.WHITE)).toBe(false)
      expect(s.sq_is_color(67, Chess.Colors.BLACK)).toBe(true)
      s.set(67, Chess.Pieces.EMPTY)        
      expect(s.sq_is_color(67, Chess.Colors.WHITE)).toBe(false)
      expect(s.sq_is_color(67, Chess.Colors.BLACK)).toBe(false)