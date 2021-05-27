unit WooCommerce4D.Model.DTO.ProductsAttributes;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types;

type
  TModelProductAttributeDTO = class(TInterfacedObject, iModelProductAttributeDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductAttributeDTO;
      function Name(Value : String) : iModelProductAttributeDTO;//mandatory
      function Slug(Value : String) : iModelProductAttributeDTO;
      function _Type(Value : TStatusType = SELECT) : iModelProductAttributeDTO;
      function OrderBy(Value : TStatusType) : iModelProductAttributeDTO;
      function HasArchives(Value : Boolean = false) : iModelProductAttributeDTO;
      function &End : iModelProductAttributeDTO;
  end;

implementation

function TModelProductAttributeDTO.&End: iModelProductAttributeDTO;
begin
  Result := Self;
end;

constructor TModelProductAttributeDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

destructor TModelProductAttributeDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelProductAttributeDTO.HasArchives(
  Value: Boolean): iModelProductAttributeDTO;
begin
  Result := Self;
  FJSON.AddPair('has_archives', TJSONBool.Create(Value));
end;

function TModelProductAttributeDTO.Name(
  Value: String): iModelProductAttributeDTO;
begin
  Result := Self;
  FJSON.AddPair('name', Value);
end;

class function TModelProductAttributeDTO.New : iModelProductAttributeDTO;
begin
  Result := Self.Create;
end;

function TModelProductAttributeDTO.OrderBy(
  Value: TStatusType): iModelProductAttributeDTO;
begin
  Result := Self;
  FJSON.AddPair('order_by', Value.GetValue);
end;

function TModelProductAttributeDTO.Slug(
  Value: String): iModelProductAttributeDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', Value);
end;

function TModelProductAttributeDTO._Type(
  Value: TStatusType): iModelProductAttributeDTO;
begin
  Result := Self;
  FJSON.AddPair('type', Value.GetValue);
end;

end.
