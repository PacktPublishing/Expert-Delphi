unit uDMS3;

interface

uses
  System.SysUtils, System.Classes, Data.Cloud.CloudAPI, Data.Cloud.AmazonAPI;

type
  TDMS3 = class(TDataModule)
    AmazonConnectionInfo1: TAmazonConnectionInfo;
  private
    FS3: TAmazonStorageService;
    function GetS3: TAmazonStorageService;
  public
    destructor Destroy; override;
    property S3: TAmazonStorageService read GetS3;
  end;

var
  DMS3: TDMS3;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDMS3 }

destructor TDMS3.Destroy;
begin
  FS3.Free;
  inherited;
end;

function TDMS3.GetS3: TAmazonStorageService;
begin
  if FS3 = nil then
    FS3 := TAmazonStorageService.Create(AmazonConnectionInfo1);
  Result := FS3;
end;

end.
