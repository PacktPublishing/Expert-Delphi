program INQStatsApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStats in 'uFormStats.pas' {FormStats},
  uDMStats in 'uDMStats.pas' {DMStats: TDataModule},
  uINQStatsUtils in 'uINQStatsUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStats, FormStats);
  Application.CreateForm(TDMStats, DMStats);
  Application.Run;
end.
