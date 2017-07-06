unit uFormEarth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.Controls3D, FMX.Objects3D, FMX.Ani,
  FMX.MaterialSources;

type
  TFormEarth = class(TForm3D)
    SphereEarth: TSphere;
    DummyScene: TDummy;
    TextureMaterialSource1: TTextureMaterialSource;
    FloatAnimation1: TFloatAnimation;
    procedure SphereEarthClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEarth: TFormEarth;

implementation

{$R *.fmx}

procedure TFormEarth.SphereEarthClick(Sender: TObject);
begin
  if SphereEarth.Position.Z < 0 then
    TAnimator.AnimateFloat(SphereEarth, 'Position.Z', 1, 0.2)
  else
    TAnimator.AnimateFloat(SphereEarth, 'Position.Z', -1, 0.2);
end;

end.
