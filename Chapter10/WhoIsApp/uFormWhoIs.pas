unit uFormWhoIs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TFormWhoIs = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtHostName: TEdit;
    btnWhoIs: TButton;
    MemoInfo: TMemo;
    procedure btnWhoIsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWhoIs: TFormWhoIs;

implementation

{$R *.fmx}

uses whois;

procedure TFormWhoIs.btnWhoIsClick(Sender: TObject);
var s: string;
begin
  s := GetwhoisSoap.GetWhoIS(edtHostName.Text);
  MemoInfo.Lines.Clear;
  MemoInfo.Lines.Add(s);
end;

end.
