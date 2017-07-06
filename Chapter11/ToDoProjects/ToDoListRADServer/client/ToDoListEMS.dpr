program ToDoListEMS;

uses
  System.StartUpCopy,
  FMX.Forms,
  uToDoTypes in '..\shared\uToDoTypes.pas',
  uToDoUtils in '..\shared\uToDoUtils.pas',
  uFormToDoEMS in 'uFormToDoEMS.pas' {FormToDoEMS},
  uDMToDoEMS in 'uDMToDoEMS.pas' {DMToDoEMS: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormToDoEMS, FormToDoEMS);
  Application.CreateForm(TDMToDoEMS, DMToDoEMS);
  Application.Run;
end.
