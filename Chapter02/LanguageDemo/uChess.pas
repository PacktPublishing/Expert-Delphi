unit uChess;

interface

type
  TChessPiece = record
    Name: string;
    Value: Double;
  end;

const
  CHESS_PIECES_COUNT = 6;

  CHESS_PIECES: array[0..CHESS_PIECES_COUNT-1] of TChessPiece =
    (
      (Name : 'Pawn'; Value : 1),
      (Name : 'Knight'; Value : 3),
      (Name : 'Bishop'; Value : 3),
      (Name : 'Rook'; Value : 5),
      (Name : 'Queen'; Value : 9),
      (Name : 'King'; Value : 0)
    ) ;

implementation

end.
