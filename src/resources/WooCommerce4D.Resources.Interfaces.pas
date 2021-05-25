unit WooCommerce4D.Resources.Interfaces;

interface

uses
  WooCommerce4D.oAuth.Interfaces;

type
  iWooCommerce = interface
    function Config : iOAuthConfig;
  end;

implementation

end.
