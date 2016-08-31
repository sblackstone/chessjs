describe "It has a state", ->
  it "can has a human color", ->
    s = new Chess.State(null)
    s.clear_board()
    s.set_human_color(Chess.Colors.WHITE)
    expect(s.human_color()).toEqual(Chess.Colors.WHITE)
    s.set_human_color(Chess.Colors.BLACK)
    expect(s.human_color()).toEqual(Chess.Colors.BLACK)
    