#
# 0 0x0000 EMPTY

# 1 0x0001 PAWN
# 2 0x0010 ROOK
# 3 0x0011 KNIGHT
# 4 0x0100 BISHOP
# 5 0x0101 QUEEN
# 6 0x0110 KING

# 9 0x1001 PAWN
# A 0x1010 ROOK
# B 0x1011 KNIGHT
# C 0x1100 BISHOP
# D 0x1101 QUEEN
# E 0x1110 KING

# Note, we define pieces generically for convience in code where
# we are not talking about a specific piece but that class of pieces.

Chess.Pieces = {
  EMPTY:         0,
  PAWN:          1,
  ROOK:          2,
  KNIGHT:        3,
  BISHOP:        4, 
  QUEEN:         5,
  KING:          6,
  WHITE_PAWN:    1,
  WHITE_ROOK:    2,
  WHITE_KNIGHT:  3,
  WHITE_BISHOP:  4,
  WHITE_QUEEN:   5,
  WHITE_KING:    6,
  BLACK_PAWN:    9,
  BLACK_ROOK:   10,
  BLACK_KNIGHT: 11,
  BLACK_BISHOP: 12,
  BLACK_QUEEN:  13,
  BLACK_KING:   14,
  
}
  
  


