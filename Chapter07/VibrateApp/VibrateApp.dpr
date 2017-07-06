program VibrateApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormVibrate in 'uFormVibrate.pas' {FormVibrate};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormVibrate, FormVibrate);
  Application.Run;
end.
