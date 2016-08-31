class Chess.State extends Chess.Board
  SQ_TURN        = 120
  SQ_CASTLE_BK   = 121
  SQ_CASTLE_BQ   = 122
  SQ_CASTLE_WK   = 123
  SQ_CASTLE_WQ   = 124
  SQ_ENPASSANT   = 125
  SQ_HUMAN_COLOR = 126
  
  set_human_color: (val)->
    @board[SQ_HUMAN_COLOR] = val
          
  set_turn: (val)->
    @board[SQ_TURN] = val

  set_castle_bk: (val)->
    @board[SQ_CASTLE_BK] = val

  set_castle_bq: (val)->
    @board[SQ_CASTLE_BQ] = val

  set_castle_wk: (val)->
    @board[SQ_CASTLE_WK] = val

  set_castle_wq: (val)->
    @board[SQ_CASTLE_WQ] = val

  set_enpassant: (val)->
    @board[SQ_ENPASSANT] = val
  
  human_color: ->
    @board[SQ_HUMAN_COLOR]
    
  turn: ->
    @board[SQ_TURN]
    
  castle_bk: ->
    @board[SQ_CASTLE_BK]

  castle_bq: ->
    @board[SQ_CASTLE_BQ]

  castle_wk: ->
    @board[SQ_CASTLE_WK]

  castle_wq: ->
    @board[SQ_CASTLE_WQ]

  enpassant: ->
    @board[SQ_ENPASSANT]    

  square_under_attack: (sq)->
    cur_color = @square_color(sq)
    mv = new Chess.MoveGenerator(@)
    return false if cur_color == Chess.Colors.EMPTY
    for r in [0..7]  
      for c in [0..7]
        pos = @rc_to_pos(r,c)
        if @square_is_opp_color(pos, cur_color)
          console.log(pos)
          moves = mv.moves_for_sq(pos)
          if moves.indexOf(sq) > -1
            return true
    return false  

  dump: ->
    super()
    console.log "Turn: #{@turn()}"
    console.log "CWK: #{@castle_wk()}"
    console.log "CWQ: #{@castle_wq()}"
    console.log "CBK: #{@castle_bk()}"
    console.log "CBQ: #{@castle_bq()}"
    console.log "ENP: #{@enpassant()}"

    
  reset_state: ->
    @set_turn(Chess.Colors.WHITE)
    @set_castle_bk 1
    @set_castle_bq 1
    @set_castle_wk 1
    @set_castle_wq 1
    @set_enpassant 0
    super()
  
  constructor: ()->
    window.state = @    
    super()
    @reset_state()  

  make_move: (src,dst)->
    @set dst, @at src
    @set src, Chess.Pieces.EMPTY

  make_human_move: (src, dst)->
    mv = new Chess.MoveGenerator(@)
    moves = mv.generate_moves(@human_color())
    console.log "possibles:"
    console.log moves[src]    
    
    if moves[src].indexOf(parseInt(dst)) == -1
      console.log "bad move"
      return
          
    @make_move(src, dst)

    @set_turn Chess.Colors.opp_color(@turn())
    @make_computer_move()
    $(document).trigger("draw-board")
  
  make_computer_move: ->
    console.log "computer move time"
    $(document).trigger("draw-board")
    mv = new Chess.MoveGenerator(@)
    moves = mv.generate_moves(@turn())
    window.moves = moves
    keys = Object.keys(moves)
    window.keys = keys
    src = parseInt(keys[Math.floor(Math.random() * keys.length)])
    window.src = src
    window.crap = moves[src]
    dst = moves[src][Math.floor(Math.random() * moves[src].length)]
    window.dst = dst
    @make_move(src, dst)
    @set_turn Chess.Colors.opp_color(@turn())
    $(document).trigger("draw-board")

    
  light_up_moves: (base_sq)->
    $(".square[data-num=#{base_sq}]").css("background-color", "blue")
    for j in @moves_for_sq(base_sq)
      console.log j
      $(".square[data-num=#{j}]").css("background-color", "red")
      