unit uFormCubeInCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.Controls3D;

type
  TFormCubeInCode = class(TForm3D)
    Timer1: TTimer;
    procedure Form3DRender(Sender: TObject; Context: TContext3D);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCubeInCode: TFormCubeInCode;

implementation

{$R *.fmx}

procedure TFormCubeInCode.Form3DRender(Sender: TObject; Context: TContext3D);
begin
  Context.BeginScene;
  try
    Context.DrawCube(Point3D(0,0,0), Point3D(10,10,10), 1, TAlphaColorRec.Black);
  finally
    Context.EndScene;
  end;
end;

procedure TFormCubeInCode.Timer1Timer(Sender: TObject);
begin
  self.Invalidate;
end;

end.
