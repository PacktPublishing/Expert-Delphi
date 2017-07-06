program SunAppCodeStaticHelper;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSunCodeStaticHelper in 'uFormSunCodeStaticHelper.pas' {FormSunCodeStaticHelper},
  uFmxCanvasHelper in '..\uFmxCanvasHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSunCodeStaticHelper, FormSunCodeStaticHelper);
  Application.Run;
end.
