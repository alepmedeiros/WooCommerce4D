unit WooCommerce4D.Model.DTO.ProductCategories;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types,
  WooCommerce4D.Model.DTO.Images;

type
  TModelProductCategoriesDTO = class(TInterfacedObject, iModelProductCategoriesDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductCategoriesDTO;
      function Name(value : String) : iModelProductCategoriesDTO;
      function Slug(Value : String) : iModelProductCategoriesDTO;
      function Parent(Value : Integer) : iModelProductCategoriesDTO;
      function Description(Value : String) : iModelProductCategoriesDTO;
      function Display(Value : TStatusType = DEFAULT) : iModelProductCategoriesDTO;
      function Image : iModelImagesDTO<iModelProductCategoriesDTO>;
      function MenuOrder(Value : Integer) : iModelProductCategoriesDTO;
      function &End : iModelProductCategoriesDTO;
  end;

implementation

function TModelProductCategoriesDTO.&End: iModelProductCategoriesDTO;
begin
  Result := Self;
end;

constructor TModelProductCategoriesDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelProductCategoriesDTO.Description(
  Value: String): iModelProductCategoriesDTO;
begin
  Result := Self;
  FJSON.AddPair('description',value);
end;

destructor TModelProductCategoriesDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelProductCategoriesDTO.Display(
  Value: TStatusType): iModelProductCategoriesDTO;
begin
  Result := Self;
  FJSON.AddPair('display',value.GetValue);
end;

function TModelProductCategoriesDTO.Image: iModelImagesDTO<iModelProductCategoriesDTO>;
begin
  Result := TModelImagesDTO<iModelProductCategoriesDTO>.New(Self);
end;

function TModelProductCategoriesDTO.MenuOrder(
  Value: Integer): iModelProductCategoriesDTO;
begin
  Result := Self;
  FJSON.AddPair('menu_order',TJSONNumber.Create(value));
end;

function TModelProductCategoriesDTO.Name(
  value: String): iModelProductCategoriesDTO;
begin
  Result := Self;
  FJSON.AddPair('name',value);
end;

class function TModelProductCategoriesDTO.New : iModelProductCategoriesDTO;
begin
  Result := Self.Create;
end;

function TModelProductCategoriesDTO.Parent(
  Value: Integer): iModelProductCategoriesDTO;
begin
  Result := Self;
  FJSON.AddPair('parent',TJSONNumber.Create(value));
end;

function TModelProductCategoriesDTO.Slug(
  Value: String): iModelProductCategoriesDTO;
begin
  Result := Self;
  FJSON.AddPair('slug',value);
end;

end.
