unit uFormHTTP;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFormHTTP = class(TForm)
    NetHTTPClient1: TNetHTTPClient;
    ToolBar1: TToolBar;
    spdbtnDownload: TSpeedButton;
    edtURL: TEdit;
    MemoData: TMemo;
    procedure spdbtnDownloadClick(Sender: TObject);
    procedure NetHTTPClient1RequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHTTP: TFormHTTP;

implementation

{$R *.fmx}

procedure TFormHTTP.spdbtnDownloadClick(Sender: TObject);
begin
  NetHTTPClient1.Get(edtURL.Text);
  MemoData.Lines.Clear;
  MemoData.Lines.Add('Downloading...');
end;

procedure TFormHTTP.NetHTTPClient1RequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
begin
  if AResponse.StatusCode = 200 then
    MemoData.Lines.LoadFromStream(AResponse.ContentStream)
  else
    ShowMessage(AResponse.StatusCode.ToString + ': ' + AResponse.StatusText);
end;

end.
