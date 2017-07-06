unit uFormSunCompAnim;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Effects;

type
  TFormSunCompAnim = class(TForm)
    rectSky: TRectangle;
    circleSun: TCircle;
    LineRay01: TLine;
    LineRay02: TLine;
    LineRay03: TLine;
    LineRay04: TLine;
    LineRay05: TLine;
    LineRay06: TLine;
    LineRay07: TLine;
    LineRay08: TLine;
    LineRay09: TLine;
    LineRay10: TLine;
    LineRay11: TLine;
    LineRay12: TLine;
    FloatAnimation1: TFloatAnimation;
    GlowEffect1: TGlowEffect;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSunCompAnim: TFormSunCompAnim;

implementation

{$R *.fmx}

procedure TFormSunCompAnim.FormCreate(Sender: TObject);
begin
  FloatAnimation1.StartValue := rectSky.Height + 150;
end;

end.
