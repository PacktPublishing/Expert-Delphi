unit uFormLightLevel;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Notification;

type
  TFormLightLevel = class(TForm)
    btnStartService: TButton;
    lblLux: TLabel;
    NotificationCenter1: TNotificationCenter;
    procedure NotificationCenter1ReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
    procedure btnStartServiceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLightLevel: TFormLightLevel;

implementation

{$R *.fmx}

uses
  System.Android.Service;

procedure TFormLightLevel.btnStartServiceClick(Sender: TObject);
begin
  TLocalServiceConnection.StartService('LightSensorService');
end;

procedure TFormLightLevel.NotificationCenter1ReceiveLocalNotification(
  Sender: TObject; ANotification: TNotification);
begin
  lblLux.Text := ANotification.AlertBody + ' [Lux]';
end;

end.
