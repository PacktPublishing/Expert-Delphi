unit uFormDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo;

type
  TFormDemo = class(TForm)
    ButtonMultiline: TButton;
    btnPersonsTList: TButton;
    MemoLog: TMemo;
    btnPersonsGenerics: TButton;
    btnDoStringProc: TButton;
    btnDocAttribute: TButton;
    procedure ButtonMultilineClick(Sender: TObject);
    procedure btnPersonsTListClick(Sender: TObject);
    procedure btnPersonsGenericsClick(Sender: TObject);
    procedure btnDoStringProcClick(Sender: TObject);
    procedure btnDocAttributeClick(Sender: TObject);
  private
    procedure ClearLog;
  public
    procedure DoLog(s: string);
  end;

procedure Log(s: string);

var
  FormDemo: TFormDemo;

implementation

{$R *.fmx}

uses uPersonTList, uPersonGenerics, uAnonymous, uPerson, uDocAttribute,
  uMySuperClass, RTTI;

const EL = #13;

procedure TFormDemo.ButtonMultilineClick(Sender: TObject);
begin
  ShowMessage('Welcome!' + EL + 'Good morning!');
end;

procedure TFormDemo.ClearLog;
begin
  MemoLog.Lines.Clear;
end;

procedure TFormDemo.DoLog(s: string);
begin
  MemoLog.Lines.Add(s);
end;

procedure Log(s: string);
begin
  if FormDemo <> nil then
    FormDemo.DoLog(s);
end;

procedure TFormDemo.btnPersonsTListClick(Sender: TObject);
begin
  ClearLog;
  DoPersonsTList;
end;

procedure TFormDemo.btnPersonsGenericsClick(Sender: TObject);
begin
  ClearLog;
  DoPersonsGenerics;
end;

procedure TFormDemo.btnDoStringProcClick(Sender: TObject);
begin
  ClearLog;
  DoStringProc;
end;

procedure TFormDemo.btnDocAttributeClick(Sender: TObject);
var
  ctx : TRttiContext;
  t : TRttiType;
  m : TRttiMethod;
  a : TCustomAttribute;
begin
  ClearLog;

  ctx := TRttiContext.Create;
  try
    t := ctx.GetType(TMySuperClass);

    for a in t.GetAttributes do
          if a is DocAttribute then
            Log(Format('Type = %s; Attribute = %s, URL = %s',
              [TMySuperClass.ClassName, a.ClassName, DocAttribute(a).URL]));

    for m in t.GetMethods do
      for a in m.GetAttributes do
        if a is DocAttribute then
          Log(Format('Type = %s; Method = %s; Attribute = %s, URL = %s',
            [TMySuperClass.ClassName, m.Name, a.ClassName, DocAttribute(a).URL]));

  finally
    ctx.Free;
  end;

end;

end.
