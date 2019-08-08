unit uVars;

interface

var
  LogInState: Boolean;    // 로그인 상태 체크, 로그인이면 True
  UserID: String;         // 로그인 했을 경우 ID 저장

  miLeft, miTop, miTerm: Integer; // 상품 리스트 출력 좌표, 간격
  RecordPointer: Integer; // 상품 리스트 시작할 "레코드 포인터'
  ItemViewCount: Integer; // 한 번에 출력할 아이템 갯수

  ClickedNumber: Integer; // 눌린(현재 출력 중인) 페이지 번호

implementation

initialization
  // 로그인 상태 체크, 로그인이면 True
  LogInState := False;
  // 한 번에 출력할 아이템 갯수
  ItemViewCount := 5;

  // 상품 리스트 시작할 "레코드 포인터'
  RecordPointer := 0;

  // 상품 리스트 출력 좌표, 간격
  miLeft := 50;
  miTop := 70;
  miTerm := 120;

  // 눌린(현재 출력 중인) 페이지 번호
  ClickedNumber := 1;

end.
