unit WooCommerce4D.Model.DTO.Dimensions;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelDimensionsDTO<T : IInterface> = class(TInterfacedObject, iModelDimensionsDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelDimensionsDTO<T>;
      function _Lenght(Value : String) : iModelDimensionsDTO<T>;
      function Width(Value : String) : iModelDimensionsDTO<T>;
      function Height(Value : String) : iModelDimensionsDTO<T>;
      function &End : T;
  end;

implementation

function TModelDimensionsDTO<T>.&End: T;
begin
  Result := FPArent;
end;

constructor TModelDimensionsDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelDimensionsDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelDimensionsDTO<T>.Height(Value: String): iModelDimensionsDTO<T>;
begin
  Result := Self;
  FJson.AddPair('height', value);
end;

class function TModelDimensionsDTO<T>.New(Parent : T) : iModelDimensionsDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelDimensionsDTO<T>.Width(Value: String): iModelDimensionsDTO<T>;
begin
  Result := Self;
  FJson.AddPair('width', value);
end;

function TModelDimensionsDTO<T>._Lenght(Value: String): iModelDimensionsDTO<T>;
begin
  Result := Self;
  FJson.AddPair('lenght', value);
end;

end.
