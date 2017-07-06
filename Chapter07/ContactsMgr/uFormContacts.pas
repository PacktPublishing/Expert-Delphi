unit uFormContacts;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.AddressBook.Types, FMX.AddressBook, FMX.TabControl, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Actions, FMX.ActnList,
  FMX.Edit;

type
  TFormContacts = class(TForm)
    AddressBook1: TAddressBook;
    ActionList1: TActionList;
    TabControlMain: TTabControl;
    tbiWelcome: TTabItem;
    tbiContacts: TTabItem;
    btnShowContacts: TButton;
    ctaContacts: TChangeTabAction;
    actRefreshContacts: TAction;
    ToolBar1: TToolBar;
    lblContacts: TLabel;
    lstvwContacts: TListView;
    tbiContactDetails: TTabItem;
    ctaContactDetails: TChangeTabAction;
    ToolBar2: TToolBar;
    spdbtnBack: TSpeedButton;
    btnSave: TButton;
    edtFirstname: TEdit;
    lblFirstname: TLabel;
    edtLastname: TEdit;
    lblLastname: TLabel;
    lblContactInfo: TLabel;
    spdbtnAdd: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnShowContactsClick(Sender: TObject);
    procedure AddressBook1PermissionRequest(ASender: TObject;
      const AMessage: string; const AAccessGranted: Boolean);
    procedure actRefreshContactsExecute(Sender: TObject);
    procedure lstvwContactsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnSaveClick(Sender: TObject);
    procedure spdbtnAddClick(Sender: TObject);
    procedure lstvwContactsDeletingItem(Sender: TObject; AIndex: Integer;
      var ACanDelete: Boolean);
  private
    FCurrentContact: TAddressBookContact;
  public
    { Public declarations }
  end;

var
  FormContacts: TFormContacts;

implementation

{$R *.fmx}

{ TFormContacts }

procedure TFormContacts.actRefreshContactsExecute(Sender: TObject);
var i, aCount: integer; contacts: TAddressBookContacts; c: TAddressBookContact;
  item: TListViewItem;
begin
  contacts := TAddressBookContacts.Create;
  try
    AddressBook1.AllContacts(AddressBook1.DefaultSource, contacts);
    aCount := contacts.Count;
    lblContacts.Text := 'Contacts (' + aCount.ToString + ')';
    lstvwContacts.BeginUpdate;
    try
      lstvwContacts.Items.Clear;
      for i := 0 to aCount-1 do
      begin
        c := Contacts[i];
        item := lstvwContacts.Items.Add;
        item.Text := c.DisplayName;
        item.Tag := c.ID;
      end;
    finally
      lstvwContacts.EndUpdate;
    end;
  finally
    contacts.Free;
  end;
end;

procedure TFormContacts.AddressBook1PermissionRequest(ASender: TObject;
  const AMessage: string; const AAccessGranted: Boolean);
begin
  if AAccessGranted then
  begin
    actRefreshContacts.Execute;
    ctaContacts.Execute;
  end
  else
    ShowMessage(
      'You don''t have access to address book. The reason is: ' + aMessage);
end;

procedure TFormContacts.btnSaveClick(Sender: TObject);
begin
  if FCurrentContact <> nil then
  begin
    FCurrentContact.FirstName := edtFirstname.Text;
    FCurrentContact.LastName := edtLastname.Text;
    AddressBook1.SaveContact(FCurrentContact);
    actRefreshContacts.Execute;
  end;
end;

procedure TFormContacts.btnShowContactsClick(Sender: TObject);
begin
  if AddressBook1.Supported then
    AddressBook1.RequestPermission
  else
    ShowMessage('Address book is not supported.');
end;

procedure TFormContacts.FormCreate(Sender: TObject);
begin
  TabControlMain.ActiveTab := tbiWelcome;
end;

procedure TFormContacts.lstvwContactsDeletingItem(Sender: TObject;
  AIndex: Integer; var ACanDelete: Boolean);
var aID: integer; aDisplayName: string; msg: string;
begin
  aID := lstvwContacts.Items[AIndex].Tag;
  aDisplayName := lstvwContacts.Items[AIndex].Text;
  msg := 'Do you really want to delete current contact: ' + aDisplayName + '?';
  if MessageDlg(msg, TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrOK then
  begin
    AddressBook1.RemoveContact(aID);
    actRefreshContacts.Execute;
  end
  else
    ACanDelete := False;
end;

procedure TFormContacts.lstvwContactsItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var c: TAddressBookContact;
begin
  c := AddressBook1.ContactByID(aItem.Tag);
  FCurrentContact := c;
  edtFirstname.Text := c.FirstName;
  edtLastname.Text := c.LastName;
  ctaContactDetails.Execute;
end;

procedure TFormContacts.spdbtnAddClick(Sender: TObject);
begin
  FCurrentContact := AddressBook1.CreateContact(AddressBook1.DefaultSource);
  edtFirstname.Text := '';
  edtLastname.Text := '';
  ctaContactDetails.Execute;
end;

end.
