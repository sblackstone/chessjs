class Chess.Board
  
  constructor: ->
    @board = []
    window.board = @ # debugging.
    @clear_board()
    @set_initial_board()

  clear_board: ->
    for i in [0..127]
      @set(i, 0)
  
  square_off_board: (sq)->
    return sq & 0x88
  
  square_on_board: (sq)->
    return !(sq & 0x88)
  
  sq_is_opp_color: (pos,color) ->
    return @sq_is_color(pos, Chess.Colors.opp_color(color))
  
  sq_is_empty: (pos) ->
    @board[pos] == Chess.Pieces.EMPTY
    
  sq_is_color: (pos, color)->
    if color == Chess.Colors.WHITE
      return @board[pos] > 0 && (@board[pos] & 0b1000) == 0
    else if color == Chess.Colors.BLACK
       return (@board[pos] & 0b1000) > 0
    else
      return false
 
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
  
  
  str_at: (i)->
    @piece_to_str @at i
  
  rank_of_square: (pos)->
    pos >> 4
  
  file_of_square: (pos)->
    pos & 7
  
  piece_to_str: (p)->
    switch p
      when Chess.Pieces.EMPTY        then "EE"
      when Chess.Pieces.WHITE_PAWN   then "&#9817;"
      when Chess.Pieces.WHITE_ROOK   then "&#9814;"
      when Chess.Pieces.WHITE_KNIGHT then "&#9816;"
      when Chess.Pieces.WHITE_BISHOP then "&#9815;"
      when Chess.Pieces.WHITE_KING   then "&#9812;"
      when Chess.Pieces.WHITE_QUEEN  then "&#9813;"
      when Chess.Pieces.BLACK_PAWN   then "&#9823;"
      when Chess.Pieces.BLACK_ROOK   then "&#9820;"
      when Chess.Pieces.BLACK_KNIGHT then "&#9822;"
      when Chess.Pieces.BLACK_BISHOP then "&#9821;"
      when Chess.Pieces.BLACK_KING   then "&#9818;"
      when Chess.Pieces.BLACK_QUEEN  then "&#9819;"
      else "QQ"
    
  dump: ->
    for r in [7..0]
      v = []
      for c in [0..7]
        v.push @piece_to_str @at_rc(r,c)
      console.log v