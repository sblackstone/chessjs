describe "Game", ->
  describe "has move rules", ->
    it "can set the enpassant square", ->
      g = new Chess.Game()
      g.make_move(16, 48)
      expect(g.enpassant()).toBe(32)
      g.make_move(96, 64)
      expect(g.enpassant()).toBe(80)
      g.make_move(1, 34)            
      expect(g.enpassant()).toBe(-1)
  