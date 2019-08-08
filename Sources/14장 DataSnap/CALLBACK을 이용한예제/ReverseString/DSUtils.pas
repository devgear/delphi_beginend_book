unit DSUtils;

interface

uses
  Classes,
  DbxDatasnap,
  DBXJson;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;
  TDSCallbackWithMethod = class(TDBXCallback)
  private
    FCallbackMethod: TDSCallbackMethod;
  public
    constructor Create(ACallbackMethod: TDSCallbackMethod);
    function Execute(const Args: TJSONValue): TJSONValue; override;
  end;

implementation

constructor TDSCallbackWithMethod.Create(ACallbackMethod: TDSCallbackMethod);
begin
  FCallbackMethod := ACallbackMethod;
end;

function TDSCallbackWithMethod.Execute(const Args: TJSONValue): TJSONValue;
var
  aString: string;
begin
  Assert(Assigned(FCallbackMethod));
  Result := FCallbackMethod(Args);
end;

end.

