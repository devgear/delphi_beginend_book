unit UVideo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TVideoPlayer_Form = class(TForm)
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    Timer1: TTimer;
    Panel2: TPanel;
    Panel3: TPanel;
    MediaPlayer1: TMediaPlayer;
    mPlayFrame: TLabel;
    mTotFrame: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    mTime01: TLabel;
    mTime00: TLabel;
    Label5: TLabel;
    mFileName: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VideoPlayer_Form: TVideoPlayer_Form;

implementation

{$R *.dfm}

procedure TVideoPlayer_Form.FormCreate(Sender: TObject);
begin
  OpenDialog1.Filter := 'Avi Files|*.avi|MPEG Files|*.mpg|All Files|*.*';
  mPlayFrame.Caption := '0';
  mTotFrame.Caption  := '0';
  mTime00.Caption    := '00:00:00';
  mTime01.Caption    := '00:00:00';
end;

procedure TVideoPlayer_Form.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
   case button of
     btPlay : begin
//                 mediaPlayer1.Play;
                 Timer1.Enabled := true;
                 StatusBar1.Panels[0].Text := '재생';
              end;
     btPause  : StatusBar1.Panels[0].Text := '잠시멈춤';
     btStop   : StatusBar1.Panels[0].Text := '재생중지';
//     btNext	  : StatusBar1.Panels[0].Text := '다음';
//     btPrev   : StatusBar1.Panels[0].Text := '이전';
//     btStep   : StatusBar1.Panels[0].Text := '앞으로';
//     btBack   : StatusBar1.Panels[0].Text := '뒤로';
   end;
end;

procedure TVideoPlayer_Form.Timer1Timer(Sender: TObject);
var
   h,m,s,ss : integer;
begin
   MediaPlayer1.TimeFormat := tfFrames;
   mPlayFrame.Caption := formatfloat('##,###,###,###,##0',MediaPlayer1.Position);
   TrackBar1.Position := MediaPlayer1.Position;
   MediaPlayer1.TimeFormat := tfMilliseconds;
   ss := MediaPlayer1.Position div 1000;
   s := ss mod 60;
   m := ss div 60;
   h := m div 60;
   m := m mod 60;
   mTime00.Caption:= formatfloat('00',h)+':'+formatfloat('00',m)+':'+formatfloat('00',s);
   timer1.Enabled := true;
end;

procedure TVideoPlayer_Form.BitBtn1Click(Sender: TObject);
var
   h,m,s,ss : integer;
begin
   if OpenDialog1.Execute then
   begin
      MediaPlayer1.FileName := OpenDialog1.FileName;
      mFileName.Caption     := ExtractFileName(OpenDialog1.FileName);
      MediaPlayer1.Open;
      MediaPlayer1.TimeFormat := tfFrames;
      TrackBar1.Max := MediaPlayer1.Length;
      TrackBar1.Position := MediaPlayer1.Position;
      mTotFrame.Caption  := formatfloat('##,###,###,###,##0',MediaPlayer1.Length);
      mPlayFrame.Caption := formatfloat('##,###,###,###,##0',MediaPlayer1.Position);
      MediaPlayer1.TimeFormat := tfMilliseconds;
      ss := MediaPlayer1.Length div 1000;
      s := ss mod 60;
      m := ss div 60;
      h := m div 60;
      m := m mod 60;
      mTime00.Caption:= formatfloat('00":"00":"00',0);
      mTime01.Caption:= formatfloat('00',h)+':'+formatfloat('00',m)+':'+formatfloat('00',s);
   end;
end;

procedure TVideoPlayer_Form.BitBtn2Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TVideoPlayer_Form.MediaPlayer1Notify(Sender: TObject);
begin
   if (MediaPlayer1.NotifyValue = nvsuccessful) and
      (MediaPlayer1.Mode = mpStopped) then
       StatusBar1.Panels[0].Text := '재생완료';
   if MediaPlayer1.Mode = mPStopped then
       StatusBar1.Panels[0].Text := '재생중지';
end;

end.
