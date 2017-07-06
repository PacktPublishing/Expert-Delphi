unit uDMStyles;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls;

type
  TDMStyles = class(TDataModule)
    StyleBookAquaGraphite: TStyleBook;
    StyleBookTransparent: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMStyles: TDMStyles;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
