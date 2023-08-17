program SendMail;

uses
  Vcl.Forms,
  USendMail in 'USendMail.pas' {frmEnviaEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEnviaEmail, frmEnviaEmail);
  Application.Run;
end.
