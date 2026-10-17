object Form6_substituir: TForm6_substituir
  Left = 613
  Top = 221
  Margins.Left = 9
  Margins.Top = 9
  Margins.Right = 9
  Margins.Bottom = 9
  BorderStyle = bsDialog
  Caption = 'Substituir'
  ClientHeight = 504
  ClientWidth = 1206
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -33
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 288
  TextHeight = 37
  object Label1: TLabel
    Left = 24
    Top = 60
    Width = 138
    Height = 37
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'L&ocalizar:'
  end
  object Label2: TLabel
    Left = 24
    Top = 138
    Width = 199
    Height = 37
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Su&bstituir por:'
  end
  object btn_localizar: TSpeedButton
    Left = 864
    Top = 24
    Width = 315
    Height = 69
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = '&Localizar'
    Enabled = False
    OnClick = btn_localizarClick
  end
  object btn_substituir: TSpeedButton
    Left = 864
    Top = 102
    Width = 315
    Height = 69
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = '&Substituir'
    Enabled = False
    OnClick = btn_substituirClick
  end
  object btn_substituir_tudo: TSpeedButton
    Left = 864
    Top = 180
    Width = 315
    Height = 69
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Subs&tituir Tudo'
    Enabled = False
    OnClick = btn_substituir_tudoClick
  end
  object btn_cancelar: TSpeedButton
    Left = 864
    Top = 264
    Width = 315
    Height = 69
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Fechar'
    OnClick = btn_cancelarClick
  end
  object Edit1: TEdit
    Left = 228
    Top = 48
    Width = 615
    Height = 45
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 228
    Top = 129
    Width = 615
    Height = 45
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    TabOrder = 1
    OnChange = Edit2Change
    OnKeyDown = Edit2KeyDown
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 336
    Width = 594
    Height = 51
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Diferenciar &mai'#250'sculas de min'#250'sculas'
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 408
    Width = 507
    Height = 51
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Marcar &senten'#231'as encontradas'
    TabOrder = 4
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 264
    Width = 387
    Height = 51
    Margins.Left = 9
    Margins.Top = 9
    Margins.Right = 9
    Margins.Bottom = 9
    Caption = 'Coincidir &palavra inteira'
    TabOrder = 2
    OnClick = CheckBox3Click
  end
end
