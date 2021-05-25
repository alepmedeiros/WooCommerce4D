unit WooCommerce4D.oAuth.Interfaces;

interface

type
  iOAuthConfig = interface
    function Url(Value : String) : iOAuthConfig; overload;
    function Url : String; overload;
    function ConsumerKey(Value : String) : iOAuthConfig; overload;
    function ConsumerKey : String; overload;
    function ConsumerSecret(Value : String) : iOAuthConfig; overload;
    function ConsumerSecret : String; overload;
  end;

implementation

end.
