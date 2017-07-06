unit uForm1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    btnForLoopRegular: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnForLoopParallel: TButton;
    btnNonResponsive: TButton;
    btnResponsive1: TButton;
    btnFuture1: TButton;
    btnResponsive2: TButton;
    btnFuture2: TButton;
    procedure btnForLoopRegularClick(Sender: TObject);
    procedure btnForLoopParallelClick(Sender: TObject);
    procedure btnNonResponsiveClick(Sender: TObject);
    procedure btnResponsive1Click(Sender: TObject);
    procedure btnResponsive2Click(Sender: TObject);
    procedure btnFuture2Click(Sender: TObject);
    procedure btnFuture1Click(Sender: TObject);
  private
    procedure DoTimeConsumingOperation(milis: integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.Threading, // Parallel Programming Library
  System.Diagnostics; // TStopwatch

procedure TForm1.DoTimeConsumingOperation(milis: integer);
begin
  Sleep(milis);
end;

procedure TForm1.btnForLoopRegularClick(Sender: TObject);
var sw: TStopwatch; i: Integer;
begin
  sw := TStopwatch.StartNew;
  for i := 0 to 99 do
    DoTimeConsumingOperation(10);
  sw.Stop;
  (Sender as TButton).Text := sw.ElapsedMilliseconds.ToString + 'ms';
end;

procedure TForm1.btnForLoopParallelClick(Sender: TObject);
var sw: TStopwatch; i: Integer;
begin
  sw := TStopwatch.StartNew;
  TParallel.For(0, 99, procedure(i: integer)
  begin
    DoTimeConsumingOperation(10);
  end);
  sw.Stop;
  (Sender as TButton).Text := sw.ElapsedMilliseconds.ToString + 'ms';
end;

procedure TForm1.btnNonResponsiveClick(Sender: TObject);
begin
  DoTimeConsumingOperation(3000);
  (Sender as TButton).Text := 'Done';
end;

procedure TForm1.btnResponsive1Click(Sender: TObject);
var aTask: ITask;
begin
  aTask := TTask.Create(procedure
  begin
    DoTimeConsumingOperation(3000);
  end);
  aTask.Start;
  (Sender as TButton).Text := 'Done';
end;

procedure TForm1.btnResponsive2Click(Sender: TObject);
var aTask: ITask;
begin
  aTask := TTask.Create(procedure
  begin
    DoTimeConsumingOperation(3000);
    TThread.Synchronize(nil,
      procedure
      begin
       (Sender as TButton).Text := 'Done';
      end);
  end);
  aTask.Start;
end;

function GetPlannedExpenses: currency;
begin
  Sleep(1000);
  Result := 100;
end;

function GetActualExpenses: currency;
begin
  Sleep(2000);
  Result := 110;
end;

procedure TForm1.btnFuture1Click(Sender: TObject);
var
  planned, actual: currency;
  ratio: double;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;

  planned := GetPlannedExpenses;
  actual := GetActualExpenses;
  ratio := actual / planned;

  sw.Stop;
  (Sender as TButton).Text := ratio.ToString
    + ' (' +  sw.ElapsedMilliseconds.ToString + 'ms)';
end;

procedure TForm1.btnFuture2Click(Sender: TObject);
var
  planned: IFuture<currency>;
  actual: IFuture<currency>;
  ratio: double;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;

  planned := TTask.Future<currency>(function: currency
  begin
    Result := GetPlannedExpenses;
  end);

  actual := TTask.Future<currency>(function: currency
  begin
    Result := GetActualExpenses;
  end);

  ratio := actual.Value / planned.Value;

  sw.Stop;
  (Sender as TButton).Text := ratio.ToString
    + ' (' +  sw.ElapsedMilliseconds.ToString + 'ms)';
end;


end.
