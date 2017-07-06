unit uFrameAddress;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TFrameAddress = class(TFrame)
    edtStreet: TEdit;
    lblStreet: TLabel;
    edtStreetNr: TEdit;
    lblStreetNr: TLabel;
    edtCity: TEdit;
    lblCity: TLabel;
    lblAddressTitle: TLabel;
    edtCountry: TEdit;
    lblCountry: TLabel;
    edtZipCode: TEdit;
    lblZipCode: TLabel;
  private
    procedure SetCity(const Value: string);
    procedure SetCountry(const Value: string);
    procedure SetStreet(const Value: string);
    procedure SetStreetNr(const Value: string);
    function GetCity: string;
    function GetCountry: string;
    function GetStreet: string;
    function GetStreetNr: string;
    procedure SetZipCode(const Value: string);
    function GetZipCode: string;
    { Private declarations }
  public
    property Street: string read GetStreet write SetStreet;
    property StreetNr: string read GetStreetNr write SetStreetNr;
    property ZipCode: string read GetZipCode write SetZipCode;
    property City: string read GetCity write SetCity;
    property Country: string read GetCountry write SetCountry;
  end;

implementation

{$R *.fmx}

{ TFrameAddress }

function TFrameAddress.GetCity: string;
begin
  Result := edtCity.Text;
end;

function TFrameAddress.GetCountry: string;
begin
  Result := edtCountry.Text;
end;

function TFrameAddress.GetStreet: string;
begin
  Result := edtStreet.Text;
end;

function TFrameAddress.GetStreetNr: string;
begin
  Result := edtStreetNr.Text;
end;

function TFrameAddress.GetZipCode: string;
begin
  Result := edtZipCode.Text;
end;

procedure TFrameAddress.SetCity(const Value: string);
begin
  edtCity.Text := Value;
end;

procedure TFrameAddress.SetCountry(const Value: string);
begin
  edtCountry.Text := Value;
end;

procedure TFrameAddress.SetStreet(const Value: string);
begin
  edtStreet.Text := Value;
end;

procedure TFrameAddress.SetStreetNr(const Value: string);
begin
  edtStreetNr.Text := Value;
end;

procedure TFrameAddress.SetZipCode(const Value: string);
begin
  edtZipCode.Text := Value;
end;

end.
