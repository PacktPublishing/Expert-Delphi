program PhotoTake;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormPhotoTake in 'uFormPhotoTake.pas' {FormPhotoTake};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPhotoTake, FormPhotoTake);
  Application.Run;
end.
