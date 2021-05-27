unit WooCommerce4D.Model.DTO.ProductAttributesTerms;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelProductAttributeTemrsDTO = class(TInterfacedObject, iModelProductAttributeTemrsDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductAttributeTemrsDTO;
      function Name(Value : String) : iModelProductAttributeTemrsDTO;//mandatory
      function Slug(Value : String) : iModelProductAttributeTemrsDTO;
      function Description(Value : String) : iModelProductAttributeTemrsDTO;
      function MenuOrder(Value : Integer) : iModelProductAttributeTemrsDTO;
      function &End : iModelProductAttributeTemrsDTO;
  end;

implementation

function TModelProductAttributeTemrsDTO.&End: iModelProductAttributeTemrsDTO;
begin

end;

constructor TModelProductAttributeTemrsDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelProductAttributeTemrsDTO.Description(
  Value: String): iModelProductAttributeTemrsDTO;
begin
  Result := Self;
  FJSON.AddPair('description', value);
end;

destructor TModelProductAttributeTemrsDTO.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelProductAttributeTemrsDTO.MenuOrder(
  Value: Integer): iModelProductAttributeTemrsDTO;
begin
  Result := Self;
  FJSON.AddPair('menu_order', TJSONNumber.Create(value));
end;

function TModelProductAttributeTemrsDTO.Name(
  Value: String): iModelProductAttributeTemrsDTO;
begin
  Result := Self;
  FJSON.AddPair('name', value);
end;

class function TModelProductAttributeTemrsDTO.New : iModelProductAttributeTemrsDTO;
begin
  Result := Self.Create;
end;

function TModelProductAttributeTemrsDTO.Slug(
  Value: String): iModelProductAttributeTemrsDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', value);
end;

end.
