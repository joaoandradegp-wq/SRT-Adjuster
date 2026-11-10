object Form5: TForm5
  Left = 674
  Top = 311
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Duvidas'
  ClientHeight = 170
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object Label1: TLabel
    Left = 52
    Top = 35
    Width = 93
    Height = 15
    Caption = 'Frame Rate Atual:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 30
    Top = 67
    Width = 113
    Height = 15
    Caption = 'Frame Rate Desejado:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TSpeedButton
    Left = 8
    Top = 128
    Width = 241
    Height = 33
    Caption = 'OK'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btnOKClick
  end
  object btnCancelar: TSpeedButton
    Left = 256
    Top = 128
    Width = 97
    Height = 33
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btnCancelarClick
  end
  object Bevel1: TBevel
    Left = 2
    Top = 109
    Width = 359
    Height = 10
    Shape = bsBottomLine
    Style = bsRaised
  end
  object duvida_fps_atual: TSpeedButton
    Left = 258
    Top = 33
    Width = 23
    Height = 22
    ImageIndex = 1
    ImageName = 'Duvidas'
    Images = Form1.VirtualImageList2
    OnClick = duvida_fps_atualClick
  end
  object duvida_fps_desejado: TSpeedButton
    Left = 258
    Top = 64
    Width = 23
    Height = 22
    ImageIndex = 1
    ImageName = 'Duvidas'
    Images = Form1.VirtualImageList2
    OnClick = duvida_fps_desejadoClick
  end
  object combo_fps_legenda: TComboBox
    Left = 149
    Top = 32
    Width = 105
    Height = 23
    Hint = 'Selecione qual o FPS original da legenda'
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '-----------'
    OnChange = combo_fps_legendaChange
    Items.Strings = (
      '-----------'
      '15'
      '20'
      '21'
      '22'
      '23,976'
      '23,978'
      '24'
      '25'
      '29,97'
      '30')
  end
  object combo_fps_video: TComboBox
    Left = 149
    Top = 64
    Width = 105
    Height = 23
    Hint = 'Selecione o FPS para o qual deseja converter'
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '-----------'
    OnChange = combo_fps_videoChange
    Items.Strings = (
      '-----------'
      '15'
      '20'
      '21'
      '22'
      '23,976'
      '23,978'
      '24'
      '25'
      '29,97'
      '30')
  end
end
