program WireframeTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormWireframe in 'uFormWireframe.pas' {FormWireframe},
  uWireframe in 'uWireframe.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormWireframe, FormWireframe);
  Application.Run;
end.
