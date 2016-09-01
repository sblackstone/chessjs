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
  
  export_meta_state: ->
    [ @turn(), @castle_bk(), @castle_bq(), @castle_wk(), @castle_wq(), @enpassant() ]   

  import_meta_state: (s)->
    @set_turn      s[0]
    @set_castle_bk s[1]
    @set_castle_bq s[2]
    @set_castle_wk s[3]
    @set_castle_wq s[4]
    @set_enpassant s[5]
    

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

