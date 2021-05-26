unit WooCommerce4D.HttpClient.DefaultHttpClient;

interface

uses
  WooCommerce4D.HttpClient.Interfaces,
  RestRequest4D,
  JSON,
  REST.JSON,
  System.Generics.Collections;

type
  TDefaultHttpClient = class(TInterfacedObject, iHttpClient)
    private
      FHttpClient : IRequest;

      const
        CONTENT_TYPE = 'Content-Type';
        APPLICATION_JSON = 'application/json';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iHttpClient;
      function Get(Url : String) : ihttpClient;
      function GetAll(Url : String) : ihttpClient;
      function Post(Url : String; Params : TDictionary<String, String>; Objects : TObject) : ihttpClient;
      function Put(Url : String; Params : TDictionary<String, String>; Objects : TObject) : ihttpClient;
      function Delete(Url : String; Params : TDictionary<String, String>)  : ihttpClient;
  end;

implementation

constructor TDefaultHttpClient.Create;
begin
  FHttpClient := TRequest.New;
end;

function TDefaultHttpClient.Delete(Url: String;
  Params: TDictionary<String, String>): ihttpClient;
var
  I : String;
begin
  Result := Self;

  for I in Params.Keys do
    FHttpClient.AddParam(i,params.Items[i]);

  FHttpClient
    .BaseURL(Url)
    .Delete;
end;

destructor TDefaultHttpClient.Destroy;
begin

  inherited;
end;

function TDefaultHttpClient.Get(Url: String): ihttpClient;
begin
  Result := Self;
  FHttpClient
    .BaseURL(Url)
    .Get;
end;

function TDefaultHttpClient.GetAll(Url: String): ihttpClient;
begin
  Result := Self;

  FHttpClient
    .BaseURL(Url)
    .Get;
end;

class function TDefaultHttpClient.New : iHttpClient;
begin
  Result := Self.Create;
end;

function TDefaultHttpClient.Post(Url: String;
  Params: TDictionary<String, String>; Objects: TObject): ihttpClient;
var
  I: String;
begin
  Result := Self;

  for I in Params.Keys do
    FHttpClient.AddParam(I, Params.Items[I]);

  FHttpClient
    .BaseURL(Url)
    .AddHeader(CONTENT_TYPE,APPLICATION_JSON)
    .AddBody(TJSON.ObjectToJsonObject(Objects).ToJSON)
    .Post;
end;

function TDefaultHttpClient.Put(Url: String;
  Params: TDictionary<String, String>; Objects: TObject): ihttpClient;
var
  I : String;
begin
  Result := Self;

  for I in Params.Keys do
    FHttpClient.AddParam(I, Params.Items[I]);

  FHttpClient
    .BaseURL(Url)
    .AddHeader(CONTENT_TYPE, APPLICATION_JSON)
    .AddBody(TJSON.ObjectToJsonObject(Objects).ToJSON)
    .Put;
end;

end.
