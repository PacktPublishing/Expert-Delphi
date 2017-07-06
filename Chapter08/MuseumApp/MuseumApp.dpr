program MuseumApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormMuseum in 'uFormMuseum.pas' {FormMuseum},
  uBeaconInfo in 'uBeaconInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMuseum, FormMuseum);
  Application.Run;
end.
