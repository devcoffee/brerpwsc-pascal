program DelphiExamples;

uses
  Vcl.Forms,
  uClient in 'Forms\uClient.pas' {Client},
  BrERPwscPascal in '..\lib\BrERPwscPascal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClient, Client);
  Application.Run;
end.
