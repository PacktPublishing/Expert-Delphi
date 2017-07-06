unit uAnonymous;

interface

procedure DoStringProc;

implementation

uses
  uFormDemo;

type
  TStringProc = reference to procedure(s: string);

procedure CallMe(const proc: TStringProc; msg: string);
begin
  proc(msg);
end;

procedure DoStringProc;
var
  proc: TStringProc;
begin

  proc := procedure(x: string)
  begin
    Log('Declared proc got: ' + x);
  end;

  CallMe(proc, 'Hello');

  CallMe(
       procedure(v: string)
       begin
         Log('Inline code got: ' + v);
       end,
       'World');
end;

end.
