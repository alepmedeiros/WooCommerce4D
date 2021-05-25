unit WooCommerce4D.Services.ApiVersionType;

interface

type
  TApiVersionType = (V1, V2, V3);

  TApiVersionTypeHelper = record helper for TApiVersionType
    function GetValue : String;
  end;

implementation

{ TApiVersionTypeHelper }

function TApiVersionTypeHelper.GetValue: String;
begin
  case Integer(Self) of
    0 : Result := 'v1';
    1 : Result := 'v2';
    2 : Result := 'v3';
  end;
end;

end.
