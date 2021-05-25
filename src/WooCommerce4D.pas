unit WooCommerce4D;

interface

uses
  WooCommerce4D.Resources.Interfaces,
  WooCommerce4D.oAuth.oAuthConfig,
  WooCommerce4D.oAuth.Interfaces;

type
  iWooCommerce = interface
    function Config : iOAuthConfig;
  end;

  TWooCommerce4D = class(TInterfacedObject, iWooCommerce)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iWooCommerce;
      function Config : iOAuthConfig;
  end;

implementation

function TWooCommerce4D.Config: iOAuthConfig;
begin
  Result := ToAuthConfig.New;
end;

constructor TWooCommerce4D.Create;
begin

end;

destructor TWooCommerce4D.Destroy;
begin

  inherited;
end;

class function TWooCommerce4D.New : iWooCommerce;
begin
  Result := Self.Create;
end;

end.
