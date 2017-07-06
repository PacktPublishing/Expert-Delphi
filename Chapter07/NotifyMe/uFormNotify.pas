unit uFormNotify;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Notification, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.EditBox, FMX.NumberBox;

type
  TFormNotify = class(TForm)
    NotificationCenter1: TNotificationCenter;
    ToolBar1: TToolBar;
    lblTitle: TLabel;
    Edit1: TEdit;
    btnNotify: TButton;
    procedure btnNotifyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNotify: TFormNotify;

implementation

{$R *.fmx}

procedure TFormNotify.btnNotifyClick(Sender: TObject);
var n: TNotification;
begin
  n := NotificationCenter1.CreateNotification;
  try
    n.Name := 'MY_APP_NOTIFICATION_1';
    n.Title := 'Notify Me App';
    n.AlertBody := 'This is an important notification from Delphi!';
    NotificationCenter1.PresentNotification(n);
  finally
    n.Free;
  end;
end;

end.
