unit uFormOSVer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TFormOSVer = class(TForm)
    ToolBar1: TToolBar;
    lblTitle: TLabel;
    MemoLog: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    procedure Log(s: string);
  public
    { Public declarations }
  end;

var
  FormOSVer: TFormOSVer;

implementation

{$R *.fmx}

uses uOSVerHelpers;

{ TFormOSVer }

procedure TFormOSVer.Log(s: string);
begin
  MemoLog.Lines.Add(s);
end;

procedure TFormOSVer.FormCreate(Sender: TObject);
begin
  Log('OS Architecture: ' + TOSVersion.Architecture.ToString);
  Log('OS Platform: ' + TOSVersion.Platform.ToString);
  Log('OS Name: ' + TOSVersion.Name);
  Log('OS Build: ' + TOSVersion.Build.ToString);
  Log('Version: ' + TOSVersion.Major.ToString + '.' + TOSVersion.Minor.ToString);
  Log('Service Pack: ' + TOSVersion.ServicePackMajor.ToString + '.' +
    TOSVersion.ServicePackMinor.ToString);
end;

end.
