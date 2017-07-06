program MapApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormMap in 'uFormMap.pas' {FormMap};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMap, FormMap);
  Application.Run;
end.
