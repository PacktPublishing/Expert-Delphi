program SunAppCompStatic;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCompStatic in 'uFormSunCompStatic.pas' {FormSunCompStatic};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunCompStatic, FormSunCompStatic);
  Application.Run;
end.
