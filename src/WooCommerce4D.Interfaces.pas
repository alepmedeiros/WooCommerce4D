unit WooCommerce4D.Interfaces;

interface

uses
  WooCommerce4D.OAuth.Interfaces,
  WooCommerce4D.HttpClient.Interfaces;

type
  iWooCommerce4D = interface
    function Config : iOAuthConfig;
    function Resources : iWooCommerce;
  end;

implementation

end.
