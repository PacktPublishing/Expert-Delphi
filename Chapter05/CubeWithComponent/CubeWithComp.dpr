program CubeWithComp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCubeWithComp in 'uFormCubeWithComp.pas' {FormCubeWithComp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCubeWithComp, FormCubeWithComp);
  Application.Run;
end.
