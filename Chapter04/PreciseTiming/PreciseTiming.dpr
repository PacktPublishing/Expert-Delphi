program PreciseTiming;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormTiming in 'uFormTiming.pas' {FormTiming};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormTiming, FormTiming);
  Application.Run;
end.
