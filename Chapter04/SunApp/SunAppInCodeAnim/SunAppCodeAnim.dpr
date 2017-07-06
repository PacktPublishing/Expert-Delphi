program SunAppCodeAnim;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCodeAnim in 'uFormSunCodeAnim.pas' {FormSunCodeAnim},
  uFmxCanvasHelper in '..\uFmxCanvasHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunCodeAnim, FormSunCodeAnim);
  Application.Run;
end.
