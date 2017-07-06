program GameOfMemory;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormMain in 'uFormMain.pas' {FormMain},
  uFormSettings in 'uFormSettings.pas' {FormSettings},
  uDMGameOfMem in 'uDMGameOfMem.pas' {DMGameOfMem: TDataModule},
  uGameUtils in 'uGameUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMGameOfMem, DMGameOfMem);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
