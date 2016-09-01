describe "Board", ->
  describe "has colored pieces", ->

    it "can figure out the generic piece on a square", ->
      s = new Chess.State(null)
      expect(s.generic_piece_at(0)).toEqual(Chess.Pieces.ROOK)      
      expect(s.generic_piece_at(1)).toEqual(Chess.Pieces.KNIGHT)      
      expect(s.generic_piece_at(2)).toEqual(Chess.Pieces.BISHOP)      
      expect(s.generic_piece_at(3)).toEqual(Chess.Pieces.QUEEN)      
      expect(s.generic_piece_at(4)).toEqual(Chess.Pieces.KING)      
      expect(s.generic_piece_at(16)).toEqual(Chess.Pieces.PAWN)      
 

      expect(s.generic_piece_at(112)).toEqual(Chess.Pieces.ROOK)      
      expect(s.generic_piece_at(113)).toEqual(Chess.Pieces.KNIGHT)      
      expect(s.generic_piece_at(114)).toEqual(Chess.Pieces.BISHOP)      
      expect(s.generic_piece_at(116)).toEqual(Chess.Pieces.QUEEN)      
      expect(s.generic_piece_at(115)).toEqual(Chess.Pieces.KING)      
      expect(s.generic_piece_at(96)).toEqual(Chess.Pieces.PAWN)      


    it "can detect piece colors", ->
      s = new Chess.State(null)
      s.clear_board()
      s.set(67, Chess.Pieces.WHITE_ROOK)        
      expect(s.square_is_color(67, Chess.Colors.WHITE)).toBe(true)
      expect(s.square_is_color(67, Chess.Colors.BLACK)).toBe(false)
      s.set(67, Chess.Pieces.BLACK_ROOK)        
      expect(s.square_is_color(67, Chess.Colors.WHITE)).toBe(false)
      expect(s.square_is_color(67, Chess.Colors.BLACK)).toBe(true)
      s.set(67, Chess.Pieces.EMPTY)        
      expect(s.square_is_color(67, Chess.Colors.WHITE)).toBe(false)
      expect(s.square_is_color(67, Chess.Colors.BLACK)).toBe(false)
  
  describe "it has squares", ->
    it "can convert algebraic notation to a position", ->
      s = new Chess.State(null)
      expect(s.alg_to_pos("A1")).toEqual(0)
      expect(s.alg_to_pos("H8")).toEqual(119)
    
    it "can reference cells algebraically", ->
      s = new Chess.State(null)
      s.clear_board()
      s.set_alg("D5", Chess.Pieces.WHITE_ROOK)        
      expect(s.at_alg("D5")).toEqual(Chess.Pieces.WHITE_ROOK)
      
    it "can convert r,c to a position", ->
      s = new Chess.State(null)
      s.clear_board()
      s.set_rc(4,4, Chess.Pieces.WHITE_ROOK)
      expect(s.at_rc(4,4)).toEqual(Chess.Pieces.WHITE_ROOK)
    
    it "can get the string of the piece in its square", ->
      s = new Chess.State(null)
      s.clear_board()
      for i in [[Chess.Pieces.EMPTY,        "ee"],
                [Chess.Pieces.WHITE_PAWN,   "wp"],
                [Chess.Pieces.WHITE_KNIGHT, "wn"],
                [Chess.Pieces.WHITE_BISHOP, "wb"],
                [Chess.Pieces.WHITE_QUEEN,  "wq"],
                [Chess.Pieces.WHITE_KING,   "wk"],
                [Chess.Pieces.WHITE_ROOK,   "wr"],
                [Chess.Pieces.BLACK_PAWN,   "bp"],
                [Chess.Pieces.BLACK_KNIGHT, "bn"],
                [Chess.Pieces.BLACK_BISHOP, "bb"],
                [Chess.Pieces.BLACK_QUEEN,  "bq"],
                [Chess.Pieces.BLACK_KING,   "bk"],
                [Chess.Pieces.BLACK_ROOK,   "br"],
                ["abc123", "QQ"]]
        expect(s.piece_to_str(i[0])).toEqual(i[1])
    
    it "can take a dump", ->
      s = new Chess.State(null)
      s.clear_board()
      expect(s.dump()).toBe(undefined)
    
    it "knows the rank and file of squares", ->
      s = new Chess.State(null)
      s.clear_board()
      for f in [0..7]
        expect(s.file_of_square(f)).toBe(f)
        expect(s.rank_of_square(f*17)).toBe(f)


    
    it "knows its initial state", ->
      s = new Chess.State(null)
      s.reset_state()

      expect(s.str_at(0)).toEqual("wr")
      expect(s.str_at(1)).toEqual("wn")
      expect(s.str_at(2)).toEqual("wb")
      expect(s.str_at(3)).toEqual("wq")
      expect(s.str_at(4)).toEqual("wk")
      expect(s.str_at(5)).toEqual("wb")
      expect(s.str_at(6)).toEqual("wn")
      expect(s.str_at(7)).toEqual("wr")

      expect(s.str_at(112)).toEqual("br")
      expect(s.str_at(113)).toEqual("bn")
      expect(s.str_at(114)).toEqual("bb")
      expect(s.str_at(115)).toEqual("bk")
      expect(s.str_at(116)).toEqual("bq")
      expect(s.str_at(117)).toEqual("bb")
      expect(s.str_at(118)).toEqual("bn")
      expect(s.str_at(119)).toEqual("br")

      for i in [16..23]
        expect(s.str_at(i)).toEqual("wp")

      for i in [96..103]
        expect(s.str_at(i)).toEqual("bp")
      

