object Form5: TForm5
  Left = 674
  Top = 311
  Margins.Left = 9
  Margins.Top = 9
  Margins.Right = 9
  Margins.Bottom = 9
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Duvidas'
  ClientHeight = 510
  ClientWidth = 993
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -33
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 288
  TextHeight = 37
  object Label1: TLabel
    Left = 156
    Top = 105
    Width = 329
    Height = 44
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Frame Rate Atual:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -36
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 72
    Top = 198
    Width = 403
    Height = 44
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Frame Rate Desejado:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -36
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TSpeedButton
    Left = 24
    Top = 384
    Width = 627
    Height = 99
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'OK'
    Enabled = False
    OnClick = btnOKClick
  end
  object btnCancelar: TSpeedButton
    Left = 672
    Top = 384
    Width = 291
    Height = 99
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object Bevel1: TBevel
    Left = 6
    Top = 327
    Width = 981
    Height = 30
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Shape = bsBottomLine
    Style = bsRaised
  end
  object duvida_fps_atual: TSpeedButton
    Left = 825
    Top = 99
    Width = 69
    Height = 66
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    ImageIndex = 1
    ImageName = 'Duvidas'
    Images = Form1.VirtualImageList2
    OnClick = duvida_fps_atualClick
  end
  object duvida_fps_desejado: TSpeedButton
    Left = 825
    Top = 195
    Width = 69
    Height = 66
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    ImageIndex = 1
    ImageName = 'Duvidas'
    Images = Form1.VirtualImageList2
    OnClick = duvida_fps_desejadoClick
  end
  object combo_fps_legenda: TComboBox
    Left = 504
    Top = 99
    Width = 315
    Height = 52
    Hint = 'Selecione qual o FPS original da legenda'
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -36
    Font.Name = 'Verdana'
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
    Left = 504
    Top = 195
    Width = 315
    Height = 52
    Hint = 'Selecione o FPS para o qual deseja converter'
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -36
    Font.Name = 'Verdana'
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
