object Form2: TForm2
  Left = 394
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 487
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = SYMBOL_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MT Extra'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 16
  object Label2: TLabel
    Left = 9
    Top = 185
    Width = 55
    Height = 15
    Caption = 'Segundos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 9
    Top = 244
    Width = 47
    Height = 15
    Caption = 'Minutos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 304
    Width = 34
    Height = 15
    Caption = 'Horas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TSpeedButton
    Left = 10
    Top = 444
    Width = 290
    Height = 35
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
    Left = 306
    Top = 444
    Width = 103
    Height = 35
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btnCancelarClick
  end
  object Label5: TLabel
    Left = 9
    Top = 363
    Width = 79
    Height = 15
    Caption = 'Milissegundos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ScrollBar1: TScrollBar
    Left = 13
    Top = 207
    Width = 400
    Height = 27
    Max = 59
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 9
    Top = 264
    Width = 400
    Height = 26
    Max = 59
    PageSize = 0
    TabOrder = 2
    OnChange = ScrollBar2Change
  end
  object ScrollBar3: TScrollBar
    Left = 9
    Top = 323
    Width = 400
    Height = 27
    Max = 5
    PageSize = 0
    TabOrder = 3
    OnChange = ScrollBar3Change
  end
  object GroupBox1: TGroupBox
    Left = 221
    Top = 77
    Width = 188
    Height = 86
    Caption = ' Sobre o texto '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object RadioDepois: TRadioButton
      Left = 3
      Top = 26
      Width = 162
      Height = 18
      Caption = 'O texto vir'#225' depois'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RadioDepoisClick
    end
    object RadioAntes: TRadioButton
      Left = 3
      Top = 51
      Width = 154
      Height = 18
      Caption = 'O texto vir'#225' antes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RadioAntesClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 9
    Top = 85
    Width = 188
    Height = 78
    Caption = ' Ajuste do tempo: '
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label4: TLabel
      Left = 11
      Top = 30
      Width = 19
      Height = 28
      Caption = '+'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 36
      Top = 35
      Width = 145
      Height = 22
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '!90:00:00,000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 12
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '00:00:00,000'
    end
  end
  object ScrollBar4: TScrollBar
    Left = 9
    Top = 383
    Width = 400
    Height = 26
    LargeChange = 100
    Max = 900
    PageSize = 0
    SmallChange = 100
    TabOrder = 4
    OnChange = ScrollBar4Change
  end
  object GroupBox3: TGroupBox
    Left = 9
    Top = 9
    Width = 400
    Height = 57
    Caption = ' Ajustar '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object RadioTempo: TRadioButton
      Left = 29
      Top = 24
      Width = 151
      Height = 19
      Caption = 'Tempo da Legenda'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RadioTempoClick
    end
    object RadioDuracao: TRadioButton
      Left = 204
      Top = 24
      Width = 168
      Height = 19
      Caption = 'Dura'#231#227'o dos Di'#225'logos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RadioDuracaoClick
    end
  end
end
