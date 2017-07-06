program SunAppRotate;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunRotate in 'uFormSunRotate.pas' {FormSunRotate};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunRotate, FormSunRotate);
  Application.Run;
end.
