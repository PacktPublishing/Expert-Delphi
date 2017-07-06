program VLBTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormVLB in 'uFormVLB.pas' {FormVLB};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormVLB, FormVLB);
  Application.Run;
end.
