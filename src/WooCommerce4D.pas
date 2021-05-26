unit WooCommerce4D;

interface

uses
  WooCommerce4D.Interfaces,
  WooCommerce4D.OAuth.Interfaces,
  WooCommerce4D.OAuth.OAuthConfig;

type
  TWooCommerce4D = class(TInterfacedObject, iWooCommerce4D)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iWooCommerce4D;
      function Config : iOAuthConfig;
  end;

implementation

function TWooCommerce4D.Config: iOAuthConfig;
begin
  Result := TOAuthConfig.New;
end;

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
