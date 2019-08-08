unit ReverseStringServerMethods;

interface

uses
  SysUtils, Classes, DSServer, DBXJSon;

type
{$METHODINFO ON}
  TServerMethods = class(TPersistent)
  private
    { Private declarations }
  public
    { Public declarations }
    function ReverseString(AValue: string): string;
    function TransformString(const AValue: string): TJSONObject;
    function ReverseWordsInStream
      (ACallback: TDBXCallback; AStream: TStream): TStream;
  end;
{$METHODINFO OFF}

implementation

uses StrUtils, TransformStream;

function TServerMethods.ReverseString(AValue: string): string;
begin
  Result := StrUtils.ReverseString(AValue);
end;

function TServerMethods.TransformString(const AValue: string): TJSONObject;
begin
  // Return a json object with original and transformed values
  Result := TJSONObject.Create;
  Result.AddPair(TJSONPair.Create('Original', AValue));
  Result.AddPair(TJSONPair.Create('Upper', UpperCase(AValue)));
  Result.AddPair(TJSONPair.Create('Lower', LowerCase(AValue)));
  Result.AddPair(TJSONPair.Create('Reverse', ReverseString(AValue)));
end;

function TServerMethods.ReverseWordsInStream
  (ACallback: TDBXCallback; AStream: TStream): TStream;
var
  LTransformingWordCallback: TTransformingWordCallback;
begin

  LTransformingWordCallback :=
    procedure(const AValue, ATransformedValue: string; var ACancel: Boolean)
    var
      LCallbackValue: TJSONObject;
      LCallbackReturnValue: TJSONValue;
    begin
      // Create a json object describing the string being reversed
      LCallbackValue := TJSONObject.Create;
      LCallbackValue.AddPair(TJSONPair.Create('Original', AValue));
      LCallbackValue.AddPair(TJSONPair.Create('Reverse', ATransformedValue));

      // Execute the DataSnap client callback
      LCallbackReturnValue := ACallback.Execute(LCallbackValue);

      // If then DataSnap client callback returns false, then stop reversing strings
      ACancel := LCallbackReturnValue is TJSONFalse;
      LCallbackReturnValue.Free;
    end;

  Result := TransformStream.ReverseWordsInStream(AStream, LTransformingWordCallback);
end;


end.




