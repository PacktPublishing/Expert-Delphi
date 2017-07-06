unit uFormWebBrowser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.WebBrowser;

type
  TFormWebBrowser = class(TForm)
    ToolBar1: TToolBar;
    edtURL: TEdit;
    spdbtnGo: TSpeedButton;
    spdbtnBack: TSpeedButton;
    spdbtnForward: TSpeedButton;
    WebBrowser1: TWebBrowser;
    procedure spdbtnGoClick(Sender: TObject);
    procedure spdbtnBackClick(Sender: TObject);
    procedure spdbtnForwardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWebBrowser: TFormWebBrowser;

implementation

{$R *.fmx}

procedure TFormWebBrowser.spdbtnBackClick(Sender: TObject);
begin
  WebBrowser1.GoBack;
end;

procedure TFormWebBrowser.spdbtnForwardClick(Sender: TObject);
begin
  WebBrowser1.GoForward;
end;

procedure TFormWebBrowser.spdbtnGoClick(Sender: TObject);
begin
  WebBrowser1.Navigate(edtURL.Text);
end;

end.
