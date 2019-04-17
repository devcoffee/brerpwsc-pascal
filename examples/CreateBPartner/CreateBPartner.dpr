program CreateBPartner;

uses
  Vcl.Forms,
  uClient in 'uClient.pas' {Form1},
  BrERPwscPascal in '..\..\lib\BrERPwscPascal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
