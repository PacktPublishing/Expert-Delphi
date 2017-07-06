unit uGameOfMem;

interface

type
  TDifficultyLevel = (D3x2, D4x3, D4x4, D5x4, D6x4, D7x4);

  TBoardSize = record
    Cols, Rows: byte;
  end;

function DifficultyLevelToBoardSize(Value: TDifficultyLevel): TBoardSize;
function BoardSizeToPairsCount(bs: TBoardSize): integer;
function PairsCount(Value: TDifficultyLevel): integer;

implementation

function DifficultyLevelToBoardSize(Value: TDifficultyLevel): TBoardSize;
begin
  case Value of
    D3x2: begin Result.Cols := 3; Result.Rows := 2 end;
    D4x3: begin Result.Cols := 4; Result.Rows := 3 end;
    D4x4: begin Result.Cols := 4; Result.Rows := 4 end;
    D5x4: begin Result.Cols := 5; Result.Rows := 4 end;
    D6x4: begin Result.Cols := 6; Result.Rows := 4 end;
    D7x4: begin Result.Cols := 7; Result.Rows := 4 end;
  end;
end;

function BoardSizeToPairsCount(bs: TBoardSize): integer;
begin
  Result := (bs.Cols * bs.Rows) div 2
end;

function PairsCount(Value: TDifficultyLevel): integer;
begin
  Result := BoardSizeToPairsCount(DifficultyLevelToBoardSize(Value));
end;

end.
