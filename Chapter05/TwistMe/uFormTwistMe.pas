unit uFormTwistMe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Viewport3D,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Ani;

type
  TFormTwistMe = class(TForm)
    Viewport3D1: TViewport3D;
    Layer3D1: TLayer3D;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTwistMe: TFormTwistMe;

implementation

{$R *.fmx}

procedure TFormTwistMe.Button1Click(Sender: TObject);
begin
  TAnimator.AnimateFloat(Layer3D1, 'RotationAngle.X', 360, 1);
end;

end.
