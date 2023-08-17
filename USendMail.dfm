object frmEnviaEmail: TfrmEnviaEmail
  Left = 0
  Top = 0
  Caption = 'Enviar Email com Anexo e Imagem no Corpo do Email'
  ClientHeight = 531
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 8
    Top = 175
    Width = 43
    Height = 15
    Caption = 'Assunto'
  end
  object Label3: TLabel
    Left = 8
    Top = 59
    Width = 17
    Height = 15
    Caption = 'De:'
  end
  object Label4: TLabel
    Left = 16
    Top = 9
    Width = 76
    Height = 15
    Caption = 'Servidor SMTP'
  end
  object Label5: TLabel
    Left = 232
    Top = 9
    Width = 40
    Height = 15
    Caption = 'Usu'#225'rio'
  end
  object Label6: TLabel
    Left = 360
    Top = 9
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object Label7: TLabel
    Left = 284
    Top = 59
    Width = 46
    Height = 15
    Caption = 'Para (To)'
  end
  object Label8: TLabel
    Left = 8
    Top = 120
    Width = 87
    Height = 15
    Caption = 'Com C'#243'pia (CC)'
  end
  object Label9: TLabel
    Left = 284
    Top = 120
    Width = 132
    Height = 15
    Caption = 'Com C'#243'pia Oculta (BCC)'
  end
  object Label10: TLabel
    Left = 8
    Top = 228
    Width = 59
    Height = 15
    Caption = 'Mensagem'
  end
  object btnAnexo: TSpeedButton
    Left = 8
    Top = 447
    Width = 121
    Height = 22
    Caption = 'Inserir Anexo'
    OnClick = btnAnexoClick
  end
  object pg1: TGauge
    Left = 294
    Top = 486
    Width = 406
    Height = 23
    Progress = 0
  end
  object Label11: TLabel
    Left = 8
    Top = 337
    Width = 356
    Height = 15
    Caption = 'Anexos (Pressione INSERT no campo Abaixo para incluir um Anexo)'
  end
  object Label12: TLabel
    Left = 138
    Top = 9
    Width = 28
    Height = 15
    Caption = 'Porta'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 512
    Width = 721
    Height = 19
    Panels = <>
    ExplicitTop = 628
    ExplicitWidth = 918
  end
  object ListBoxAnexos: TListBox
    Left = 8
    Top = 360
    Width = 697
    Height = 81
    ItemHeight = 15
    TabOrder = 0
    OnKeyDown = ListBoxAnexosKeyDown
  end
  object mmoMsg: TMemo
    Left = 8
    Top = 251
    Width = 697
    Height = 80
    Lines.Strings = (
      'CORPO DA MENSAGEM ENVIADA')
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 499
    Top = 33
    Width = 206
    Height = 17
    Caption = 'Meu Servidor Requer Autentica'#231#227'o'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object EdtAssunto: TEdit
    Left = 8
    Top = 196
    Width = 257
    Height = 23
    TabOrder = 3
    Text = 'EMAIL VIA DELPHI'
  end
  object EdtOrigem: TEdit
    Left = 8
    Top = 80
    Width = 257
    Height = 23
    TabOrder = 4
    Text = 'hpdrn@hotmail.com'
  end
  object EdtSMTP: TEdit
    Left = 11
    Top = 30
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'smtp.office365.com'
  end
  object EdtUsuario: TEdit
    Left = 232
    Top = 30
    Width = 121
    Height = 23
    TabOrder = 6
    Text = 'hpdrn@hotmail.com'
  end
  object EdtSenha: TEdit
    Left = 359
    Top = 30
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 7
    Text = 'HP4b6f4194'
  end
  object EdtPara: TEdit
    Left = 284
    Top = 80
    Width = 257
    Height = 23
    TabOrder = 8
    Text = 'liyab38930@tipent.com'
  end
  object EdtCC: TEdit
    Left = 8
    Top = 141
    Width = 257
    Height = 23
    TabOrder = 9
  end
  object EdtBCC: TEdit
    Left = 284
    Top = 141
    Width = 257
    Height = 23
    TabOrder = 10
  end
  object btnEnviar: TBitBtn
    Left = 8
    Top = 484
    Width = 75
    Height = 25
    Caption = 'ENVIAR'
    TabOrder = 11
    OnClick = btnEnviarClick
  end
  object EdtPorta: TEdit
    Left = 138
    Top = 30
    Width = 80
    Height = 23
    TabOrder = 13
    Text = '587'
  end
  object PopupMenu1: TPopupMenu
    Left = 608
    Top = 136
    object mnuDeletarAnexoSelecionado: TMenuItem
      Caption = 'Deletar Annexo Selecionado'
      OnClick = mnuDeletarAnexoSelecionadoClick
    end
    object DeletarTodososAnexos11: TMenuItem
      Caption = 'Deletar Todos os Anexos'
      OnClick = DeletarTodososAnexos11Click
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 664
    Top = 552
  end
  object OpenDialog1: TOpenDialog
    Left = 520
    Top = 232
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 624
    Top = 264
  end
end
