program SunAppMove;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunMove in 'uFormSunMove.pas' {FormSunMove};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunMove, FormSunMove);
  Application.Run;
end.
