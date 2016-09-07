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
      
    it "white can take enpassant correctly to left", ->
      g = new Chess.Game()
      g.set 68, Chess.Pieces.WHITE_PAWN
      g.set_turn Chess.Colors.BLACK
      g.make_move 99, 67
      g.set_turn Chess.Colors.WHITE
      g.make_move 68, 83
      expect(g.at(67)).toEqual(Chess.Pieces.EMPTY)  
    
    it "white can take enpassant correctly to right", ->
      g = new Chess.Game()
      g.set 66, Chess.Pieces.WHITE_PAWN
      g.set_turn Chess.Colors.BLACK
      g.make_move 99, 67
      g.set_turn Chess.Colors.WHITE
      g.make_move 66, 83
      expect(g.at(67)).toEqual(Chess.Pieces.EMPTY)
      
      
    it "black can take enpassant correctly to left", ->
      g = new Chess.Game()
      g.set 51, Chess.Pieces.BLACK_PAWN
      g.set_turn Chess.Colors.WHITE
      g.make_move 20, 52
      g.set_turn Chess.Colors.BLACK
      g.make_move 51, 36
      expect(g.at(52)).toEqual(Chess.Pieces.EMPTY)


    it "black can take enpassant correctly to right", ->
      g = new Chess.Game()
      g.set 51, Chess.Pieces.BLACK_PAWN
      g.set_turn Chess.Colors.WHITE
      g.make_move 18, 50
      g.set_turn Chess.Colors.BLACK
      g.make_move 51, 34
      expect(g.at(50)).toEqual(Chess.Pieces.EMPTY)
      

  describe "can make moves", ->
    it "knows how to move a piece", ->
      g = new Chess.Game()
      g.make_move 16,32
      expect(g.at(32)).toEqual(Chess.Pieces.WHITE_PAWN)
      expect(g.at(16)).toEqual(Chess.Pieces.EMPTY)

    it "knows how to take a piece", ->
      g = new Chess.Game()
      g.set 33, Chess.Pieces.BLACK_PAWN
      g.make_move 16, 33
      expect(g.at(16)).toEqual(Chess.Pieces.EMPTY)
      expect(g.at(33)).toEqual(Chess.Pieces.WHITE_PAWN)
      

  describe "can unmake moves", ->
    it "knows how to un-make a move without a take", ->
      g = new Chess.Game()
      g.make_move 16, 32
      expect(g.at(32)).toEqual(Chess.Pieces.WHITE_PAWN)
      expect(g.at(16)).toEqual(Chess.Pieces.EMPTY)
      g.unmake_move()
      expect(g.at(32)).toEqual(Chess.Pieces.EMPTY)
      expect(g.at(16)).toEqual(Chess.Pieces.WHITE_PAWN)
      
