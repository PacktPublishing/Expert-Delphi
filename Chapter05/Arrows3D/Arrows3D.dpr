program Arrows3D;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormArrows3D in 'uFormArrows3D.pas' {FormArrows3D};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormArrows3D, FormArrows3D);
  Application.Run;
end.
