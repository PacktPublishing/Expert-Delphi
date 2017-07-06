unit uGenerics;

interface

uses
  FMX.Types;

type
  TFmxProcessor<T: TFMXObject, constructor> = class
  end;

  TRecordReporter<T> = class
    procedure DoReport<T: record>(x: T);
  end;

implementation

{ TRecordReporter<T> }

procedure TRecordReporter<T>.DoReport<T>(x: T);
begin
// ...
end;

end.
