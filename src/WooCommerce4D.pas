unit WooCommerce4D;

interface

uses
  WooCommerce4D.Interfaces;

type
  TWooCommerce4D = class(TInterfacedObject, iWooCommerce4D)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iWooCommerce4D;
  end;

implementation

constructor TWooCommerce4D.Create;
begin

end;

destructor TWooCommerce4D.Destroy;
begin

  inherited;
end;

class function TWooCommerce4D.New : iWooCommerce4D;
begin
  Result := Self.Create;
end;

end.
