class Chess.Board
  
  constructor: ->
    console.log "board: construct"
    @board = []
    window.board = @
    for i in [0..127]
      @set(i, 0)
    @set_initial_board()
    @dump()
 
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
    
  dump: ->
    for r in [7..0]
      v = []
      for c in [0..7]
        k = @at_rc(r,c)
        if k >= 0
          k = " " + k
        else
          k = "#{k}"
        v.push k
      console.log v