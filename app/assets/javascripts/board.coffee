class Chess.Board
  
  constructor: ->
    @board = []
    window.board = @ # debugging.

  clear_board: ->
    for r in [0..7]
      for c in [0..7]
        @set_rc r,c,Chess.Pieces.EMPTY
  
  reset_state: ->
    @clear_board()
    @set_initial_board()
  
  square_off_board: (sq)->
    return sq & 0x88
  
  square_color: (pos)->
    return Chess.Colors.EMPTY if @square_is_empty(pos)
    return Chess.Colors.WHITE if @board[pos] > 0 && @board[pos] < 8
    return Chess.Colors.BLACK
    
  
  square_on_board: (sq)->
    return !(sq & 0x88)
  
  square_is_opp_color: (pos,color) ->
    return @square_is_color(pos, Chess.Colors.opp_color(color))
  
  square_is_empty: (pos) ->
    @board[pos] == Chess.Pieces.EMPTY
    
  square_is_color: (pos, color)->
    return @square_color(pos) == color
 
  set_initial_board: ->
    @set 0, Chess.Pieces.WHITE_ROOK
    @set 1, Chess.Pieces.WHITE_KNIGHT
    @set 2, Chess.Pieces.WHITE_BISHOP
    @set 3, Chess.Pieces.WHITE_QUEEN
    @set 4, Chess.Pieces.WHITE_KING
    @set 5, Chess.Pieces.WHITE_BISHOP
    @set 6, Chess.Pieces.WHITE_KNIGHT
    @set 7, Chess.Pieces.WHITE_ROOK

    @set 112, Chess.Pieces.BLACK_ROOK
    @set 113, Chess.Pieces.BLACK_KNIGHT
    @set 114, Chess.Pieces.BLACK_BISHOP
    @set 115, Chess.Pieces.BLACK_KING
    @set 116, Chess.Pieces.BLACK_QUEEN
    @set 117, Chess.Pieces.BLACK_BISHOP
    @set 118, Chess.Pieces.BLACK_KNIGHT
    @set 119, Chess.Pieces.BLACK_ROOK

    for i in [16..24]
      @set i, Chess.Pieces.WHITE_PAWN

    for i in [96..103]
      @set i, Chess.Pieces.BLACK_PAWN


  
  alg_to_pos: (pos)->
    (pos[0].charCodeAt(0) - 'A'.charCodeAt(0)) * 16 + parseInt(pos[1]) - 1

  at_alg: (pos)->
    @at @alg_to_pos(pos)

  set_alg: (pos, val)->
    @set @alg_to_pos(pos), val

  rc_to_pos: (r,c)->
    r*16 + c

  at_rc: (r,c)->
    @at @rc_to_pos(r,c)

  set_rc: (r,c, val)->
    @set @rc_to_pos(r,c), val

  set: (loc, val)->
    @board[loc] = val
          
  at: (i)->
    @board[i]
  
  generic_piece_at: (pos)->
    @at(pos) & ~(1<<3)
  
  str_at: (i)->
    @piece_to_str @at i
  
  rank_of_square: (pos)->
    pos >> 4
  
  file_of_square: (pos)->
    pos & 7
  
  piece_to_str: (p)->
    switch p
      when Chess.Pieces.EMPTY        then "ee"
      when Chess.Pieces.WHITE_PAWN   then "wp"
      when Chess.Pieces.WHITE_ROOK   then "wr"
      when Chess.Pieces.WHITE_KNIGHT then "wn"
      when Chess.Pieces.WHITE_BISHOP then "wb"
      when Chess.Pieces.WHITE_KING   then "wk"
      when Chess.Pieces.WHITE_QUEEN  then "wq"
      when Chess.Pieces.BLACK_PAWN   then "bp"
      when Chess.Pieces.BLACK_ROOK   then "br"
      when Chess.Pieces.BLACK_KNIGHT then "bn"
      when Chess.Pieces.BLACK_BISHOP then "bb"
      when Chess.Pieces.BLACK_KING   then "bk"
      when Chess.Pieces.BLACK_QUEEN  then "bq"
      else "QQ"
    
  dump: ->
    for r in [7..0]
      v = []
      for c in [0..7]
        v.push @piece_to_str @at_rc(r,c)
      console.log v