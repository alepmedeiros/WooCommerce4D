unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  WooCommerce4D;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
  private
    FWooCommerce : iWooCommerce4D;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FWooCommerce := TWooCommerce4D.New;
  FWooCommerce
    .Config
      .Url('https://loja.sylasfilho.com.br')
      .ConsumerKey('ck_a8839cc4d4482e79be334088c84706a380ee20b7')
      .ConsumerSecret('cs_9a31395976b6b9d41aac177ef48b5f7be00f73e6');
end;

end.
