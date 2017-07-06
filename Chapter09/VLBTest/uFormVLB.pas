unit uFormVLB;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components;

type
  TFormVLB = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToPropertyText: TLinkControlToProperty;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVLB: TFormVLB;

implementation

{$R *.fmx}

end.
