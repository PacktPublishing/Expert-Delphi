unit uFormStats;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
  FMX.ScrollBox, FMX.Grid, Data.Bind.DBScope, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Edit, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Actions, FMX.ActnList,
  FMX.TabControl;

type
  TFormStats = class(TForm)
    ToolBar1: TToolBar;
    edtCountryCodes: TEdit;
    Label1: TLabel;
    spdbtnRefresh: TSpeedButton;
    TabControl1: TTabControl;
    tbiCountries: TTabItem;
    tbiPopulation: TTabItem;
    ActionList1: TActionList;
    ctaCountries: TChangeTabAction;
    ctaPopulation: TChangeTabAction;
    ToolBar2: TToolBar;
    spdbtnBack: TSpeedButton;
    lblCountry: TLabel;
    lstvwPopulation: TListView;
    lstvwCountries: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    procedure FormCreate(Sender: TObject);
    procedure spdbtnRefreshClick(Sender: TObject);
    procedure lstvwCountriesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStats: TFormStats;

implementation

{$R *.fmx}

uses uDMStats, uINQStatsUtils;

procedure TFormStats.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := tbiCountries;
end;

procedure TFormStats.lstvwCountriesItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var aList: TPopulationList; rec: TPopulation; json: string; item: TListViewItem;
begin
  DMStats.FDMemTable1.RecNo := AItem.Index + 1;
  json := DMStats.FDMemTable1.FieldByName('population').AsString;
  aList := TPopulationList.Create;
  try
    JsonToPopulationList(json, aList);
    lstvwPopulation.Items.Clear;
    for rec in aList do
    begin
      item := lstvwPopulation.Items.Add;
      item.Text := rec.Value.ToString;
      item.Detail := rec.Year.ToString;
    end;
  finally
    aList.Free;
  end;
  ctaPopulation.ExecuteTarget(self);
end;

procedure TFormStats.spdbtnRefreshClick(Sender: TObject);
begin
  DMStats.FDMemTable1.Active := False;
  DMStats.RESTResponseDataSetAdapter1.Active := False;
  DMStats.RESTRequest1.Params[2].Value := edtCountryCodes.Text;
  DMStats.RESTRequest1.Execute;
  DMStats.RESTResponseDataSetAdapter1.Active := True;
  DMStats.FDMemTable1.Active := True;
end;

end.
