unit WooCommerce4D.Model.DTO.Categories;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelCategoriesDTO<T : IInterface> = class(TInterfacedObject, iModelCategoriesDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelCategoriesDTO<T>;
      function Id(Value : Integer) : iModelCategoriesDTO<T>;
      function &End : T;
  end;

implementation

function TModelCategoriesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelCategoriesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelCategoriesDTO<T>.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelCategoriesDTO<T>.Id(Value: Integer): iModelCategoriesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id', TJSONNumber.Create(Value));
end;

class function TModelCategoriesDTO<T>.New(Parent : T) : iModelCategoriesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

end.
