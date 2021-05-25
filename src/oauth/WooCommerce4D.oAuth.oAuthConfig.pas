unit WooCommerce4D.oAuth.oAuthConfig;

interface

uses
  WooCommerce4D.oAuth.Interfaces;

type
  ToAuthConfig = class(TInterfacedObject, iOAuthConfig)
    private
      FUrl : String;
      FConsumerKey : String;
      FConsumerSecret : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iOAuthConfig;
      function Url(Value : String) : iOAuthConfig; overload;
      function Url : String; overload;
      function ConsumerKey(Value : String) : iOAuthConfig; overload;
      function ConsumerKey : String; overload;
      function ConsumerSecret(Value : String) : iOAuthConfig; overload;
      function ConsumerSecret : String; overload;
  end;

implementation

function ToAuthConfig.ConsumerKey(Value: String): iOAuthConfig;
begin
  Result := Self;
  FConsumerKey := Value;
end;

function ToAuthConfig.ConsumerKey: String;
begin
  Result := FConsumerKey;
end;

function ToAuthConfig.ConsumerSecret: String;
begin
  Result := FConsumerSecret;
end;

function ToAuthConfig.ConsumerSecret(Value: String): iOAuthConfig;
begin
  Result := Self;
  FConsumerSecret := Value;
end;

constructor ToAuthConfig.Create;
begin

end;

destructor ToAuthConfig.Destroy;
begin

  inherited;
end;

class function ToAuthConfig.New : iOAuthConfig;
begin
  Result := Self.Create;
end;

function ToAuthConfig.Url(Value: String): iOAuthConfig;
begin
  Result := Self;
  FUrl := Value;
end;

function ToAuthConfig.Url: String;
begin
  Result := FUrl;
end;

end.
