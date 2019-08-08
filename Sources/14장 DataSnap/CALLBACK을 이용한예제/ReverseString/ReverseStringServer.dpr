program ReverseStringServer;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ReverseStringServerMethods in 'ReverseStringServerMethods.pas',
  ReverseStringServerContainer in 'ReverseStringServerContainer.pas' {ServerContainer3: TDataModule},
  TransformStream in 'TransformStream.pas';

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.




