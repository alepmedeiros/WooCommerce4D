unit WooCommerce4D.Model.DTO.Products;

interface

uses
  JSON,
  DateUtils,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types,
  WooCommerce4D.Model.DTO.MetaData,
  WooCommerce4D.Model.DTO.Attributes,
  WooCommerce4D.Model.DTO.Categories,
  WooCommerce4D.Model.DTO.DefaultAttributes,
  WooCommerce4D.Model.DTO.Dimensions, WooCommerce4D.Model.DTO.Downloads,
  WooCommerce4D.Model.DTO.Images, WooCommerce4D.Model.DTO.Tags;

type
  TModelProductDTO = class(TInterfacedObject, iModelProductDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductDTO;
      function Name(Value: String): iModelProductDTO;
      function Slug(Value: String): iModelProductDTO;
      function _Type(Value: TStatusType = SIMPLE): iModelProductDTO;
      function Status(Value: TStatusType = PUBLISH): iModelProductDTO;
      function Featured(Value: Boolean = false): iModelProductDTO;
      function CatalogVisibility(Value: TStatusType): iModelProductDTO;
      function Description(Value: String): iModelProductDTO;
      function ShortDescription(Value: String): iModelProductDTO;
      function Sku(Value: String): iModelProductDTO;
      function RegularPrice(Value: String): iModelProductDTO;
      function DateOnSaleFrom(Value: TDateTime): iModelProductDTO;
      function DateOnSaleFromGMT(Value: TDateTime): iModelProductDTO;
      function DateOnSaleTo(Value: TDateTime): iModelProductDTO;
      function DateOnSaleToGMT(Value: TDateTime): iModelProductDTO;
      function _Virtual(Value: Boolean = false): iModelProductDTO;
      function Downloadable(Value: Boolean = false): iModelProductDTO;
      function Downlaods: iModelDownloasDTO<iModelProductDTO>;
      function DownloadLimit(Value: Integer = -1): iModelProductDTO;
      function DownloadExpiry(Value: Integer = -1): iModelProductDTO;
      function ExternalUrl(Value: String): iModelProductDTO;
      function Buttontext(Value: String): iModelProductDTO;
      function taxStatus(Value: TStatusType = TAXABLE): iModelProductDTO;
      function TaxClass(Value: String): iModelProductDTO;
      function ManageStock(Value: Boolean = false): iModelProductDTO;
      function StockQuantity(Value: Integer): iModelProductDTO;
      function StockStatus(Value: TStatusType): iModelProductDTO;
      function BackOrders(Value: TStatusType = NO): iModelProductDTO;
      function SoldIndividualy(Value : Boolean = false) : iModelProductDTO;
      function Weight(Value : String) : iModelProductDTO;
      function Dimensions : iModelDimensionsDTO<iModelProductDTO>;
      function ShippingClass(Value : Boolean) : iModelProductDTO;
      function ReviewsAllowed(Value : Boolean = true) : iModelProductDTO;
      function UpsellIds(Value : String) : iModelProductDTO;//array ids
      function CrossSellIds(Value : String) : iModelProductDTO;//array ids
      function ParentId(Value : Integer) : iModelProductDTO;
      function PurchaseNote(Value : String) : iModelProductDTO;
      function Categories : iModelCategoriesDTO<iModelProductDTO>;
      function Tags : iModelTagsDTO<iModelProductDTO>;
      function Images : iModelImagesDTO<iModelProductDTO>;
      function Attributes : iModelAttributesDTO<iModelProductDTO>;
      function DefaultAttributes : iModelDefaultAttributesDTO<iModelProductDTO>;
      function GroupedProducts(Value : String) : iModelProductDTO;
      function MenuOrder(Value : integer) : iModelProductDTO;
      function MetaData : iModelMetaDataDTO<iModelProductDTO>;
      function &End: iModelProductDTO;
  end;

implementation

function TModelProductDTO.Attributes: iModelAttributesDTO<iModelProductDTO>;
begin
  Result := TModelAttributesDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.BackOrders(Value: TStatusType): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('backorders',Value.GetValue);
end;

function TModelProductDTO.Buttontext(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('button_text',Value);
end;

function TModelProductDTO.CatalogVisibility(
  Value: TStatusType): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('catalogo_visibility',Value.GetValue);
end;

function TModelProductDTO.Categories: iModelCategoriesDTO<iModelProductDTO>;
begin
  result := TModelCategoriesDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.&End: iModelProductDTO;
begin
  Result := Self;
end;

constructor TModelProductDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelProductDTO.CrossSellIds(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('cross_sell_ids',Value);
end;

function TModelProductDTO.DateOnSaleFrom(Value: TDateTime): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_from', DateToISO8601(Value));
end;

function TModelProductDTO.DateOnSaleFromGMT(Value: TDateTime): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_from', DateToISO8601(Value));
end;

function TModelProductDTO.DateOnSaleTo(Value: TDateTime): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_to', DateToISO8601(Value));
end;

function TModelProductDTO.DateOnSaleToGMT(Value: TDateTime): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_gmt', DateToISO8601(Value));
end;

function TModelProductDTO.DefaultAttributes: iModelDefaultAttributesDTO<iModelProductDTO>;
begin
  Result := TModelDefaultAttributesDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.Description(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('description', Value);
end;

destructor TModelProductDTO.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelProductDTO.Dimensions: iModelDimensionsDTO<iModelProductDTO>;
begin
  Result := TModelDimensionsDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.Downlaods: iModelDownloasDTO<iModelProductDTO>;
begin
  Result := TModelDownloasDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.Downloadable(Value: Boolean): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('downloadable', TJsonBool.Create(Value));
end;

function TModelProductDTO.DownloadExpiry(Value: Integer): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('download_expiry', TJSONNumber(Value));
end;

function TModelProductDTO.DownloadLimit(Value: Integer): iModelProductDTO;
begin
    Result := Self;
  FJSON.AddPair('download_limit', TJSONNumber.Create(Value));
end;

function TModelProductDTO.ExternalUrl(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('extermal_url', Value);
end;

function TModelProductDTO.Featured(Value: Boolean): iModelProductDTO;
begin
Result := Self;
  FJSON.AddPair('featured', TJSONBool.Create(Value));
end;

function TModelProductDTO.GroupedProducts(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('grouped_products', Value);
end;

function TModelProductDTO.Images: iModelImagesDTO<iModelProductDTO>;
begin
  Result := TModelImagesDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.ManageStock(Value: Boolean): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('manage_stock', TJSONBool.Create(Value));
end;

function TModelProductDTO.MenuOrder(Value: integer): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('menu_order', TJSONNumber.Create(Value));
end;

function TModelProductDTO.MetaData: iModelMetaDataDTO<iModelProductDTO>;
begin
  Result := TModelMetaDataDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.Name(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('name', Value);
end;

class function TModelProductDTO.New : iModelProductDTO;
begin
  Result := Self.Create;
end;

function TModelProductDTO.ParentId(Value: Integer): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('parent_id', TJSONNumber.Create(Value));
end;

function TModelProductDTO.PurchaseNote(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('purchase_note', Value);
end;

function TModelProductDTO.RegularPrice(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('regular_price', Value);
end;

function TModelProductDTO.ReviewsAllowed(Value: Boolean): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('reviews_allowed', TJSONBool.Create(Value));
end;

function TModelProductDTO.ShippingClass(Value: Boolean): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('shipping_class', TJSONBool.Create(Value));
end;

function TModelProductDTO.ShortDescription(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('short_description', Value);
end;

function TModelProductDTO.Sku(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('sku', Value);
end;

function TModelProductDTO.Slug(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', Value);
end;

function TModelProductDTO.SoldIndividualy(Value: Boolean): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('sold_individually', TJSONBool.Create(Value));
end;

function TModelProductDTO.Status(Value: TStatusType): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('status', Value.getvalue);
end;

function TModelProductDTO.StockQuantity(Value: Integer): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('stock_quantity', TJSONNumber.Create(Value));
end;

function TModelProductDTO.StockStatus(Value: TStatusType): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('stock_status', Value.GetValue);
end;

function TModelProductDTO.Tags: iModelTagsDTO<iModelProductDTO>;
begin
  Result := TModelTagsDTO<iModelProductDTO>.New(Self);
end;

function TModelProductDTO.TaxClass(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('tax_class', Value);
end;

function TModelProductDTO.taxStatus(Value: TStatusType): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('tax_status', Value.GetValue);
end;

function TModelProductDTO.UpsellIds(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('upsell_ids', Value);
end;

function TModelProductDTO.Weight(Value: String): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('weight', Value);
end;

function TModelProductDTO._Type(Value: TStatusType): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('type', Value.GetValue);
end;

function TModelProductDTO._Virtual(Value: Boolean): iModelProductDTO;
begin
  Result := Self;
  FJSON.AddPair('vairtual', TJSONBool.Create(Value));
end;

end.
