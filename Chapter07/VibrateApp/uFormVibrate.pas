unit uFormVibrate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls
{$IFDEF ANDROID}
  ,Androidapi.JNI.Os,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,
  Androidapi.JNIBridge
{$ENDIF}
{$IFDEF IOS}
  ,IOSapi.MediaPlayer,
  IOSapi.CoreGraphics,
  FMX.Platform,
  FMX.Platform.IOS,
  IOSapi.UIKit,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.Cocoatypes,
  Macapi.CoreFoundation,
  iOSapi.Foundation,
  iOSapi.CoreImage,
  iOSapi.QuartzCore,
  iOSapi.CoreData
{$ENDIF}
  ;

{$IFDEF IOS}
const
  libAudioToolbox        = '/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox';
  kSystemSoundID_vibrate = $FFF;

procedure AudioServicesPlaySystemSound( inSystemSoundID: integer ); cdecl;
  External libAudioToolbox Name _PU + 'AudioServicesPlaySystemSound';
{$ENDIF}


type
  TFormVibrate = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declaration }
  public
    { Public declaration }
  end;

var
  FormVibrate: TFormVibrate;

implementation

{$R *.fmx}

procedure TFormVibrate.Button1Click(Sender: TObject);
{$IFDEF ANDROID}
var
  aVibrator: JVibrator;
{$ENDIF}
begin
{$IFDEF ANDROID}
  aVibrator := TJVibrator.Wrap(
    (SharedActivityContext.getSystemService(
       TJContext.JavaClass.VIBRATOR_SERVICE) as ILocalObject).GetObjectID
  );
  // Vibrate for 500 milliseconds
  aVibrator.vibrate(500);
{$ENDIF}
{$IFDEF IOS}
  AudioServicesPlaySystemSound( kSystemSoundID_vibrate );
{$ENDIF}
end;

end.
