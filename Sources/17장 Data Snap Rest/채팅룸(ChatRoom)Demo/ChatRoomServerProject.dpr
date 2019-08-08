program ChatRoomServerProject;

{$R *.dres}

uses
  Forms,
  ChatRoomServerUnit in 'ChatRoomServerUnit.pas' {ChatRoomForm},
  ChatRoomServerMethodsUnit in 'ChatRoomServerMethodsUnit.pas' {ChatRoomServerMethods: TDSServerModule},
  ChatRoomServerContainer in 'ChatRoomServerContainer.pas' {ServerContainerForm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TChatRoomForm, ChatRoomForm);
  Application.CreateForm(TServerContainerForm, ServerContainerForm);
  Application.Run;
end.

