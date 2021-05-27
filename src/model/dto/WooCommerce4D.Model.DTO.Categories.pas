unit WooCommerce4D.Model.DTO.Categories;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  ModelCategoriesDTO<T : IInterface> = class(TInterfacedObject, iModelCategoriesDTO<T>)
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

function ModelCategoriesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor ModelCategoriesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor ModelCategoriesDTO<T>.Destroy;
begin
  FJson.free;
  inherited;
end;

function ModelCategoriesDTO<T>.Id(Value: Integer): iModelCategoriesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id', TJSONNumber.Create(Value));
end;

class function ModelCategoriesDTO<T>.New(Parent : T) : iModelCategoriesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

end.
