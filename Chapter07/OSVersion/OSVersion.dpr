program OSVersion;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormOSVer in 'uFormOSVer.pas' {FormOSVer},
  uOSVerHelpers in 'uOSVerHelpers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormOSVer, FormOSVer);
  Application.Run;
end.
