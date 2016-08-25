class Chess.State extends Chess.Board
  SQ_TURN      = 120
  SQ_CASTLE_BK = 121
  SQ_CASTLE_BQ = 122
  SQ_CASTLE_WK = 123
  SQ_CASTLE_WQ = 124
  SQ_ENPASSANT = 125
  
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

  clear_board: ->
    super()
    @reset_state()
  
  constructor: ()->
    window.state = @    
    super()
    @reset_state()  
            
  light_up_moves: (base_sq)->
    $(".square[data-num=#{base_sq}]").css("background-color", "blue")
    for j in @moves_for_sq(base_sq)
      console.log j
      $(".square[data-num=#{j}]").css("background-color", "red")
      