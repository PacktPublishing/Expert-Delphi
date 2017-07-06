program TouchApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormTouch in 'uFormTouch.pas' {FormTouch},
  uFmxCanvasHelper in 'uFmxCanvasHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormTouch, FormTouch);
  Application.Run;
end.
