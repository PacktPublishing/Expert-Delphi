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
var memstr: TMemoryStream; resp: IHTTPResponse;
begin
  memstr := TMemoryStream.Create;
  try
    resp := NetHTTPClient1.Get(edtURL.Text, memstr);
    if resp.StatusCode = 200 then
      MemoData.Lines.LoadFromStream(memstr)
    else
      ShowMessage(resp.StatusCode.ToString + ': ' + resp.StatusText);
  finally
    memstr.Free;
  end;
end;

end.
