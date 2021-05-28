unit WooCommerce4D.Model.DTO.Images;

interface

uses
  Json,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelImagesDTO<T : IInterface> = class(TInterfacedObject, iModelImagesDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelImagesDTO<T>;
      function Id(Value : Integer) : iModelImagesDTO<T>;
      function Src(Value : String) : iModelImagesDTO<T>;
      function Name(Value : String) : iModelImagesDTO<T>;
      function Alt(Value : string) : iModelImagesDTO<T>;
      function &End : T;
  end;

implementation

function TModelImagesDTO<T>.Alt(Value: string): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('alt', value);
end;

function TModelImagesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelImagesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelImagesDTO<T>.Destroy;
begin
  FJSON.free;
  inherited;
end;

function TModelImagesDTO<T>.Id(Value: Integer): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id', TJSONNumber.Create(value));
end;

function TModelImagesDTO<T>.Name(Value: String): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('name', value);
end;

class function TModelImagesDTO<T>.New(Parent : T) : iModelImagesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelImagesDTO<T>.Src(Value: String): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('src', value);
end;

end.
