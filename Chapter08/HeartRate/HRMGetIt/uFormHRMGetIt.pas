unit uFormHRMGetIt;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Iot.Family.BluetoothLE, Iot.Device.GenericHeartRateMonitor, FMX.StdCtrls,
  FMX.Controls.Presentation,
  // need to add these two units manually
  IoT.Family.BluetoothLE.GattTypes, System.Bluetooth;

type
  TFormHTMGetIt = class(TForm)
    BluetoothDeviceDiscoveryManager1: TBluetoothDeviceDiscoveryManager;
    GenericHeartRateMonitor1: TGenericHeartRateMonitor;
    lblHeartRate: TLabel;
    chkbxHRM: TCheckBox;
    procedure GenericHeartRateMonitor1HeartRateMeasurementUpdate(
      Sender: TObject; const Value: TGattHeartRateMeasurement);
    procedure chkbxHRMChange(Sender: TObject);
    procedure GenericHeartRateMonitor1DeviceDiscovered(const Sender: TObject;
      const ADevice: TBluetoothLEDevice);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHTMGetIt: TFormHTMGetIt;

implementation

{$R *.fmx}

procedure TFormHTMGetIt.chkbxHRMChange(Sender: TObject);
begin
  if chkbxHRM.IsChecked then
    BluetoothDeviceDiscoveryManager1.DiscoverDevices;
end;

procedure TFormHTMGetIt.GenericHeartRateMonitor1DeviceDiscovered(const Sender: TObject;
  const ADevice: TBluetoothLEDevice);
begin
  GenericHeartRateMonitor1.SubscribeHeartRateMeasurement;
end;

procedure TFormHTMGetIt.GenericHeartRateMonitor1HeartRateMeasurementUpdate(
  Sender: TObject; const Value: TGattHeartRateMeasurement);
begin
  lblHeartRate.Text :=
    'Heart Rate: ' + Value.HeartRateMeasurement.ToString + ' BPM';
end;

end.
