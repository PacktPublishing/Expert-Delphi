program SunAppCodeStatic;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCodeStatic in 'uFormSunCodeStatic.pas' {FormSunCodeStatic};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunCodeStatic, FormSunCodeStatic);
  Application.Run;
end.
