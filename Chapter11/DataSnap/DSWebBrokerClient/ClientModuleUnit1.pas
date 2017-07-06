unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods3Client: TServerMethods3Client;
    function GetServerMethods3Client: TServerMethods3Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods3Client: TServerMethods3Client read GetServerMethods3Client write FServerMethods3Client;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FServerMethods3Client.Free;
  inherited;
end;

function TClientModule1.GetServerMethods3Client: TServerMethods3Client;
begin
  if FServerMethods3Client = nil then
    FServerMethods3Client:= TServerMethods3Client.Create(DSRestConnection1, FInstanceOwner);
  Result := FServerMethods3Client;
end;

end.
