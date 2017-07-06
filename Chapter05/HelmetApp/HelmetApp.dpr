program HelmetApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormHelmet in 'uFormHelmet.pas' {FormHelmet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHelmet, FormHelmet);
  Application.Run;
end.
