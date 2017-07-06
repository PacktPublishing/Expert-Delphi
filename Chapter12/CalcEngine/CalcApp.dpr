program CalcApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCalc in 'uFormCalc.pas' {FormCalc},
  uCalcEngine in 'uCalcEngine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCalc, FormCalc);
  Application.Run;
end.
