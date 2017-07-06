program ToDoListS3;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDMToDoS3 in 'uDMToDoS3.pas' {DMToDoS3: TDataModule},
  uToDoTypes in 'uToDoTypes.pas',
  uToDoUtils in 'uToDoUtils.pas',
  uFormToDoS3 in 'uFormToDoS3.pas' {FormToDoS3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMToDoS3, DMToDoS3);
  Application.CreateForm(TFormToDoS3, FormToDoS3);
  Application.Run;
end.
