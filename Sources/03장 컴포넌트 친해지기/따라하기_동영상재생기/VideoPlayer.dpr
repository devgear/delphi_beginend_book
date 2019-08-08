program VideoPlayer;

uses
  Forms,
  UVideo in 'UVideo.pas' {VideoPlayer_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TVideoPlayer_Form, VideoPlayer_Form);
  Application.Run;
end.
