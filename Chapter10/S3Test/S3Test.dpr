program S3Test;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormS3 in 'uFormS3.pas' {FormS3},
  uDMS3 in 'uDMS3.pas' {DMS3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMS3, DMS3);
  Application.CreateForm(TFormS3, FormS3);
  Application.Run;
end.
