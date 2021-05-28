unit WooCommerce4D.Model.DTO.Coupons;

interface

uses
  JSON,
  Rest.Json,
  WooCommerce4D.Model.DTO.Interfaces, WooCommerce4D.Model.DTO.MetaData;

type
  TModelCouponsDTO = class(TInterfacedObject, iModelCouponsDTO)
    private
      FJson : TJsonObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelCouponsDTO;
      function Code(Value: String): iModelCouponsDTO; // obrigatorio
      function Amount(Value: String): iModelCouponsDTO;
      function DiscountType(Value: String): iModelCouponsDTO;
      function Description(Value: String): iModelCouponsDTO;
      function DateExpires(Value: String): iModelCouponsDTO;
      function DateExpiresGMT(Value: String): iModelCouponsDTO;
      function IndividualUse(Value: Boolean = false): iModelCouponsDTO;
      function ProductIDs(Value: String): iModelCouponsDTO; // array de ids
      function ExcludedProductIDs(Value: String): iModelCouponsDTO;// array de ids
      function UsageLimit(Value: Integer): iModelCouponsDTO;
      function UsageLimitPerUser(Value: Integer): iModelCouponsDTO;
      function LimitUsageToXItems(Value: Integer): iModelCouponsDTO;
      function FreeShipping(Value: Boolean = false): iModelCouponsDTO;
      function ProductCategories(Value: String): iModelCouponsDTO; // array de ids
      function ExcludedProductCategories(Value: String): iModelCouponsDTO;// array de ids
      function ExcludedSaleItems(Value: Boolean): iModelCouponsDTO;
      function MinimunAmount(Value: String): iModelCouponsDTO;
      function MaximumAmount(Value: String): iModelCouponsDTO;
      function EmailRestrictions(Value: String): iModelCouponsDTO; // array de ids
      function MetaData: iModelMetaDataDTO<iModelCouponsDTO>;
      function &End: iModelCouponsDTO;
  end;

implementation

function TModelCouponsDTO.Amount(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('amount', value);
end;

function TModelCouponsDTO.Code(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('code', value);
end;

function TModelCouponsDTO.&End: iModelCouponsDTO;
begin
  Result := Self;
end;

constructor TModelCouponsDTO.Create;
begin
  FJson := TJsonObject.Create;
end;

function TModelCouponsDTO.DateExpires(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('date_expires', value);
end;

function TModelCouponsDTO.DateExpiresGMT(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('date_expires_gmt', value);
end;

function TModelCouponsDTO.Description(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('description', value);
end;

destructor TModelCouponsDTO.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelCouponsDTO.DiscountType(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('discount_type', value);
end;

function TModelCouponsDTO.EmailRestrictions(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('email_restrictions', value);
end;

function TModelCouponsDTO.ExcludedProductCategories(
  Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('exclude_product_categories', value);
end;

function TModelCouponsDTO.ExcludedProductIDs(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('excluded_product_ids', value);
end;

function TModelCouponsDTO.ExcludedSaleItems(Value: Boolean): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('exclude_sale_items', TJSONBool.Create(value));
end;

function TModelCouponsDTO.FreeShipping(Value: Boolean): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('free_shipping', TJSONBool.Create(value));
end;

function TModelCouponsDTO.IndividualUse(Value: Boolean): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('individual_use', TJSONBool.Create(value));
end;

function TModelCouponsDTO.LimitUsageToXItems(Value: Integer): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('limit_usage_to_x_items', TJSONNumber.Create(value));
end;

function TModelCouponsDTO.MaximumAmount(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('maximum_amount', value);
end;

function TModelCouponsDTO.MetaData: iModelMetaDataDTO<iModelCouponsDTO>;
begin
  Result := TModelMetadataDTO<iModelCouponsDTO>.New(Self);
end;

function TModelCouponsDTO.MinimunAmount(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('minimum_amount', value);
end;

class function TModelCouponsDTO.New : iModelCouponsDTO;
begin
  Result := Self.Create;
end;

function TModelCouponsDTO.ProductCategories(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('product_categories', value);
end;

function TModelCouponsDTO.ProductIDs(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('product_ids', value);
end;

function TModelCouponsDTO.UsageLimit(Value: Integer): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('usage_limit', TJSONNumber(value));
end;

function TModelCouponsDTO.UsageLimitPerUser(Value: Integer): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('usage_limit_per_user', TJSONNumber.Create(value));
end;

end.
