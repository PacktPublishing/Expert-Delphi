program SunAppCompAnim;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCompAnim in 'uFormSunCompAnim.pas' {FormSunCompAnim};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunCompAnim, FormSunCompAnim);
  Application.Run;
end.
