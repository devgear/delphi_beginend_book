unit MainForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls, WideStrings, DbxDatasnap, DB, SqlExpr, DBXCommon;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    DsConnection: TSQLConnection;
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  TransformStream,
  CopyPrsr,
  clientproxy,
  DBXJson,
  StrUtils,
  DSUtils;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LStream: TStream;
  LResultStream: TStream;
  LReader: TStreamReader;
  LClient: ClientProxy.TServerMethodsClient;
  LCallBack: TDBXCallback;
  LStopAfter: Integer;
  LCount: Integer;
begin
  DSConnection.Open;
  try
    LClient := TServerMethodsClient.Create(DSConnection.DBXConnection, False);
    LStream := TStringStream.Create(Memo1.Lines.Text);
    try
      LCallback := TDSCallbackWithMethod.Create(
        // Anonymous method that gets called by the server for each word in the stream
        function(const Args: TJSONValue): TJSONValue
        const
          LComma: array[false..true] of string = ('', ', ');
        var
          LJSONObject: TJSONObject;
          I: Integer;
          LMessage: string;
        begin
          // Extract information about the transformation from Json
          LJSONObject := TJSONObject(Args);
          for I := 0 to LJSONObject.Size - 1 do
            with LJSonObject.Get(I) do
              LMessage := LMessage +
                Format('%s: "%s"%s', [JSonString.Value, JsonValue.Value, LComma[I<LJSONObject.Size-1]]);
          // Display information in a listbox
          ListBox1.Items.Add(LMessage);
          ListBox1.Update;
          Inc(LCount);
          // Stop the server after so many words
          if LCount = LStopAfter then
            Result := TJSonFalse.Create // Cancel
          else
            Result := TJSonTrue.Create;
        end
        );
      ListBox1.Items.Clear;
      LCount := 0;
      LStopAfter := StrToInt(Edit1.Text);

      // Call the server method
      LResultStream := LClient.ReverseWordsInStream(LCallback, LStream);
      try
        // Write the transformed stream back to the memo
        LReader := TStreamReader.Create(LResultStream);
        try
          Memo1.Text := LReader.ReadToEnd;
        finally
          LReader.Free;
        end;
        // Display the number of words processed
        ShowMessage(Format('Count: %d', [LCount]));
      finally
        LResultStream.Free;
      end;
    finally
      LStream.Free;
      LClient.Free;
    end;
  finally
    DSConnection.Close;
  end;
end;

end.
