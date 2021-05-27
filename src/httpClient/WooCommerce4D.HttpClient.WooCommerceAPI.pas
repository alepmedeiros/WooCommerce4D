unit WooCommerce4D.HttpClient.WooCommerceAPI;

interface

uses
  WooCommerce4D.HttpClient.Interfaces,
  WooCommerce4D.OAuth.Interfaces,
  System.Generics.Collections,
  WooCommerce4D.HttpClient.DefaultHttpClient,
  System.SysUtils,
  WooCommerce4D.Types,
  Data.DB;

type
  TWooCommerceAPI = class(TInterfacedObject, iWooCommerce)
    private
      [weak]
      FParent : iOAuthConfig;
      FHttpClient : iHttpClient;
      FApiVersion : String;
      FUrl : String;

      const
        API_URL_FORMAT = '%s/wp-json/wc/%s/%s';
        API_URL_BATCH_FORMAT = '%s/wp-json/wc/%s/%s/batch';
        API_URL_ONE_ENTITY_FORMAT = '%s/wp-json/wc/%s/%s/%d';
        URL_SECURED_FORMAT = '%s?%s';
    public
      constructor Create(Parent : iOAuthConfig);
      destructor Destroy; override;
      class function New(Parent : iOAuthConfig) : iWooCommerce;
      function &Create(endpointBase : String; Objects : TDictionary<String, TObject>) : iWooCommerce;
      function Get(endpointBase : String; Id : Integer) : iWooCommerce;
      function GetAll(endpointBase : String; Params : TDictionary<String, String>) : iWooCommerce;
      function Update(endpointBase : String; Id : Integer; Objects : TDictionary<String, TObject>) : iWooCommerce;
      function Delete(endpointBase : String; Id : Integer) : iWooCommerce;
      function Batch(endpointBase : String; Objects : TDictionary<String, TObject>) : iWooCommerce;
      function DataSet(Value : TDataSet) : iWooCommerce;
      function Content : String;
  end;

implementation

constructor TWooCommerceAPI.Create(Parent : iOAuthConfig);
begin
  FParent := Parent;
  FHttpClient := TDefaultHttpClient.New;
  FApiVersion := FParent.Version;
end;

function TWooCommerceAPI.Content: String;
begin
  Result := FHttpClient.Content;
end;

function TWooCommerceAPI.&Create(endpointBase: String;
  Objects: TDictionary<String, TObject>): iWooCommerce;
begin
  Result := Self;
  Furl := Format(API_URL_FORMAT, [FParent.Url, FApiVersion, endpointBase]);
end;

function TWooCommerceAPI.DataSet(Value: TDataSet): iWooCommerce;
begin
  Result := Self;
  FHttpClient.DataSet(Value);
end;

function TWooCommerceAPI.Delete(endpointBase: String;
  Id: Integer): iWooCommerce;
begin
  Result := Self;
end;

destructor TWooCommerceAPI.Destroy;
begin

  inherited;
end;

function TWooCommerceAPI.Get(endpointBase: String; Id: Integer): iWooCommerce;
begin
  Result := Self;

  Furl := Format(API_URL_ONE_ENTITY_FORMAT, [FParent.Url, FApiVersion, endpointBase, id]);

  FHttpClient.Get(Furl);
end;

function TWooCommerceAPI.GetAll(endpointBase: String;
  Params: TDictionary<String, String>): iWooCommerce;
begin
  Result := Self;

  FUrl := Format(API_URL_FORMAT, [FParent.Url, FApiVersion, endpointBase]);

  FHttpClient.Get(FUrl);
end;

class function TWooCommerceAPI.New (Parent : iOAuthConfig) : iWooCommerce;
begin
  Result := Self.Create(Parent);
end;

function TWooCommerceAPI.Batch(endpointBase: String;
  Objects: TDictionary<String, TObject>): iWooCommerce;
begin
  Result := Self;
end;

function TWooCommerceAPI.Update(endpointBase: String; Id: Integer;
  Objects: TDictionary<String, TObject>): iWooCommerce;
begin
  Result := Self;
end;

end.
