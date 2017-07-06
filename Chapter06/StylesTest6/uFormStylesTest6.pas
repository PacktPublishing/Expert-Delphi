unit uFormStylesTest6;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Calendar,
  FMX.TabControl;

type
  TFormStylesTest6 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    ArcDial1: TArcDial;
    ArcDial2: TArcDial;
    ArcDial3: TArcDial;
    CheckBox1: TCheckBox;
    Switch1: TSwitch;
    Button1: TButton;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStylesTest6: TFormStylesTest6;

implementation

uses
  FMX.Objects; // TText

{$R *.fmx}

procedure TFormStylesTest6.Button1Click(Sender: TObject);
var txt: TText; obj: TFMXObject;
begin
  obj := ArcDial1.FindStyleResource('textmiddle');
  if (obj <> nil) and (obj is TText) then
  begin
    txt := TText(obj);
    txt.Text := 'Hello!';
  end;
end;

end.
