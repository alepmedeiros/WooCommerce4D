unit WooCommerce4D.Types;

interface

uses
  TypInfo,
  SysUtils;

type
  THttpMethod = (GET, POST, PUT, DELETE);

  TApiVersionType = (V1,V2,V3);

  TEndpointBaseType = (COUPONS, CUSTOMERS, ORDERS, PRODUCTS, PRODUCTS_ATTRIBUTES,
    PRODUCTS_CATEGORIES, PRODUCTS_SHIPPING_CLASSES, PRODUCTS_TAGS, REPORTS,
    REPORTS_SALES, REPORTS_TOP_SELLERS, TAXES, TAXES_CLASSES, WEBHOOKS);

  TApiVersionTypeHelper = record helper for TApiVersionType
    function ToString : String;
  end;

  TEndpointBaseTypeHelper = record helper for TEndpointBaseType
    function GetValue : String;
  end;

  THttpMethodHelper = record helper for THttpMethod
    function GetValue : String;
  end;

implementation

{ TApiVersionTypeHelper }

function TApiVersionTypeHelper.ToString: String;
begin
  Result := lowerCase(GetEnumName(TypeInfo(TApiVersionType), Integer(Self)));
end;

{ TEndpointBaseTypeHelper }

function TEndpointBaseTypeHelper.GetValue : String;
begin
  case Integer(Self) of
    0 : Result := 'coupons';
    1 : Result := 'customers';
    2 : Result := 'orders';
    3 : Result := 'products';
    4 : Result := 'products/attributes';
    5 : Result := 'products/categories';
    6 : Result := 'products/shipping_classes';
    7 : Result := 'products/tags';
    8 : Result := 'reports';
    9 : Result := 'reports/sales';
    10 : Result := 'reports/top_sellers';
    11 : Result := 'taxes';
    12 : Result := 'taxes/classes';
    13 : Result := 'webhooks';
  end;
end;

{ THttpMethodHelper }

function THttpMethodHelper.GetValue: String;
begin
  Result := GetEnumName(TypeInfo(THttpMethod), Integer(Self));
end;

end.
