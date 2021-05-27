unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WooCommerce4D, WooCommerce4D.Interfaces,
  WooCommerce4D.Types, Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    woocommerce : iWooCommerce4d;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.add(
  woocommerce
    .Resources
    .DataSet(FDMemTable1)
    .GetAll(TEndpointBaseType.COUPONS.GetValue)
    .Content);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
woocommerce:= TWooCommerce4d.new;

woocommerce
  .Config
    .url('https://loja.sylasfilho.com.br')
    .consumerKey('ck_a8839cc4d4482e79be334088c84706a380ee20b7')
    .consumersecret('cs_9a31395976b6b9d41aac177ef48b5f7be00f73e6')
    .version(TApiVersionType.v3.ToString);
end;

end.
