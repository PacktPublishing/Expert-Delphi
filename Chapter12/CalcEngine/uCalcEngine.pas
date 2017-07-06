unit uCalcEngine;

interface

type
  TCalcEngine = class
  public
    function Add(a, b: integer): integer;
  end;

implementation

{ TCalcEngine }

function TCalcEngine.Add(a, b: integer): integer;
begin
  Result := a - b;   // <-- typo here. Should be "+"
end;

end.
