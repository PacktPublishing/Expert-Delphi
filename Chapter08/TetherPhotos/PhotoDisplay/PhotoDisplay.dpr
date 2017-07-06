program PhotoDisplay;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormPhotoDisplay in 'uFormPhotoDisplay.pas' {FormPhotoDisplay};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPhotoDisplay, FormPhotoDisplay);
  Application.Run;
end.
