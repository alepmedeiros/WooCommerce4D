unit WooCommerce4D.HttpClient.HttpMethod;

interface

uses
  TypInfo;

type
  THttpMethod = (GET, POST, PUT, DELETE);

  THttpMethodHelper = record helper for THttpMethod
    function GetValue : String;
  end;

implementation

{ THttpMethodHelper }

function THttpMethodHelper.GetValue: String;
begin
  Result := GetEnumName(TypeInfo(THttpMethod), Integer(Self));
end;

end.
