unit WooCommerce4D.OAuth.OAuthHeader;

interface

type
  TOAuthHeader = (OAUTH_CONSUMER_KEY, OAUTH_TIMESTAMP, OAUTH_NONCE,
    OAUTH_SIGNATURE_METHOD, OAUTH_SIGNATURE);

  TOAuthHeaderHelper = record helper for TOAuthHeader
    function GetValue : String;
  end;

implementation

{ TOAuthHeaderHelper }

function TOAuthHeaderHelper.GetValue: String;
begin
  case Integer(Self) of
    0 : Result := 'oauth_consumer_key';
    1 : Result := 'oauth_timestamp';
    2 : Result := 'oauth_nonce';
    3 : Result := 'oauth_signature_method';
    4 : Result := 'oauth_signature';
  end;
end;

end.
