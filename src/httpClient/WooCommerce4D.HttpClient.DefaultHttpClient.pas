unit WooCommerce4D.HttpClient.DefaultHttpClient;

interface

uses
  WooCommerce4D.HttpClient.Interfaces,
  RestRequest4D,
  JSON,
  REST.JSON,
  System.Generics.Collections,
  Data.DB;

type
  TDefaultHttpClient = class(TInterfacedObject, iHttpClient)
    private
      FReq : IRequest;
      FResp : IResponse;
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
      function DataSet(Value : TDataSet) : ihttpClient;
      function Content : String;
  end;

implementation

function TDefaultHttpClient.Content: String;
begin
  Result := FResp.Content;
end;

constructor TDefaultHttpClient.Create;
begin
  FReq := TRequest.New;
end;

function TDefaultHttpClient.DataSet(Value: TDataSet): ihttpClient;
begin
  Result := Self;
  FReq.DataSetAdapter(Value);
end;

function TDefaultHttpClient.Delete(Url: String;
  Params: TDictionary<String, String>): ihttpClient;
var
  I : String;
begin
  Result := Self;

  for I in Params.Keys do
    FReq.AddParam(i,params.Items[i]);

  FReq
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
  FReq
    .BaseURL(Url)
    .Get;
end;

function TDefaultHttpClient.GetAll(Url: String): ihttpClient;
begin
  Result := Self;

  FReq
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
    FReq.AddParam(I, Params.Items[I]);

  FReq
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
    FReq.AddParam(I, Params.Items[I]);

  FReq
    .BaseURL(Url)
    .AddHeader(CONTENT_TYPE, APPLICATION_JSON)
    .AddBody(TJSON.ObjectToJsonObject(Objects).ToJSON)
    .Put;
end;

end.