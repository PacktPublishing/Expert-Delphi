unit uFormHRM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Bluetooth.Components;

type
  TFormHRM = class(TForm)
    BluetoothLE1: TBluetoothLE;
    chkbxHRM: TCheckBox;
    lblHeartRate: TLabel;
    procedure chkbxHRMChange(Sender: TObject);
    procedure BluetoothLE1EndDiscoverDevices(const Sender: TObject;
      const ADeviceList: TBluetoothLEDeviceList);
    procedure BluetoothLE1CharacteristicRead(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHRM: TFormHRM;

implementation

{$R *.fmx}

const
  HRM_SERVICE: TBluetoothUUID =
    '{0000180D-0000-1000-8000-00805F9B34FB}';

  HR_MEASUREMENT_CHARACTERISTIC: TBluetoothUUID  =
    '{00002A37-0000-1000-8000-00805F9B34FB}';

  A_TIMEOUT = 3000;

procedure TFormHRM.chkbxHRMChange(Sender: TObject);
begin
  BluetoothLE1.Enabled := chkbxHRM.IsChecked;
  if BluetoothLE1.Enabled then
    BluetoothLE1.DiscoverDevices(A_TIMEOUT, [HRM_SERVICE]);
end;

procedure TFormHRM.BluetoothLE1EndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);
var device: TBluetoothLEDevice; service: TBluetoothGattService;
  characteristic: TBluetoothGattCharacteristic;
begin
  if ADeviceList.Count > 0 then
  begin
    if aDeviceList[0].Connect then
    begin
      device := aDeviceList[0];
      ShowMessage('Connected to HRM device');
      device.DiscoverServices;
      service := BluetoothLE1.GetService(device, HR_MEASUREMENT_CHARACTERISTIC);
      if service <> nil then
      begin
        characteristic := BluetoothLE1.GetCharacteristic(service, HR_MEASUREMENT_CHARACTERISTIC);
        if characteristic <> nil then
        begin
          if BluetoothLE1.SubscribeToCharacteristic(device, characteristic) then
            ShowMessage('Subscribed to HRM characteristic')
          else
            ShowMessage('Failed to subscribe to HRM characteristic');
        end
        else
          ShowMessage('Failed to get characteristic');
      end
      else
        ShowMessage('Failed to get HRM service');
    end
    else
      ShowMessage('Failed to connect to HRM device');
  end
  else
    ShowMessage('No HRM devices discovered');
end;

procedure TFormHRM.BluetoothLE1CharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  AGattStatus: TBluetoothGattStatus);
var bytes: TBytes; v: integer;
begin
  if aGattStatus = TBluetoothGattStatus.Success then
  begin
    bytes := ACharacteristic.Value;
    if bytes[0] and $1 = 0 then // 8 bits
      v := bytes[1]
    else // 16 bits
      v := bytes[1] + (bytes[2] * 16);

    lblHeartRate.Text := 'Heart Rate: ' + v.ToString + ' BPM';
  end
  else
    ShowMessage('Gatt status is not SUCCESS. Cannot read characteristic.');
end;


end.
