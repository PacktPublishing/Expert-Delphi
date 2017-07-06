program ToDoListSQLite;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormToDoSQLite in 'uFormToDoSQLite.pas' {FormToDoSQLite},
  uDMToDoSQLite in 'uDMToDoSQLite.pas' {DMToDoSQLite: TDataModule},
  uToDoTypes in 'uToDoTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormToDoSQLite, FormToDoSQLite);
  Application.CreateForm(TDMToDoSQLite, DMToDoSQLite);
  Application.Run;
end.
