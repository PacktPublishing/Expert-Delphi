unit uGameUtils;

interface

function GameTimeToStr(Value: TTime): string;

implementation

uses
  System.SysUtils;

function Pad3Zeros(Value: string): string; inline;
var i: integer;
begin
  i := Length(Value);
  if i = 3 then
    Result := Value
  else if i = 2 then
    Result := '0' + Value
  else if i = 1 then
    Result := '00' + Value
  else
    Result := '000';
end;

function GameTimeToStr(Value: TTime): string;
var h,min,sec,msec: word; s: string;
begin
  DecodeTime(Value,h,min,sec,msec);
  s := 'Time: ';
  if h > 0 then
    s := s + h.ToString + 'h ';
  if min > 0 then
    s := s + min.ToString + 'min ';

  s := s + sec.ToString + '.' + Pad3Zeros(msec.ToString) + 's';

  Result := s;
end;

end.
