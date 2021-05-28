unit WooCommerce4D.Model.DTO.ProductAttributesTerms;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelProductAttributeTermsDTO = class(TInterfacedObject, iModelProductAttributeTermsDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductAttributeTermsDTO;
      function Name(Value : String) : iModelProductAttributeTermsDTO;//mandatory
      function Slug(Value : String) : iModelProductAttributeTermsDTO;
      function Description(Value : String) : iModelProductAttributeTermsDTO;
      function MenuOrder(Value : Integer) : iModelProductAttributeTermsDTO;
      function &End : iModelProductAttributeTermsDTO;
  end;

implementation

function TModelProductAttributeTermsDTO.&End: iModelProductAttributeTermsDTO;
begin
  Result := Self;
end;

constructor TModelProductAttributeTermsDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelProductAttributeTermsDTO.Description(
  Value: String): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('description', value);
end;

destructor TModelProductAttributeTermsDTO.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelProductAttributeTermsDTO.MenuOrder(
  Value: Integer): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('menu_order', TJSONNumber.Create(value));
end;

function TModelProductAttributeTermsDTO.Name(
  Value: String): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('name', value);
end;

class function TModelProductAttributeTermsDTO.New : iModelProductAttributeTermsDTO;
begin
  Result := Self.Create;
end;

function TModelProductAttributeTermsDTO.Slug(
  Value: String): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', value);
end;

end.
