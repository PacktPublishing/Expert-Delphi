program CamApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCam in 'uFormCam.pas' {FormCam};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCam, FormCam);
  Application.Run;
end.
