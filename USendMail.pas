{**APENAS MAIS UM DEV***
  Código Fonte criado por Hélio Neto - Canal Youtube: Apenas mais um DEV.
  https://youtube.com/@ApenasmaisumDev
  Deixe um Like, Se inscreva no Canal!
***}
unit USendMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdMessage, Vcl.Menus,
  Vcl.Samples.Gauges, Vcl.ComCtrls, Vcl.Buttons, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  Vcl.StdCtrls, IdAttachmentFile, IdMessageParts, IdText, IdAttachment;

type
  TfrmEnviaEmail = class(TForm)
    PopupMenu1: TPopupMenu;
    ListBoxAnexos: TListBox;
    mmoMsg: TMemo;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdtAssunto: TEdit;
    EdtOrigem: TEdit;
    EdtSMTP: TEdit;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    EdtPara: TEdit;
    EdtCC: TEdit;
    EdtBCC: TEdit;
    IdAntiFreeze1: TIdAntiFreeze;
    OpenDialog1: TOpenDialog;
    btnEnviar: TBitBtn;
    btnAnexo: TSpeedButton;
    StatusBar1: TStatusBar;
    pg1: TGauge;
    mnuDeletarAnexoSelecionado: TMenuItem;
    DeletarTodososAnexos11: TMenuItem;
    IdMessage1: TIdMessage;
    Label11: TLabel;
    EdtPorta: TEdit;
    Label12: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ListBoxAnexosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAnexoClick(Sender: TObject);
    procedure mnuDeletarAnexoSelecionadoClick(Sender: TObject);
    procedure DeletarTodososAnexos11Click(Sender: TObject);
    procedure IdSMTP1Connected(Sender: TObject);
    procedure IdSMTP1Disconnected(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCancelar : Boolean;
    IdSMTP1 : TIdSMTP;
    SSLSocket : TIdSSLIOHandlerSocketOpenSSL;
  public
    { Public declarations }
  end;

var
  frmEnviaEmail: TfrmEnviaEmail;

implementation

{$R *.dfm}

procedure TfrmEnviaEmail.btnAnexoClick(Sender: TObject);
var
  i: Integer;
begin
	if OpenDialog1.Execute then
	begin
		for i:= 0 to OpenDialog1.Files.Count -1 do
		if (ListBoxAnexos.Items.IndexOf(OpenDialog1.Files[i]) = -1) then
			ListBoxAnexos.Items.Add(OpenDialog1.Files[i])
	end;
end;

procedure TfrmEnviaEmail.btnEnviarClick(Sender: TObject);
var
	i: integer;
  lTextPart : TIdText;
  lImagePart : TIdAttachment;
begin

	try
		FCancelar:= false;
		Screen.Cursor:= crHourGlass;
		btnEnviar.Enabled:= false;
		pg1.MaxValue := 1;
		pg1.Progress := 0;
		IdSMTP1.Host := EdtSMTP.Text;
		IdSMTP1.Username:= EdtUsuario.Text;
		IdSMTP1.Password := EdtSenha.Text;
    IdSMTP1.Port  := StrToIntDef(EdtPorta.Text, 465);
    IdSMTP1.ConnectTimeout := 0;
    IdSMTP1.AuthType := satDefault;
    IdSMTP1.UseTLS := utNoTLSSupport;

		if CheckBox1.Checked then
      IdSMTP1.UseTLS := utUseExplicitTLS;

    IdSMTP1.ReadTimeout := 0;

    IdMessage1.MessageParts.Clear;
		if ListBoxAnexos.Items.Count > 0 then
		begin
			for i:= 0 to ListBoxAnexos.Items.Count - 1 do
				TIdAttachmentFile.Create(IdMessage1.MessageParts, ListBoxAnexos.Items[i]);

		end;

		IdMessage1.From.Address:= EdtOrigem.Text;
		IdMessage1.Subject:= EdtAssunto.Text;

		IdMessage1.ContentType:='multipart/mixed';

    lTextPart := TIdText.Create(IdMessage1.MessageParts);
    lTextPart.ContentType := 'text/html';

    {***EXEMPLO COM IMAGEM***}
    lTextPart.Body.Text := '<html><body><p><h1>Titulo<h1><br><h2>SubTitulo<h2></p>'+
      '<p><h2>Mensagem Usuario:</h2><br>'+mmoMsg.Lines.Text+'</p>' +
      '<p><hr></p><a href="https://youtu.be/Y54MIF8TMf4">Ultimo Video Youtube</a><br><footer><img src="cid:assinatura-email"></footer></body></html>';

    lImagePart := TIdAttachmentFile.Create(IdMessage1.MessageParts, 'C:\ProjestosDelphi\EnviaEmail\Logo-Embarcadero.png');
    lImagePart.FileName := 'assinatura-email';
    lImagePart.ContentType := 'image/jpg';
    lImagePart.Headers.Add('Content-ID: <assinatura-email>');
    {***FIM EXEMPLO COM IMAGEM***}

    {***EXEMPLO COM TEMPLATE***}
    //lTextPart.Body.LoadFromFile('template-email/template-email.html');
    {***FIM EXEMPLO COM TEMPLATE***}

		IdMessage1.Recipients.EMailAddresses := EdtPara.Text;
		IdMessage1.BccList.EMailAddresses := EdtBCC.Text;
		IdMessage1.CCList.EMailAddresses := EdtCC.Text;

		if not IdSMTP1.Connected then
			IdSMTP1.Connect();
		for i:= 1 to pg1.MaxValue do
		begin
			IdSMTP1.Send(IdMessage1);
      pg1.AddProgress(1);
      Application.ProcessMessages;
		end;
	finally
    IdSMTP1.Disconnect;
    Screen.Cursor:= crDefault;
    btnEnviar.Enabled:= true;
  end;
end;

procedure TfrmEnviaEmail.DeletarTodososAnexos11Click(Sender: TObject);
begin
  ListBoxAnexos.Clear;
end;

procedure TfrmEnviaEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	IdSMTP1.Disconnect;
end;

procedure TfrmEnviaEmail.FormCreate(Sender: TObject);
begin
  IdSMTP1 := TIdSMTP.Create;
  SSLSocket := TIdSSLIOHandlerSocketOpenSSL.Create;

	SSLSocket.SSLOptions.Method := sslvTLSv1_2;
	SSLSocket.SSLOptions.Mode   := sslmClient;
  SSLSocket.UseNagle := True;

  IdSMTP1.AuthType := satDefault;
  IdSMTP1.Host := EdtSMTP.Text;
  IdSMTP1.IOHandler := SSLSocket;
  IdSMTP1.Password := EdtSenha.Text;
  IdSMTP1.Username := EdtUsuario.Text;
end;

procedure TfrmEnviaEmail.FormKeyPress(Sender: TObject; var Key: Char);
begin
	FCancelar := (key = #27);
end;

procedure TfrmEnviaEmail.IdSMTP1Connected(Sender: TObject);
begin
	StatusBar1.Panels[0].Text:= 'Conectado';
end;

procedure TfrmEnviaEmail.IdSMTP1Disconnected(Sender: TObject);
begin
	StatusBar1.Panels[1].Text:= 'Desconectado';
end;

procedure TfrmEnviaEmail.ListBoxAnexosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if key = vk_insert then
		btnAnexo.Click
	else if key = vk_delete then
		mnuDeletarAnexoSelecionado.Click;
end;

procedure TfrmEnviaEmail.mnuDeletarAnexoSelecionadoClick(Sender: TObject);
begin
	if ListBoxAnexos.ItemIndex <> -1 then
		ListBoxAnexos.DeleteSelected;
end;

end.
