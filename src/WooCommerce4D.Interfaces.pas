unit WooCommerce4D.Interfaces;

interface

uses
  WooCommerce4D.OAuth.Interfaces;

type
  iWooCommerce4D = interface
    function Config : iOAuthConfig;
  end;

implementation

end.
