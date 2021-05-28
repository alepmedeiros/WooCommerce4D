unit WooCommerce4D.HttpClient.ApiVersionType;

interface

uses
  TypInfo,
  SysUtils;

type
  TApiVersionType = (V1,V2,V3);

  TApiVersionTypeHelper = record helper for TApiVersionType
    function ToString : String;
  end;

implementation

{ TApiVersionTypeHelper }

function TApiVersionTypeHelper.ToString: String;
begin
  Result := lowerCase(GetEnumName(TypeInfo(TApiVersionType), Integer(Self)));
end;

end.
