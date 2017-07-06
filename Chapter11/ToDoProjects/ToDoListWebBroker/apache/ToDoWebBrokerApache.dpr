library ToDoWebBrokerApache;

uses
  {$IFDEF MSWINDOWS}
  Winapi.ActiveX,
  {$ENDIF }
  Web.WebBroker,
  Web.ApacheApp,
  Web.HTTPD24Impl,
  WebModuleUnit1 in '..\shared\WebModuleUnit1.pas' {WebModule1: TWebModule},
  uToDoUtils in '..\restclient\uToDoUtils.pas',
  uToDoTypes in '..\restclient\uToDoTypes.pas',
  uDMToDoS3 in '..\restclient\uDMToDoS3.pas' {DMToDoS3: TDataModule};

{$R *.res}

// httpd.conf entries:
//
(*
 LoadModule webbroker_module modules/mod_webbroker.dll

 <Location /xyz>
    SetHandler mod_webbroker-handler
 </Location>
*)
//
// These entries assume that the output directory for this project is the apache/modules directory.
//
// httpd.conf entries should be different if the project is changed in these ways:
//   1. The TApacheModuleData variable name is changed
//   2. The project is renamed.
//   3. The output directory is not the apache/modules directory
//

// Declare exported variable so that Apache can access this module.
var
  GModuleData: TApacheModuleData;
exports
  GModuleData name 'webbroker_module';

begin
{$IFDEF MSWINDOWS}
  CoInitFlags := COINIT_MULTITHREADED;
{$ENDIF}
  Web.ApacheApp.InitApplication(@GModuleData);
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.CreateForm(TDMToDoS3, DMToDoS3);
  Application.Run;
end.
