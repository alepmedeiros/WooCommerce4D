unit WooCommerce4D.HttpClient.Interfaces;

interface

uses
  System.Generics.Collections,
  Data.DB;

type
  iHttpClient = interface
    function Get(Url : String) : ihttpClient;
    function GetAll(Url : String) : ihttpClient;
    function Post(Url : String; Params : TDictionary<String, String>; Objects : TObject) : ihttpClient;
    function Put(Url : String; Params : TDictionary<String, String>; Objects : TObject) : ihttpClient;
    function Delete(Url : String; Params : TDictionary<String, String>)  : ihttpClient;
    function DataSet(Value : TDataSet) : ihttpClient;
    function Content : String;
  end;

  iWooCommerce = interface
    function &Create(endpointBase : String; Objects : TDictionary<String, TObject>) : iWooCommerce;
    function Get(endpointBase : String; Id : Integer) : iWooCommerce;
    function GetAll(endpointBase : String; Params : TDictionary<String, String>) : iWooCommerce;
    function Update(endpointBase : String; Id : Integer; Objects : TDictionary<String, TObject>) : iWooCommerce;
    function Delete(endpointBase : String; Id : Integer) : iWooCommerce;
    function Batch(endpointBase :
    String; Objects : TDictionary<String, TObject>) : iWooCommerce;
    function DataSet(Value : TDataSet) : iWooCommerce;
    function Content : String;
  end;

implementation

end.
