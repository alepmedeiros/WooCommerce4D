unit WooCommerce4D.OAuth.SpecialSymbol;

interface

type
  TSpecialSymbol = (AMP, EQUAL, PLUS, STAR, TILDE);

  TSpecialSymbolHelper = record helper for TSpecialSymbol
    function Plain : String;
    function Encoded : String;
  end;

implementation

{ TSpecialSymbolHelper }

function TSpecialSymbolHelper.Encoded: String;
begin
  case Integer(Self) of
    0 : Result := '%26';
    1 : Result := '%3D';
    2 : Result := '%2B';
    3 : Result := '%2A';
    4 : Result := '%7E';
  end;
end;

function TSpecialSymbolHelper.Plain: String;
begin
  case Integer(Self) of
    0 : Result := '&';
    1 : Result := '=';
    2 : Result := '%2B';
    3 : Result := '%2A';
    4 : Result := '%7E';
  end;
end;

end.
