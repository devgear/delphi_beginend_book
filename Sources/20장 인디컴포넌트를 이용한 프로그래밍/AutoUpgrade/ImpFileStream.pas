// ImpFileStream : TFileStream의 기능에 진행상태를 표시할 수 있는 이벤트를 추가한 것임

unit ImpFileStream;

interface

uses Classes;

type
  TNumChangeEvent = procedure (Sender: TObject; OldPos, NewPos: integer) of object;

  TImpFileStream = class(TFileStream)
  private
    FOldSize: integer;
    FOldPos: integer;
    FOnSizeChange: TNumChangeEvent;
    FOnPositionChange: TNumChangeEvent;
    procedure GetSizePos;
    procedure CheckSizePos;

  protected
    procedure SetSize(NewSize: integer); override;

  public
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;

    property OnSizeChange: TNumChangeEvent read FOnSizeChange write FOnSizeChange;
    property OnPositionChange: TNumChangeEvent read FOnPositionChange write FOnPositionChange;
  end;

implementation

uses SysUtils;

procedure TImpFileStream.GetSizePos;
begin
  if (not Assigned(FOnSizeChange)) and (not Assigned(FOnPositionChange)) then exit;
  FOldPos := Position;
  FOldSize := Size;
end;

procedure TImpFileStream.CheckSizePos;
begin
  if (not Assigned(FOnSizeChange)) and (not Assigned(FOnPositionChange)) then exit;
  if Assigned(FOnSizeChange) and (FOldSize<>Size) then
    FOnSizeChange(self, FOldSize, Size);
  if Assigned(FOnPositionChange) and (FOldPos<>Position) then
    FOnPositionChange(self, FOldPos, Position);
end;

procedure TImpFileStream.SetSize(NewSize: integer);
begin
  GetSizePos;
  inherited SetSize(NewSize);
  CheckSizePos;
end;

function TImpFileStream.Read(var Buffer; Count: Longint): Longint;
begin
  GetSizePos;
  Result := inherited Read(Buffer, Count);
  CheckSizePos;
end;

function TImpFileStream.Write(const Buffer; Count: Longint): Longint;
begin
  GetSizePos;
  Result := inherited Write(Buffer, Count);
  CheckSizePos;
end;

function TImpFileStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  GetSizePos;
  Result := inherited Seek(Offset, Origin);
  CheckSizePos;
end;

end.
