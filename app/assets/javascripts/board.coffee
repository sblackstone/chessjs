class Chess.Board
  
  constructor: ->
    console.log "board: construct"
    @_board = []
    for i in [0..63]
      @_board.push 'E'

  at: (row,col)->
    if typeof(row) == 'object'
      return @at row[0], row[1]
    else
      @board[row*8 + col]