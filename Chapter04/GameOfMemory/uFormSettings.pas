unit uFormSettings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TFormSettings = class(TForm)
    ToolBar1: TToolBar;
    spdbtnBack: TSpeedButton;
    Label1: TLabel;
    btnClear: TButton;
    lstbxTopScores: TListBox;
    lbi04: TListBoxItem;
    lbi06: TListBoxItem;
    lbi08: TListBoxItem;
    lbi10: TListBoxItem;
    lbi12: TListBoxItem;
    lbi14: TListBoxItem;
    lbi16: TListBoxItem;
    lbi18: TListBoxItem;
    procedure spdbtnBackClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
  public
    procedure ReadTopScores;
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.fmx}

uses
  uFormMain, uDMGameOfMem, uGameUtils;

procedure TFormSettings.btnClearClick(Sender: TObject);
begin
  DMGameOfMem.ClearAllScores;
  ReadTopScores;
end;

procedure TFormSettings.ReadTopScores;

procedure ShowScore(lbi: TListBoxItem; level: integer);
var t: TTime;
begin
  t := DMGameOfMem.ReadScore(level);
  if t > 0 then
    lbi.ItemData.Detail := GameTimeToStr(t)
  else
    lbi.ItemData.Detail := '';
end;

begin
  ShowScore(lbi04, 4);
  ShowScore(lbi06, 6);
  ShowScore(lbi08, 8);
  ShowScore(lbi10, 10);
  ShowScore(lbi12, 12);
  ShowScore(lbi14, 14);
  ShowScore(lbi16, 16);
  ShowScore(lbi18, 18);
end;

procedure TFormSettings.spdbtnBackClick(Sender: TObject);
begin
  FormMain.Show;
end;

end.
