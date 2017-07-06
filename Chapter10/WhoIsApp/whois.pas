// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.webservicex.net/whois.asmx?WSDL
//  >Import : http://www.webservicex.net/whois.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (6-5-2017 14:56:52 - - $Rev: 90173 $)
// ************************************************************************ //

unit whois;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]


  string_         =  type string;      { "http://www.webservicex.net"[GblElm] }

  // ************************************************************************ //
  // Namespace : http://www.webservicex.net
  // soapAction: http://www.webservicex.net/GetWhoIS
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : whoisSoap
  // service   : whois
  // port      : whoisSoap
  // URL       : http://www.webservicex.net/whois.asmx
  // ************************************************************************ //
  whoisSoap = interface(IInvokable)
  ['{67C5AD14-8EFA-64B7-66E7-4AE2D3725530}']
    function  GetWhoIS(const HostName: string): string; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://www.webservicex.net
  // style     : ????
  // use       : ????
  // binding   : whoisHttpGet
  // service   : whois
  // port      : whoisHttpGet
  // ************************************************************************ //
  whoisHttpGet = interface(IInvokable)
  ['{720B35F7-9E72-030A-8FF0-B5BDB32AB3EB}']
    function  GetWhoIS(const HostName: string): string_; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://www.webservicex.net
  // style     : ????
  // use       : ????
  // binding   : whoisHttpPost
  // service   : whois
  // port      : whoisHttpPost
  // ************************************************************************ //
  whoisHttpPost = interface(IInvokable)
  ['{CC8FA150-D630-0E6A-6680-41A6D00589E8}']
    function  GetWhoIS(const HostName: string): string_; stdcall;
  end;

function GetwhoisSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): whoisSoap;
function GetwhoisHttpGet(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): whoisHttpGet;
function GetwhoisHttpPost(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): whoisHttpPost;


implementation

uses System.SysUtils;

function GetwhoisSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): whoisSoap;
const
  defWSDL = 'http://www.webservicex.net/whois.asmx?WSDL';
  defURL  = 'http://www.webservicex.net/whois.asmx';
  defSvc  = 'whois';
  defPrt  = 'whoisSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as whoisSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


function GetwhoisHttpGet(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): whoisHttpGet;
const
  defWSDL = 'http://www.webservicex.net/whois.asmx?WSDL';
  defURL  = '';
  defSvc  = 'whois';
  defPrt  = 'whoisHttpGet';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as whoisHttpGet);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


function GetwhoisHttpPost(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): whoisHttpPost;
const
  defWSDL = 'http://www.webservicex.net/whois.asmx?WSDL';
  defURL  = '';
  defSvc  = 'whois';
  defPrt  = 'whoisHttpPost';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as whoisHttpPost);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { whoisSoap }
  InvRegistry.RegisterInterface(TypeInfo(whoisSoap), 'http://www.webservicex.net', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(whoisSoap), 'http://www.webservicex.net/GetWhoIS');
  InvRegistry.RegisterInvokeOptions(TypeInfo(whoisSoap), ioDocument);
  { whoisSoap.GetWhoIS }
  InvRegistry.RegisterMethodInfo(TypeInfo(whoisSoap), 'GetWhoIS', '',
                                 '[ReturnName="GetWhoISResult"]', IS_OPTN);
  { whoisHttpGet }
  InvRegistry.RegisterInterface(TypeInfo(whoisHttpGet), 'http://www.webservicex.net', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(whoisHttpGet), '');
  { whoisHttpPost }
  InvRegistry.RegisterInterface(TypeInfo(whoisHttpPost), 'http://www.webservicex.net', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(whoisHttpPost), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(string_), 'http://www.webservicex.net', 'string_', 'string');

end.