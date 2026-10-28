unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ShellAPI, Buttons, ComCtrls, ToolWin,
  ExtCtrls, Menus, Gauges, ClipBrd, pngimage,
  MruUnit,FileCtrl, OleCtrls, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection;

type
  //-------------------------------------------------------------------------------------------------
  {DICIONÁRIO - 01/03}
  //-------------------------------------------------------------------------------------------------
  PHunspell = Pointer;
  function Hunspell_create(affpath, dicpath: PAnsiChar): Pointer; cdecl; external 'hunspell.dll';
  function Hunspell_destroy(handle: Pointer): Integer; cdecl; external 'hunspell.dll';
  function Hunspell_spell(handle: Pointer; word: PAnsiChar): Integer; cdecl; external 'hunspell.dll';
  function SpellOK(const Palavra: string): Boolean;
  function CleanWord(const S: string): string;
  function IsLetter(C: Char): Boolean;
  procedure InitHunspell(const DictName: string);
  //-------------------------------------------------------------------------------------------------

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    btnabrir: TSpeedButton;
    btnsalvarcomo: TSpeedButton;
    btnprocurar: TSpeedButton;
    MainMenu1: TMainMenu;
    Menu_Arquivo: TMenuItem;
    Menu_Sobre: TMenuItem;
    Menu_Idioma: TMenuItem;
    Idioma_Auto: TMenuItem;
    Idioma_Por: TMenuItem;
    Idioma_Eng: TMenuItem;
    lstabrir: TMenuItem;
    lstsalvarcomo: TMenuItem;
    lstprocurar: TMenuItem;
    lstsair: TMenuItem;
    N1: TMenuItem;
    btnconsertar: TSpeedButton;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Selecionar1: TMenuItem;
    Abrir1: TMenuItem;
    Copiar1: TMenuItem;
    lstconsertar: TMenuItem;
    btntempo: TSpeedButton;
    ProgressBar1: TProgressBar;
    ListBox2: TListBox;
    Label3: TLabel;
    btneditar: TSpeedButton;
    Panel1: TPanel;
    lsttempo: TMenuItem;
    lsteditar: TMenuItem;
    N2: TMenuItem;
    RichText1: TRichEdit;
    RichText2: TRichEdit;
    btnsalvar: TSpeedButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    lstsalvar: TMenuItem;
    Image1: TImage;
    Image3: TImage;
    Image2: TImage;
    btnstretch: TSpeedButton;
    lststretch: TMenuItem;
    Menu_Ferramentas: TMenuItem;
    lstrecente: TMenuItem;
    N3: TMenuItem;
    btnnumeros: TSpeedButton;
    lstnumeros: TMenuItem;
    Menu_Caracter: TMenuItem;
    lstitalic: TMenuItem;
    lstunderline: TMenuItem;
    btn_editAvancada: TSpeedButton;
    lst_editAvancada: TMenuItem;
    ColorDialog1: TColorDialog;
    box_edicao: TGroupBox;
    btnitalico: TSpeedButton;
    btnunderline: TSpeedButton;
    combo_tamanho: TComboBox;
    lstlocalizar: TMenuItem;
    lstsubstituir: TMenuItem;
    N5: TMenuItem;
    edit_legenda: TEdit;
    panel_icone_legenda: TPanel;
    Image4: TImage;
    Bevel1: TBevel;
    btnfraps: TSpeedButton;
    lstfraps: TMenuItem;
    btnrenomear: TSpeedButton;
    lstrenomear: TMenuItem;
    Sobre1: TMenuItem;
    btnfonte: TSpeedButton;
    lstfonte: TMenuItem;
    N01: TMenuItem;
    Label5: TLabel;
    Localizar1: TMenuItem;
    btnfundo: TSpeedButton;
    btntags: TSpeedButton;
    lsttags: TMenuItem;
    btn_ortografia: TSpeedButton;
    lst_ortografia: TMenuItem;
    btnclosecaption: TSpeedButton;
    lstclosecaption: TMenuItem;
    Imagem_Grande: TImageCollection;
    Imagem_Pequena: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    VirtualImageList2: TVirtualImageList;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label2: TLabel;
    ListBox3: TListBox;
    Image5: TImage;
    Idioma_Esp: TMenuItem;
    Idioma_Ita: TMenuItem;
    Idioma_Fra: TMenuItem;
    procedure ListBox1Click(Sender: TObject);
    procedure btnsalvarcomoClick(Sender: TObject);
    procedure btnprocurarClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure lstsairClick(Sender: TObject);
    procedure lstprocurarClick(Sender: TObject);
    procedure lstabrirClick(Sender: TObject);
    procedure lstsalvarcomoClick(Sender: TObject);
    procedure Selecionar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure btnconsertarClick(Sender: TObject);
    procedure lstconsertarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btntempoClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure lsteditarClick(Sender: TObject);
    procedure lsttempoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RichText1Change(Sender: TObject);
    procedure RichText1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RichText2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnsalvarClick(Sender: TObject);
    procedure lstsalvarClick(Sender: TObject);
    procedure btnabrirClick(Sender: TObject);
    procedure btnstretchClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnnumerosClick(Sender: TObject);
    procedure lststretchClick(Sender: TObject);
    procedure lstnumerosClick(Sender: TObject);
    procedure RichText1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RichText2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btn_editAvancadaClick(Sender: TObject);
    procedure lst_editAvancadaClick(Sender: TObject);
    procedure lstitalicClick(Sender: TObject);
    procedure lstunderlineClick(Sender: TObject);
    procedure btnunderlineClick(Sender: TObject);
    procedure btnitalicoClick(Sender: TObject);
    procedure combo_tamanhoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstlocalizarClick(Sender: TObject);
    procedure lstsubstituirClick(Sender: TObject);
    procedure edit_legendaEnter(Sender: TObject);
    procedure RichText1Enter(Sender: TObject);
    procedure btnfrapsClick(Sender: TObject);
    procedure lstfrapsClick(Sender: TObject);
    procedure btnrenomearClick(Sender: TObject);
    procedure lstrenomearClick(Sender: TObject);
    procedure combo_tamanhoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Sobre1Click(Sender: TObject);
    procedure btnfonteClick(Sender: TObject);
    procedure lstfonteClick(Sender: TObject);
    procedure Localizar1Click(Sender: TObject);
    procedure btnfundoClick(Sender: TObject);
    procedure Menu_SobreClick(Sender: TObject);
    procedure Idioma_AutoClick(Sender: TObject);
    procedure Idioma_PorClick(Sender: TObject);
    procedure Idioma_EngClick(Sender: TObject);
    procedure btntagsClick(Sender: TObject);
    procedure btn_ortografiaClick(Sender: TObject);
    procedure btnclosecaptionClick(Sender: TObject);
    procedure lstclosecaptionClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Idioma_EspClick(Sender: TObject);
    procedure Idioma_ItaClick(Sender: TObject);
    procedure Idioma_FraClick(Sender: TObject);
  private
  { Private declarations }
    //-----------------------------------------------------------------
    {ARRASTA E SOLTA - 01/02}
    //-----------------------------------------------------------------
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    //-----------------------------------------------------------------
    {ESCALA DE DPI - posições em pixels}
    //-----------------------------------------------------------------
    function S(v: Integer): Integer;
    procedure AjustarAlturas;
    //-----------------------------------------------------------------
    procedure OrganizarListas;
    procedure ToggleLista(LB: TListBox; Lbl: TLabel);
    //-----------------------------------------------------------------
    procedure TraduzirContagem;
  public
  { Public declarations }
    //-----------------------------------------------------------------
    function Novo_Carregar(parametro: String): Boolean;
    //-----------------------------------------------------------------
  end;

var
  Form1: TForm1;
   MostRecentFiles1: TMostRecentFiles;
   //-------------------------
   {DICIONÁRIO - 02/03}
   //-------------------------
   HunHandle: Pointer;
   HunDictAtual: string;
   //-------------------------

  //---------------------------------
  {SEGURAR PROCESSAMENTO DO ONCHANGE}
  //---------------------------------
  FProcessandoLegenda: Boolean;
  //---------------------------------

  //---------------------------------
  {DADOS DO SRT ADJUSTER - VARIÁVEIS}
  SRT_EXE_Global,
  SRT_RAIZ_Global,
  SRT_VERSAO_Global,
  SRT_BLOG_Global:String;
  //---------------------------------

  dialogo,linha,linha_atual,cont_legenda_global,ListBox_Novo: Integer;
  salvar,editar: Boolean;
  caminho_arquivo, tempo, entrada: String;

  vt_sobreposicao,vt_limitelinha,vt_closecaption: Array of Integer;
  vt_tempo,vt_id,vt_linha,vt_linha_localizar,vt_seriado,vt_nome_arquivo,vt_nome_arquivo_normal: Array of String;
  arquivo:TextFile;
  Flags : Cardinal;

  Hun: PHunspell;

const
  qtde_formatos = 11;
  videos_suportados: array[0..qtde_formatos] of String =
  ('.mp4','.avi','.mpg','.mpeg','.mov','.rmvb','.rm','.ra','.wmv','.wma','.flv','.mkv');

//------------------------------
{ALTERA COR DA LEGENDA - 01/03}
//------------------------------
const
  EM_SETTEXTMODE = WM_USER + 89;
  TM_PLAINTEXT   = 1;
  TM_RICHTEXT    = 2;
//------------------------------
//------------------------------

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, CommCtrl, Funcoes, Language, System.IOUtils;

//-------------------------------------------------------------------------------------------------
function NumeroDoCaption(const S: string): Integer;
var
i: Integer;
N: string;
begin
N:='';
  for i:=1 to Length(S) do
    if CharInSet(S[i], ['0'..'9']) then
    N:=N+S[i];
Result:=StrToIntDef(N,0);
end;
//-------------------------------------------------------------------------------------------------
procedure TForm1.TraduzirContagem;
var
nLinhas, nDialogos: Integer;
begin
  if not Label4.Visible then
  Exit;

nLinhas  :=NumeroDoCaption(Label4.Caption);
nDialogos:=NumeroDoCaption(Label8.Caption);

Label4.Caption:=Format(Lang_SRT(41),[nLinhas]);
Label8.Caption:=Format(Lang_SRT(42),[nDialogos]);
end;
//-------------------------------------------------------------------------------------------------
{Rola o Destino para a mesma primeira linha visível da Origem}
//-------------------------------------------------------------------------------------------------
procedure SincronizarRolagem(Origem, Destino: TRichEdit);
var
PrimOrigem, PrimDestino: Integer;
begin
PrimOrigem :=SendMessage(Origem.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
PrimDestino:=SendMessage(Destino.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
SendMessage(Destino.Handle, EM_LINESCROLL, 0, PrimOrigem - PrimDestino);
end;
//-------------------------------------------------------------------------------------------------
{Empilha Label1/ListBox1, Label3/ListBox2 e Label2/ListBox3 sem sobrepor}
//-------------------------------------------------------------------------------------------------
procedure TForm1.OrganizarListas;
var
y: Integer;

  procedure Empilha(Lbl: TLabel; LB: TListBox);
  begin
    if not Lbl.Visible then
    begin
    LB.Visible := False;
    Exit;
    end;

  Lbl.Top := y;
  Inc(y, S(16));

    if LB.Visible then
    begin
    LB.Top := y;
    Inc(y, LB.Height + S(4));
    end;
  end;

begin
y := Label1.Top;
Empilha(Label1, ListBox1);
Empilha(Label3, ListBox2);
Empilha(Label2, ListBox3);
Image3.Top := Label3.Top - S(1);
Image5.Top := Label2.Top - S(1);
end;
//-------------------------------------------------------------------------------------------------
procedure TForm1.ToggleLista(LB: TListBox; Lbl: TLabel);
begin
  if (LB.Items.Count > 0) and (not LB.Visible) then
  begin
  LB.Left  := Lbl.Left + S(11);
  LB.Width := S(94);
    if LB.Items.Count < 11 then
    LB.Height := LB.Items.Count * S(14) + S(1)
    else
    LB.Height := S(145);
  LB.Visible := True;
  end
  else
  LB.Visible := False;

OrganizarListas;
end;
//-------------------------------------------------------------------------------------------------
{ESCALA DE DPI}
//-------------------------------------------------------------------------------------------------
{Converte um valor em pixels (pensado para 96 DPI) para o DPI atual do form}
function TForm1.S(v: Integer): Integer;
begin
Result := MulDiv(v, CurrentPPI, 96);
end;
//-------------------------------------------------------------------------------------------------
{Ajusta a altura dos RichEdit (1 ou 2 visíveis) até a barra de status}
procedure TForm1.AjustarAlturas;
var
area: Integer;
begin
area := StatusBar1.Top - RichText1.Top - S(4); //--> espaço útil até a barra de status

  if RichText2.Visible then
  begin
    if RichText1.Visible then
    begin
    RichText1.Height := (area - S(5)) div 2;
    RichText2.Height := RichText1.Height;
    RichText2.Top    := RichText1.Top + RichText1.Height + S(5);
    end
    else
    begin
    RichText2.Top    := RichText1.Top;
    RichText2.Height := area;
    end;
  end
  else
  RichText1.Height := area;

end;
//-------------------------------------------------------------------------------------------------
function RemoverCC(const S: string; var DentroCC: Boolean;
  var Contador: Integer): string;
var
i: Integer;
begin
Result := '';

  for i := 1 to Length(S) do
  begin
    if DentroCC then
    begin

      if S[i] = ']' then
      begin
      DentroCC := False;
      Inc(Contador);
      end;

    end
    else if S[i] = '[' then
    DentroCC := True
    else
    Result := Result + S[i];
  end;

end;
//-------------------------------------------------------------------------------------------------
{DICIONÁRIO - 03/03}
//-------------------------------------------------------------------------------------------------
function IsLetter(C: Char): Boolean;
begin
  Result :=
    ((C >= 'A') and (C <= 'Z')) or
    ((C >= 'a') and (C <= 'z')) or
    (Ord(C) >= 192);
end;
//-------------------------------------------------------------------------------------------------
function CleanWord(const S: string): string;
begin
 Result := LowerCase(Trim(S));
end;
//-------------------------------------------------------------------------------------------------
function SpellOK(const Palavra: string): Boolean;
var
W: AnsiString;
begin
  if Palavra = '' then
  Exit;

W:=AnsiString(LowerCase(Palavra));
Result := Hunspell_spell(HunHandle, PAnsiChar(W)) <> 0;

end;
//-------------------------------------------------------------------------------------------------
function IsTooShort(const S: string): Boolean;
begin
Result := Length(S) <= 3;
end;
//-------------------------------------------------------------------------------------------------
function DictNameForLang(Idioma: Integer): string;
begin
  case Idioma of
    1: Result := 'pt_BR';
    2: Result := 'en_US';
    3: Result := 'es_ES';
    4: Result := 'it_IT';
    5: Result := 'fr';
  else
    if GetLanguageWin = 'pt' then
      Result := 'pt_BR'
    else if GetLanguageWin = 'es' then
      Result := 'es_ES'
    else if GetLanguageWin = 'it' then
      Result := 'it_IT'
    else if GetLanguageWin = 'fr' then
      Result := 'fr'
    else
      Result := 'en_US';
  end;
end;
//-------------------------------------------------------------------------------------------------
procedure InitHunspell(const DictName: string);
var
AffPath, DicPath: UTF8String;
begin

if (HunHandle <> nil) and SameText(HunDictAtual, DictName) then
Exit;

  if HunHandle <> nil then
  begin
  Hunspell_destroy(HunHandle);
  HunHandle := nil;
  HunDictAtual := '';
  end;

AffPath := UTF8Encode(
  IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
  'dict\' + DictName + '.aff');

DicPath := UTF8Encode(
  IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
  'dict\' + DictName + '.dic');

  if not FileExists(string(AffPath)) or not FileExists(string(DicPath)) then
    raise Exception.Create(Lang_SRT(38));

  HunHandle := Hunspell_create(
    PAnsiChar(AffPath),
    PAnsiChar(DicPath)
  );

  if HunHandle = nil then
  raise Exception.Create(Lang_SRT(39));

HunDictAtual := DictName;
end;
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------

{$R *.dfm}

//------------------------------------------------------------------------------
function LerArquivoTexto(const Arq: string): string;
var
  Bytes: TBytes;
  Enc: TEncoding;
  Off: Integer;
begin
  Result := '';
  Bytes := TFile.ReadAllBytes(Arq);
  if Length(Bytes) = 0 then
  Exit;

  Enc := nil;
  Off := TEncoding.GetBufferEncoding(Bytes, Enc, TEncoding.ANSI);

  if (Off = 0) and
     (MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, @Bytes[0], Length(Bytes), nil, 0) > 0) then
  Enc := TEncoding.UTF8;

  Result := Enc.GetString(Bytes, Off, Length(Bytes) - Off);

  Result := StringReplace(Result, #$0085, '...', [rfReplaceAll]);
  Result := StringReplace(Result, #$2028, ' ',   [rfReplaceAll]);
  Result := StringReplace(Result, #$2029, ' ',   [rfReplaceAll]);
end;
//------------------------------------------------------------------------------
{RESETAR DA MEMÓRIA O CAMPO RICHTEXT}
//------------------------------------------------------------------------------
procedure SoftResetPreserveText(RE: TRichEdit);
var
Backup: string;
begin
Backup := RE.Text;

SendMessage(RE.Handle, WM_SETREDRAW, 0, 0);
SendMessage(RE.Handle, EM_SETTEXTMODE, TM_PLAINTEXT, 0);
RE.Clear;
SendMessage(RE.Handle, EM_SETTEXTMODE, TM_RICHTEXT, 0);

RE.Text := Backup;
RE.SelAttributes.Assign(RE.DefAttributes);

SendMessage(RE.Handle, WM_SETREDRAW, 1, 0);
RE.Invalidate;
end;
//------------------------------------------------------------------------------
{ALTERA COR DA LEGENDA - 02/03}
//------------------------------------------------------------------------------
procedure AtualizarTextoComFont(Lines: TStrings;const HexColor: string;Progress: TProgressBar);
var
i: Integer;
Line, CleanLine: string;
begin
Progress.Visible := True;
Progress.Position := 0;
Progress.Max := Lines.Count;

  for i := 0 to Lines.Count - 1 do
  begin
  Line := Lines[i];

    if (Trim(Line) <> '') and
       (not IsNumeric(Line)) and
       (Pos('-->', Line) = 0) then
    begin
    CleanLine := Line;

      while Pos('<font', LowerCase(CleanLine)) > 0 do
      Delete(
          CleanLine,
          Pos('<font', LowerCase(CleanLine)),
          Pos('>', CleanLine) -
          Pos('<font', LowerCase(CleanLine)) + 1
      );

    CleanLine := StringReplace(CleanLine, '</font>', '', [rfIgnoreCase]);
    Lines[i] := '<font color="#' + HexColor + '">' + CleanLine + '</font>';
    end;

    if (i mod 100 = 0) then
    begin
    Progress.Position := i + 1;
    Application.ProcessMessages;
    end;

  end;

Progress.Visible := False;
end;
//------------------------------------------------------------------------------
{ALTERA COR DA LEGENDA - 03/03}
//------------------------------------------------------------------------------
procedure ColorirVisualLimitado(RE: TRichEdit;AColor: TColor;MaxDialogos: Integer);
var
i, DialogosColoridos, j: Integer;
LineStart: Integer;
begin

  //-----------------------------------------------------------------
  {BRANCO: Não interpreta a cor no visual, mantém só o código da tag}
  //-----------------------------------------------------------------
  if (AColor = RE.Color) then
  Exit;
  //-----------------------------------------------------------------

DialogosColoridos := 0;
SendMessage(RE.Handle, WM_SETREDRAW, 0, 0);
i := 0;

  while i < RE.Lines.Count do
  begin
    if Pos(' --> ', RE.Lines[i]) > 0 then
    begin
    Inc(DialogosColoridos);
      if DialogosColoridos > MaxDialogos then
      Break;

    j := i + 1;

      while (j < RE.Lines.Count) and (Trim(RE.Lines[j]) <> '') do
      begin
      LineStart := RE.Perform(EM_LINEINDEX, j, 0);
      RE.SelStart := LineStart;
      RE.SelLength := Length(RE.Lines[j]);
      RE.SelAttributes.Color := AColor;
      Inc(j);
      end;

    i := j;
    end
    else
    Inc(i);

  end;

SendMessage(RE.Handle, WM_SETREDRAW, 1, 0);
RE.Invalidate;
end;
//------------------------------------------------------------------------------
{ARRASTA E SOLTA - 02/02}
//------------------------------------------------------------------------------
procedure TForm1.WMDropFiles(var Msg: TWMDropFiles);
var
Drop: HDROP;
FileCount: Integer;
BufferSize: Integer;
FileName: string;
begin
Drop := Msg.Drop;

  try
  FileCount := DragQueryFile(Drop, $FFFFFFFF, nil, 0);

    if FileCount = 0 then
    Exit;

    if FileCount > 1 then
    MessageBox(Handle,PChar(Lang_SRT(10)),
      PChar(Application.Title),
      MB_ICONINFORMATION or MB_OK);

  BufferSize := DragQueryFile(Drop, 0, nil, 0);
  SetLength(FileName, BufferSize);

  DragQueryFile(Drop, 0, PChar(FileName), BufferSize + 1);

    if LowerCase(ExtractFileExt(FileName)) <> '.srt' then
    begin
    MessageBox(Handle,PChar(Lang_SRT(11)),
      PChar(Application.Title),
      MB_ICONSTOP or MB_OK);
    Exit;
    end;
    Novo_Carregar(FileName);

  finally
  DragFinish(Drop);
  end;
Msg.Result := 0;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TForm1.Novo_Carregar(parametro: String): Boolean;
const
B  = 1;         // Byte
KB = 1024 * B ; // Kilobyte
MB = 1024 * KB; // Megabyte
GB = 1024 * MB; // Gigabyte
var
SR: TSearchRec;
Bytes: TBytes;
MS: TBytesStream;
begin




Form1.Caption:=Application.Title;
RichText1.Color:=clWhite;
Panel1.Visible:=True;
//-------------
BotoesTopo_Off;
//-------------
//--------------------------
box_edicao.Visible:=False;
lstitalic.Enabled:=False;
lstunderline.Enabled:=False;
lstfonte.Enabled:=False;
//--------------------------
//---------------------------
lstlocalizar.Enabled:=False;
lstsubstituir.Enabled:=False;
//---------------------------
//-----------------------
RichText1.Clear;
RichText2.Clear;
RichText2.Visible:=False;
//-----------------------

{MODO DE EDICÃO}
//--------------------------------------------
editar:=False; //--> Variável GLOBAL (Editar)
if RichText1.ReadOnly = False then
RichText1.ReadOnly:=True;
//--------------------------------------------

 //-----------------------------------------------------------------
 ProgressBar1.Visible:=True;
 AssignFile(arquivo,parametro);
 Reset(arquivo);
 //-----------------------------------------------------------------------
 ProgressBar1.Position:=0;
 ProgressBar1.Visible:=True;
 ProgressBar1.Refresh;
 Application.ProcessMessages;
 //-----------------------------------------------------------------------

   while not eof (arquivo) do
   begin
   Readln(arquivo,entrada);
   ProgressBar1.Position := ProgressBar1.Position + 1;
   end;

 CloseFile(arquivo);

 Bytes := TEncoding.Unicode.GetPreamble + TEncoding.Unicode.GetBytes(LerArquivoTexto(parametro));
 MS := TBytesStream.Create(Bytes);
  try
  RichText1.Lines.LoadFromStream(MS);
  finally
  MS.Free;
  end;

 FindFirst(parametro,faArchive,SR);

 //-------------------------------------------------------------------------------------
 Label5.Caption:=Copy(FloatToStr(SR.Size/KB),0,pos(',',FloatToStr(SR.Size/KB))+1)+' KB';
 FindClose(SR);
 Contar_Linhas_Dialogos(RichText1,ProgressBar1,Label4,Label8);
 //-------------------------------------------------------------------------------------

 {DIÁLOGO - INÍCIO}
 if dialogo > 0 then
 begin
 //-----------------------------------------------------------------
 Form1.Caption:=Application.Title+' - '+ExtractFileName(parametro);
 edit_legenda.Text:='      '+ExtractFileName(parametro);
 MostRecentFiles1.AddFile(ExtractFileName(parametro));
 caminho_arquivo:=parametro;
 //-----------------------------------------------------------------

 StatusBar1.Panels[0].Text:='';
 lstlocalizar.Enabled:=True;

 RichText1.Visible:=True;
 AjustarAlturas;

   {LINHAS, DIÁLOGOS e TAMANHO}
   if (Label4.Visible = False) then
   begin
   Label5.Visible:=True;
   Label4.Visible:=True;
   Label8.Visible:=True;
   end;

 //----------------------------
 btnabrir.Enabled:=True;
 lstabrir.Enabled:=True;
 btnprocurar.Enabled:=True;
 lstprocurar.Enabled:=True;
 btn_editAvancada.Enabled:=True;
 lst_editAvancada.Enabled:=True;
 btntempo.Enabled:=True;
 lsttempo.Enabled:=True;
 btnstretch.Enabled:=True;
 lststretch.Enabled:=True;
 btnfraps.Enabled:=True;
 lstfraps.Enabled:=True;
 btnnumeros.Enabled:=True;
 lstnumeros.Enabled:=True;
 btnrenomear.Enabled:=True;
 lstrenomear.Enabled:=True;
 btntags.Enabled:=True;
 lsttags.Enabled:=True;
 btnclosecaption.Enabled:=False;
 lstclosecaption.Enabled:=False;
 //----------------------------

 {SOBREPOSIÇÕES}
 Label1.Caption:='';
 Label1.Font.Color:=clBlack;
 ListBox1.Clear;
 ListBox1.Visible:=False;

 {LIMITES DE LINHA}
 Label3.Caption:='';
 ListBox2.Clear;
 ListBox2.Visible:=False;

{CLOSED CAPTION}
Label2.Caption:='';
ListBox3.Clear;
ListBox3.Visible:=False;

  //--------------------------------------------------------------------
  if (RichText1.SelAttributes.Style = [fsBold]) then
  begin
  RichText1.SelectAll;
  RichText1.SelAttributes.Style:=RichText1.SelAttributes.Style-[fsBold];
  RichText1.SelStart:=0;
  end;

  if (RichText1.SelAttributes.Style = [fsItalic]) then
  begin
  RichText1.SelectAll;
  RichText1.SelAttributes.Style:=RichText1.SelAttributes.Style-[fsItalic];
  RichText1.SelStart:=0;
  end;
  //--------------------------------------------------------------------

  //------------------------------------------
  if (RichText1.SelAttributes.Size > 8) then
  begin
  RichText1.SelectAll;
  RichText1.SelAttributes.Size:=8;
  combo_tamanho.ItemIndex:=0;
  end;

  if (RichText2.SelAttributes.Size > 8) then
  begin
  RichText2.SelectAll;
  RichText2.SelAttributes.Size:=8;
  combo_tamanho.ItemIndex:=0;
  end;
  //------------------------------------------

 {Leva para a primeira linha do RichText1}
 SendMessage(RichText1.Handle, WM_VSCROLL, SB_TOP, 0);

 RichText1.SelStart:=0;
 salvar:=False;
 Panel1.Visible:=False;
 end
 else
 begin
 Panel1.Visible:=True;
 MessageBox(Application.Handle, pchar(Lang_SRT(12)+#13#13+'Error code:  #0102'), pchar(Application.Title), MB_ICONSTOP+MB_OK);
 StatusBar1.Panels[0].Text:=Lang_SRT(12)+#13#13+'Error code:  #0102';
 //------------------------
 btnabrir.Enabled:=True;
 lstabrir.Enabled:=True;
 btnrenomear.Enabled:=True;
 lstrenomear.Enabled:=True;
 //------------------------
 end;
 {DIÁLOGO - FIM}

ProgressBar1.Visible:=False;
Result:=True;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
//-------------------------------------------
{CARREGA O IDIOMA ESCOLHIDO E APLICA NO FORM}
Lang_Load;
Lang_SRT(0);
//-------------------------------------------

//----------------------------
{ARRASTAR E SOLTAR - ATIVANDO}
DragAcceptFiles(Handle, True);
//----------------------------

//--------------------------------------------------------------------------
{QUANDO ABRE O EXECUTÁVEL(.EXE) SEM SER ATRAVÉS DO ARQUIVO DE LEGENDA(.SRT)}
if (ParamCount = 0) then
Form1.Caption:=Application.Title;
//--------------------------------------------------------------------------
Panel1.Align:=alClient;
//---------------------

//-------------------------------------------------------------------
{BARRA DE PROGRESSO NA COR LARANJA}
SendMessage(ProgressBar1.Handle, PBM_SETBARCOLOR, 0, rgb(255,140,0));
//-------------------------------------------------------------------

  //----------------------------------
  ProgressBar1.Brush.Color:=clBtnFace;
  //----------------------------------

  //---------------------------------------------------------------------
  {LISTA DAS ÚLTIMAS LEGENDAS ABERTAS}
  MostRecentFiles1:=TMostRecentFiles.Create(Self);
  MostRecentFiles1.MaxFiles:=8;
  MostRecentFiles1.IniFile:=ChangeFileExt(paramstr(0),'.ini');
  MostRecentFiles1.OwnerMenuItem:=lstrecente;
  MostRecentFiles1.MenuPosition:=1;
  MostRecentFiles1.ShowFullPath:=True;
  //---------------------------------------------------------------------

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//FinalizeHunspell;
//-------------------------------
{ARRASTAR E SOLTAR - DESATIVANDO}
DragAcceptFiles(Handle, False);
//-------------------------------
end;

procedure TForm1.btnrenomearClick(Sender: TObject);
var
i,cont:Integer;
pasta,nome_arquivo,extensao_video:String;
SR:TSearchRec;
Nao_Encontrados,Sim_Encontrados:TStringList;
begin

 {INÍCIO - SelectDirectory}                   {shell:MyComputerFolder}
 if SelectDirectory(Lang_SRT(40), OpenDialog1.InitialDir ,Pasta) then
 begin

   //---------------------------------------------------
   cont:=0;
   FillChar(vt_nome_arquivo,SizeOf(vt_nome_arquivo),#0); //--> Vetor GLOBAL
   i:=FindFirst(pasta+'\'+'*.*', faAnyFile, SR);
   //---------------------------------------------------

      {INÍCIO - WHILE}
      while i = 0 do
      begin
        {INÍCIO - SR.Attr}
        if (SR.Attr and faDirectory) <> faDirectory then
        begin
        //nome_arquivo:=LowerCase(SR.Name);
        nome_arquivo:=SR.Name;
        extensao_video:=ExtractFileExt(nome_arquivo);
           //-------------------------------------------------------------------------------
           {INÍCIO - EXTENSÃO}
           //-------------------------------------------------------------------------------
           case AnsiIndexStr(extensao_video,videos_suportados) of
           0..qtde_formatos:
                            begin
                            Inc(cont);
                            SetLength(vt_nome_arquivo,cont);    //--> Vetor GLOBAL
                            {NOME DOS ARQUIVOS DE VIDEO}
                            vt_nome_arquivo[cont-1]:=SR.Name;
                            end
                            else
                            begin
                               if (extensao_video = '.srt') then
                               begin
                               Inc(cont);
                               SetLength(vt_nome_arquivo,cont); //--> Vetor GLOBAL
                               {NOME DOS ARQUIVOS DE LEGENDA}
                               vt_nome_arquivo[cont-1]:=SR.Name;
                               end;
                            end;
           end;
           //-------------------------------------------------------------------------------
           {FIM - EXTENSÃO}
           //-------------------------------------------------------------------------------
        end;
        {FIM - SR.Attr}
      i:=FindNext(SR);
      end;
      {FIM - WHILE}

   {DEFINE O TAMANHO DO VETOR PARA ENTRAR EM 'Seriado_Quantidade'}
   //-------------------------------------------------------------
   SetLength(vt_seriado,cont);                 //--> Vetor GLOBAL
   SetLength(vt_nome_arquivo_normal,cont);     //--> Vetor GLOBAL
   //-------------------------------------------------------------

     {INÍCIO - Seriado_Quantidade}
     if Seriado_Quantidade = True then
     begin
     Sim_Encontrados:=TStringList.Create;
     Nao_Encontrados:=TStringList.Create;

        {INÍCIO - FOR}
        for i := 0 to (cont_legenda_global)-1 do
        begin
            {INÍCIO - IF}
            if (FileExists(pasta+'\'+vt_nome_arquivo[i])) then
            begin
              //if (vt_nome_arquivo[i] = LowerCase(vt_nome_arquivo_normal[i])+'.srt') then
              //if SameText(vt_nome_arquivo[i], vt_nome_arquivo_normal[i]+'.srt') then
              if vt_nome_arquivo[i] = vt_nome_arquivo_normal[i]+'.srt' then
              Dec(cont_legenda_global)
              else
              begin
              Sim_Encontrados.Add(vt_nome_arquivo_normal[i]+ExtractFileExt(vt_nome_arquivo[i]));
              RenameFile(pasta+'\'+vt_nome_arquivo[i],pasta+'\'+vt_nome_arquivo_normal[i]+'.srt');
              end;
            end
            else
            Nao_Encontrados.Add(vt_nome_arquivo[i]);
            {FIM - IF}
        end;
        {FIM - FOR}

      //----------------------------------------------------------------------------------------------------------------------------------------
      {MENSAGEM DE CONFIRMAÇÃO AO RENOMEAR OS ARQUIVOS DE LEGENDA}
      //----------------------------------------------------------------------------------------------------------------------------------------
      if Nao_Encontrados.Count > 0 then
      begin
        if Nao_Encontrados.Count = 1 then
        MessageBox(Application.Handle,pchar(Lang_SRT(14)), pchar(Application.Title), MB_ICONINFORMATION+MB_OK)
        else
        MessageBox(Application.Handle,pchar(Format(Lang_SRT(15),[Nao_Encontrados.Count])),pchar(Application.Title),MB_ICONERROR+MB_OK);
      end;
      //----------------------------------------------------------------------------------------------------------------------------------------
      if Sim_Encontrados.Count > 0 then
      begin
        if Sim_Encontrados.Count = 1 then
        MessageBox(Application.Handle,pchar(Lang_SRT(14)), pchar(Application.Title), MB_ICONINFORMATION+MB_OK)
        else
        MessageBox(Application.Handle,pchar(Format(Lang_SRT(15),[Sim_Encontrados.Count])),pchar(Application.Title),MB_ICONINFORMATION+MB_OK);
      end;

      if (Sim_Encontrados.Count = 0) and (Nao_Encontrados.Count = 0) then
      MessageBox(Application.Handle, pchar(Lang_SRT(16)+#13+#13+pasta), pchar(Application.Title), MB_ICONWARNING+MB_OK);
      //----------------------------------------------------------------------------------------------------------------------------------------

     Sim_Encontrados.Free;
     Nao_Encontrados.Free;
     end;
     {FIM - Seriado_Quantidade}

 end;
 {FIM - SelectDirectory}

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
//---------------------------------------------------------------
{SOBREPOSIÇÕES}
//----------------------------------------------------------------
  if RichText2.Visible = False then
  Lista_Indices(RichText1,RichText2,ListBox1,False,vt_sobreposicao)
  else
  begin
  Lista_Indices(RichText2,RichText1,ListBox1,True, vt_sobreposicao);
  SincronizarRolagem(RichText2,RichText1); //--> RichText1 acompanha o RichText2
  end;
//----------------------------------------------------------------
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
//---------------------------------------------------------------
{LIMITES DE LINHA}
//---------------------------------------------------------------
if RichText2.Visible = False then
Lista_Indices(RichText1,RichText2,ListBox2,False,vt_limitelinha)
else
Lista_Indices(RichText2,RichText1,ListBox2,True, vt_limitelinha);
//---------------------------------------------------------------
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
//---------------------------------------------------------------
{CLOSED CAPTION}
//---------------------------------------------------------------
  if RichText2.Visible = False then
  Lista_Indices(RichText1,RichText2,ListBox3,False,vt_closecaption)
  else
  Lista_Indices(RichText2,RichText1,ListBox3,True, vt_closecaption);
//---------------------------------------------------------------
end;

procedure TForm1.btnsalvarcomoClick(Sender: TObject);
begin
//-------------------------------------------------------
SaveDialog1.InitialDir:=ExtractFilePath(caminho_arquivo);
SaveDialog1.FileName:=Trim(edit_legenda.Text);
//-------------------------------------------------------

  //------------------------------------------------------------------------------
  {INÍCIO - SaveDialog1}
  //------------------------------------------------------------------------------
  if SaveDialog1.Execute then
  begin
    //----------------------------------------------------------------------------
    {INÍCIO - FileExists}
    //----------------------------------------------------------------------------
    if FileExists(ExtractFilePath(caminho_arquivo)+SaveDialog1.FileName+'.srt') or
       FileExists(SaveDialog1.FileName) then
    begin
       //----------------------------------------------------------------------------------------------------------------------------------------------------
       {INÍCIO - CASE}
       //----------------------------------------------------------------------------------------------------------------------------------------------------
       case MessageBox(Application.Handle, pchar(Lang_SRT(17)), pchar(Lang_SRT(18)+' '+SaveDialog1.Title), MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) of
       idYes :
         Salvar_Como;
       idNo :
         begin
         salvar:=True;  //--> Variável GLOBAL (Salvar Alterações)
         btnsalvarcomo.Click;
         end;
       end;
       //----------------------------------------------------------------------------------------------------------------------------------------------------
       {FIM - CASE}
       //----------------------------------------------------------------------------------------------------------------------------------------------------
    end
    else
    Salvar_Como;
    //----------------------------------------------------------------------------
    {FIM - FileExists}
    //----------------------------------------------------------------------------
  end;
  //------------------------------------------------------------------------------
  {FIM - SaveDialog1}
  //------------------------------------------------------------------------------

end;

procedure TForm1.btnprocurarClick(Sender: TObject);
var
cont1,cont2,i,j,k: Integer;
tempo1,tempo2: String;
cont3,ContCC,AntesCC,idLinha: Integer;
DentroCC: Boolean;
begin
cont1:=0;
cont2:=0;
k:=0;
cont3:=0;
ContCC:=0;

//-------------
BotoesTopo_Off;
//-------------

//--------------------------
SetLength(vt_linha,dialogo); //--> Define o tamanho do Vetor Dinâmico
SetLength(vt_id,dialogo);    //--> Define o tamanho do Vetor Dinâmico
SetLength(vt_tempo,dialogo); //--> Define o tamanho do Vetor Dinâmico
//--------------------------

ProgressBar1.Visible:=True;
ProgressBar1.Position:=0;
ProgressBar1.Max:=RichText1.Lines.Count;
ProgressBar1.Refresh;

           //----------------------------------------------------------------------------------------
           //SEPARA LINHA, ID, TEMPO e DIÁLOGO da Legenda - INÍCIO
           //----------------------------------------------------------------------------------------
           for j:= 0 to RichText1.Lines.Count-1 do
           begin
           ProgressBar1.Position:=ProgressBar1.Position+1;

             //----------------------------------------------------------------------------------------
             {LINHA, ID, TEMPO - INÍCIO}
             //----------------------------------------------------------------------------------------
             if (IsNumeric(RichText1.lines[j])) and (AnsiContainsStr(RichText1.Lines[j+1],' --> ')) and ((Trim(RichText1.Lines[j-1])) = '') then
             begin
             Inc(k);
             vt_linha[k-1]:=IntToStr(j+1);        //--> Número da Linha
             vt_id[k-1]:=RichText1.Lines[j];      //--> ID da Legenda
             vt_tempo[k-1]:=RichText1.Lines[j+1]; //--> Tempo da Legenda

               //---------------------------------------
               //DIÁLOGO - INÍCIO
               //---------------------------------------
               i:=1;
               while (RichText1.Lines[j+i+1] <> '') do
               begin
               Inc(i);
               {Memo3.Lines.Add(RichText1.Lines[j+i]);} //--> Diálogo da Legenda

                   //INDICA DIÁLOGO ACIMA DE 2 LINHAS
                   if (i>3) then
                   begin
                   Inc(cont1);

                   ListBox2.Items.Add(IntToStr(cont1)+' - '+RichText1.Lines[j]);

                   SetLength(vt_limitelinha,cont1+1); //--> Define o tamanho do Vetor Dinâmico
                   vt_limitelinha[cont1]:=j+1;        //--> Preenche o Vetor com as linhas de LIMITES DE LINHA
                   break;
                   end;

               end;
               {Memo3.Lines.Add('---');}
               //---------------------------------------
               //DIÁLOGO - FIM
               //---------------------------------------
             end;
             //----------------------------------------------------------------------------------------
             //LINHA, ID, TEMPO - FIM
             //----------------------------------------------------------------------------------------
           end;
           //----------------------------------------------------------------------------------------
           //SEPARA LINHA, ID, TEMPO e DIÁLOGO da Legenda - FIM
           //----------------------------------------------------------------------------------------

           //----------------------------------------------------
           //VERIFICA SOBREPOSIÇÕES - INÍCIO
           //----------------------------------------------------
           for i:=0 to Length(vt_tempo)-2 do
           begin
           tempo1:=copy(vt_tempo[i]  ,18,12);
           tempo2:=copy(vt_tempo[i+1],1 ,12);

                if StrToTime(tempo1) > StrToTime(tempo2) then
                begin
                Inc(cont2);

                ListBox1.Items.Add(IntToStr(cont2)+' - '+vt_id[i]);

                SetLength(vt_sobreposicao,cont2+1);            //--> Define o tamanho do Vetor Dinâmico
                vt_sobreposicao[cont2]:=StrToInt(vt_linha[i]); //--> Preenche o Vetor com as linhas de SOBREPOSIÇÕES
                end;
           end;
           //----------------------------------------------------
           //VERIFICA SOBREPOSIÇÕES - FIM
           //----------------------------------------------------

   //----------------------------------------------------
   //VERIFICA CLOSED CAPTION - INÍCIO
   //----------------------------------------------------
   SetLength(vt_closecaption,1);
   j:=0;

     while j < RichText1.Lines.Count do
     begin
       if (IsNumeric(Trim(RichText1.Lines[j]))) and
          (j + 1 < RichText1.Lines.Count) and
          (AnsiContainsStr(RichText1.Lines[j+1], ' --> ')) then
       begin
       idLinha:=j;
       DentroCC:=False;
       AntesCC:=ContCC;
       Inc(j, 2);

         while (j < RichText1.Lines.Count) and (Trim(RichText1.Lines[j]) <> '') do
         begin
         RemoverCC(RichText1.Lines[j], DentroCC, ContCC);
         Inc(j);
         end;

         if ContCC > AntesCC then
         begin
         Inc(cont3);
         ListBox3.Items.Add(IntToStr(cont3)+' - '+RichText1.Lines[idLinha]);
         SetLength(vt_closecaption,cont3+1);
         vt_closecaption[cont3]:=idLinha+1;   //--> nº da linha (1-based), igual aos outros
         end;
       end
       else
       Inc(j);
     end;
   //----------------------------------------------------
   //VERIFICA CLOSED CAPTION - FIM
   //----------------------------------------------------

   //-----------------------------------------------------------------------
   //CLOSED CAPTION - TEXTOS
   //-----------------------------------------------------------------------
   if (cont3 > 0) then
   begin
     if (cont3 = 1) then
     Label2.Caption:=Lang_SRT(95)
     else
     Label2.Caption:=Format(Lang_SRT(96),[cont3]);

   Image5.Left:=Label2.Left+Label2.Width+S(3);
   Label2.Visible:=True;
   Image5.Visible:=True;
   btnclosecaption.Enabled:=True;
   lstclosecaption.Enabled:=True;
   end;

   //-----------------------------------------------------------------------
   //LIMITES DE LINHA - TEXTOS
   //-----------------------------------------------------------------------
   if (cont1 > 0) then
   begin
    if (cont1 = 1) then
    Label3.Caption:=Lang_SRT(31)
    else
    Label3.Caption:=Format(Lang_SRT(32),[cont1]);

   //----------------------------------------
   Image3.Left:=Label3.Left+Label3.Width+S(3);
   Label3.Visible:=True;
   Image3.Visible:=True;
   //----------------------------------------
   btneditar.Enabled:=True;
   lsteditar.Enabled:=True;
   //----------------------------------------

    if (cont1 = 1) then
    StatusBar1.Panels[0].Text:=Lang_SRT(19)
    else
    StatusBar1.Panels[0].Text:=Format(Lang_SRT(20),[cont1+cont2]);
   end;

   //-----------------------------------------------------------------------
   //SOBREPOSIÇÕES - TEXTOS
   //-----------------------------------------------------------------------
   if (cont2 > 0) then
   begin
      if (cont2 = 1) then
      Label1.Caption:=Lang_SRT(33)
      else
      Label1.Caption:=Format(Lang_SRT(34),[cont2]);

   //----------------------------------------
   Image1.Left:=Label1.Left+Label1.Width+S(3);
   Label1.Font.Color:=clRed; //LETRA VERMELHA
   Label1.Visible:=True;
   Image1.Visible:=True;
   Image2.Left:=Image1.Left;
   //----------------------------------------
   btnconsertar.Enabled:=True;
   lstconsertar.Enabled:=True;

     if (cont2 = 1) then
     StatusBar1.Panels[0].Text:=Lang_SRT(19)
     else
     StatusBar1.Panels[0].Text:=Format(Lang_SRT(20),[cont1+cont2]);
   end;
   //-----------------------------------------------------------------------

     if (cont1 = 0) and (cont2 = 0) then
     begin
     //-----------------------
     btntempo.Enabled  :=True;
     lsttempo.Enabled  :=True;
     btnstretch.Enabled:=True;
     lststretch.Enabled:=True;
     btnfraps.Enabled  :=True;
     lstfraps.Enabled  :=True;
     btnnumeros.Enabled:=True;
     lstnumeros.Enabled:=True;
     btn_editAvancada.Enabled:=True;
     lst_editAvancada.Enabled:=True;
     //-----------------------
     StatusBar1.Panels[0].Text:=Lang_SRT(21);
     end;

OrganizarListas;

ProgressBar1.Visible:=False;
//------------------------
btnabrir.Enabled:=True;
lstabrir.Enabled:=True;
btnrenomear.Enabled:=True;
lstrenomear.Enabled:=True;
//------------------------

end;

procedure TForm1.Selecionar1Click(Sender: TObject);
begin
//-------------------------------
{ALT+A}
//-------------------------------
if RichText1.CanFocus = True then
RichText1.SelectAll;
//-------------------------------
if RichText2.CanFocus = True then
RichText2.SelectAll;
//-------------------------------
end;

procedure TForm1.Copiar1Click(Sender: TObject);
begin
//-------------------------------
{CTRL+C}
//-------------------------------
if RichText1.CanFocus = True then
RichText1.CopyToClipboard;
//-------------------------------
if RichText2.CanFocus = True then
RichText2.CopyToClipboard;
//-------------------------------
end;

procedure TForm1.btnconsertarClick(Sender: TObject);
var
  i, k, ln: Integer;
  tempo1, tempo2: String;
  SL: TStringList;
  Rot: array[1..3] of TLabel;
  Lst: array[1..3] of TListBox;
  RotVis, LstVis: array[1..3] of Boolean;
  RotCap: array[1..3] of String;
  Itens: array[1..3] of TStringList;
  Img3Vis, Img5Vis: Boolean;
begin
salvar:=True;  //--> Variável GLOBAL (Salvar Alterações)

Rot[1]:=Label1; Lst[1]:=ListBox1;
Rot[2]:=Label3; Lst[2]:=ListBox2;
Rot[3]:=Label2; Lst[3]:=ListBox3;

  for k:=1 to 3 do
  begin
  RotVis[k]:=Rot[k].Visible;
  LstVis[k]:=Lst[k].Visible;
  RotCap[k]:=Rot[k].Caption;
  Itens[k]:=TStringList.Create;
  Itens[k].Assign(Lst[k].Items);
  end;

Img3Vis:=Image3.Visible;
Img5Vis:=Image5.Visible;

  try
  //-------------
  BotoesTopo_Off;
  //-------------

    for k:=1 to 3 do
    begin
    Rot[k].Caption:=RotCap[k];
      if Lst[k].Items.Count <> Itens[k].Count then
      Lst[k].Items.Assign(Itens[k]);
    Rot[k].Visible:=RotVis[k];
    Lst[k].Visible:=LstVis[k];
    end;

  Image3.Visible:=Img3Vis;
  Image5.Visible:=Img5Vis;

  ProgressBar1.Visible:=True;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=Length(vt_tempo)-1;
  ProgressBar1.Refresh;

  SL:=TStringList.Create;
    try
    SL.Assign(RichText1.Lines);

      for i:=0 to Length(vt_tempo)-2 do
      begin
      ProgressBar1.Position:=i+1;
      tempo1:=Copy(vt_tempo[i]  ,18,12);
      tempo2:=Copy(vt_tempo[i+1],1 ,12);

        if StrToTime(tempo1) > StrToTime(tempo2) then
        begin
        ln:=StrToInt(vt_linha[i]);
          if (ln < SL.Count) and (Copy(SL[ln],18,12) = tempo1) then
          SL[ln]:=Copy(SL[ln],1,17) + tempo2 + Copy(SL[ln],30,MaxInt);
        end;
      end;

    RichText2.Lines.Assign(SL);
    finally
    SL.Free;
    end;
  finally
    for k:=1 to 3 do
    Itens[k].Free;
  end;

RichText2.Visible:=True;
AjustarAlturas;
RichText2.SetFocus;
ProgressBar1.Visible:=False;

//--------------------------------------------------
StatusBar1.Panels[0].Text:=Lang_SRT(22);
Label1.Font.Color:=clBlue;                  //LETRA AZUL
Image1.Visible:=False;                      //ALERTA
Image2.Left:=Label1.Left+Label1.Width+S(3);
Image2.Visible:=True;                       //SUCESSO
Image3.Left:=Label3.Left+Label3.Width+S(3);
Image5.Left:=Label2.Left+Label2.Width+S(3);
//--------------------------------------------------

OrganizarListas;

SendMessage(RichText1.Handle,WM_VSCROLL,SB_TOP,0);
SendMessage(RichText2.Handle,WM_VSCROLL,SB_TOP,0);

//--------------------------
btnabrir.Enabled     :=True;
lstabrir.Enabled     :=True;
btnsalvar.Enabled    :=True;
lstsalvar.Enabled    :=True;
btnsalvarcomo.Enabled:=True;
lstsalvarcomo.Enabled:=True;
btnrenomear.Enabled  :=True;
lstrenomear.Enabled  :=True;
lstlocalizar.Enabled :=False;
//--- CC continua disponível se houver ocorrências
btnclosecaption.Enabled:=ListBox3.Items.Count > 0;
lstclosecaption.Enabled:=btnclosecaption.Enabled;
//--------------------------
end;

procedure TForm1.lstconsertarClick(Sender: TObject);
begin
btnconsertar.Click;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 //-----------------------------------------------------------------------------
 if salvar = False then
 begin
 //------------
 Form1.Release;
 Form1:=Nil;
 //------------
 end
 else
 begin
  case MessageBox(Application.Handle,pchar(Lang_SRT(23)),pchar(Application.Title),MB_ICONWARNING+MB_YESNOCANCEL+MB_DEFBUTTON2) of
  idYes:
       begin
       btnsalvarcomo.Click;
       //------------
       Form1.Release;
       Form1:=Nil;
       //------------
       end;
  idNo :
       begin
       //------------
       Form1.Release;
       Form1:=Nil;
       //------------
       end;
  idCancel :
       Application.Run;
  end;
 end;
 //-----------------------------------------------------------------------------

end;

procedure TForm1.Label1Click(Sender: TObject);
begin
ToggleLista(ListBox1, Label1);   {Sobreposições}
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
ToggleLista(ListBox2, Label3);   {Limites de linha}
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
ToggleLista(ListBox3, Label2);   {Closed Caption}
end;

procedure TForm1.btneditarClick(Sender: TObject);
begin
//-----------------------------------------------------
editar:=True; //--> Variável GLOBAL (Editar)
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
//-----------------------------------------------------

 //---------------------------
 btnsalvar.Enabled    :=True;
 lstsalvar.Enabled    :=True;
 btnsalvarcomo.Enabled:=True;
 lstsalvarcomo.Enabled:=True;
 btnconsertar.Enabled :=False;
 lstconsertar.Enabled :=False;
 btneditar.Enabled    :=False;
 lsteditar.Enabled    :=False;
 btn_ortografia.Enabled:=True;
 lst_ortografia.Enabled:=True;
 //---------------------------

//------------------------
RichText1.ReadOnly:=False;
RichText1.SetFocus;
//------------------------
end;

procedure TForm1.RichText1Change(Sender: TObject);
var
R: TRect;
MargenIzquierdo: Integer;
MargenDerecho: Integer;
begin
 //--------------------------------
 {SEGURA PROCESSAMENTO DO ONCHANGE}
 //--------------------------------
 if FProcessandoLegenda then
 Exit;
 //--------------------------------

 if RichText1.ReadOnly = False then
 begin
 //-----------------------------------------------------
 editar:=True; //--> Variável GLOBAL (Editar)
 salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
 //-----------------------------------------------------
 end;

 //--------------------------------------------------------
 if (editar = False) then
 begin
 {CRIAR MARGEM}
 MargenIzquierdo:=S(10);
 MargenDerecho:=S(10);
 R := RichText1.ClientRect;
 R.Left:=R.Left + MargenIzquierdo;
 R.Top:=R.Top + S(2);
 R.Bottom:=R.Bottom - S(2);
 R.Right:=R.Right-MargenDerecho;
 SendMessage(RichText1.Handle, EM_SETRECT, 0, Longint(@R));
 SendMessage(RichText2.Handle, EM_SETRECT, 0, Longint(@R));
 end;
 //--------------------------------------------------------

end;

procedure TForm1.RichText1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 //--------------------------------------------
 {MAXIMIZAR TELA - ALT+ENTER}
 //--------------------------------------------
 if Form1.WindowState = wsMaximized then
 begin
   if (ssAlt in Shift) and (Key=Ord(#13)) then
   Form1.WindowState:=wsNormal;
 end
 else
 begin
   if (ssAlt in Shift) and (Key=Ord(#13)) then
   Form1.WindowState:=wsMaximized;
 end;
 //--------------------------------------------

 //--------------------------------------------
 {CTRL+A}
 //--------------------------------------------
 if (Key = Ord('A')) and (ssCtrl in Shift) then
 begin
 TMemo(Sender).SelectAll;
 Key:=0;
 end;
 //--------------------------------------------

//---------------------------------
linha_atual:=LinhaAtual(RichText1);
//---------------------------------
end;

procedure TForm1.RichText2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 //--------------------------------------------
 {MAXIMIZAR TELA - ALT+ENTER}
 //--------------------------------------------
 if Form1.WindowState = wsMaximized then
 begin
   if (ssAlt in Shift) and (Key=Ord(#13)) then
   Form1.WindowState:=wsNormal;
 end
 else
 begin
   if (ssAlt in Shift) and (Key=Ord(#13)) then
   Form1.WindowState:=wsMaximized;
 end;
 //--------------------------------------------

 //--------------------------------------------
 {CTRL+A}
 //--------------------------------------------
 if (Key = Ord('A')) and (ssCtrl in Shift) then
 begin
 TMemo(Sender).SelectAll;
 Key:=0;
 end;
 //--------------------------------------------

//---------------------------------
linha_atual:=LinhaAtual(RichText2);
//---------------------------------
end;

procedure TForm1.btnsalvarClick(Sender: TObject);
var
VideoPath: String;
begin

  //----------------------------------------------------------------------------
  if (salvar = True) then
  begin
    //--------------------------------------------------------------------------
    case MessageBox(Application.Handle,pchar(Lang_SRT(24)),pchar(Application.Title),MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) of
     idYes:
          begin
          salvar:=False;  //--> Variável GLOBAL (Salvar Alterações)
          //------------------------------
          btnsalvar.Enabled    :=False;
          lstsalvar.Enabled    :=False;
          btnsalvarcomo.Enabled:=False;
          lstsalvarcomo.Enabled:=False;
          btnfraps.Enabled     :=False;
          lstfraps.Enabled     :=False;
          btnnumeros.Enabled   :=False;
          lstnumeros.Enabled   :=False;
          btn_editAvancada.Enabled:=False;
          lst_editAvancada.Enabled:=False;
          //------------------------------

           if RichText2.Visible = True then
           RichText2.Lines.SaveToFile(caminho_arquivo, TEncoding.UTF8)
           else
           RichText1.Lines.SaveToFile(caminho_arquivo, TEncoding.UTF8);

          Form1.Caption:=Application.Title;
          StatusBar1.Panels[0].Text:=Trim(edit_legenda.text);
          //---------------------------
          lstlocalizar.Enabled :=False;
          lstsubstituir.Enabled:=False;
          //---------------------------
          Panel1.Visible:=True;

          VideoPath := EncontrarVideoCorrespondente(caminho_arquivo);

            if VideoPath <> '' then
            begin
              if MessageBox(Application.Handle,PChar(Lang_SRT(25)),PChar(Application.Title),MB_ICONQUESTION + MB_YESNO) = IDYES then
              ShellExecute(0, 'open', PChar(VideoPath), nil, nil, SW_SHOWNORMAL);
            end;

          Close; //Ficou aqui pra não precisar fechar manualmente para testar
          end;
     idNo: salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
    end;
    //--------------------------------------------------------------------------
  end;
  //----------------------------------------------------------------------------

end;

procedure TForm1.btnabrirClick(Sender: TObject);
begin
//------------------------------------------------
//OpenDialog1.InitialDir:='%userprofile%\Desktop';
//------------------------------------------------

if (salvar = True) then
begin
 case MessageBox(Application.Handle,pchar(Lang_SRT(23)),pchar(Application.Title),MB_ICONWARNING+MB_YESNOCANCEL+MB_DEFBUTTON2) of
 idYes:btnsalvarcomo.Click;
 idNo:
     begin
     salvar:=False; //--> Variável GLOBAL (Salvar Alterações)
      //----------------------------------
      if OpenDialog1.Execute then
      Novo_Carregar(OpenDialog1.FileName);
      //----------------------------------
     end;
 idCancel:Form1.SetFocus;
 end;
end
else
begin
 if OpenDialog1.Execute then
 Novo_Carregar(OpenDialog1.FileName)
 else
 salvar:=False; //--> Variável Global (Salvar Alterações)
end;

end;

procedure TForm1.FormResize(Sender: TObject);
var
col: Integer; //--> posição (Left) da coluna da direita
begin
//----------------------------------------------------------------------------
{ ALTURA MÍNIMA  = 574 (em 96 DPI) }
{ LARGURA MÍNIMA = 776 (em 96 DPI) }
//----------------------------------------------------------------------------
if (Form1 <> nil) and (Height >= S(574)) and (Width >= S(776)) then
begin
col := ClientWidth - S(169);

Bevel1.Width:=ClientWidth;
edit_legenda.Width:=ClientWidth;

RichText1.Width:=ClientWidth - S(176);
RichText2.Width:=RichText1.Width;
AjustarAlturas;

ProgressBar1.Width:=StatusBar1.Width;
ProgressBar1.Top:=StatusBar1.Top+S(2);

box_edicao.Left:=col - S(8);
//----------------------------------------
Label1.Left:=col;
Label2.Left:=col;
Label3.Left:=col;
Label4.Left:=col;
Label5.Left:=col;
Label8.Left:=col;
Image1.Left:=col+Label1.Width+S(3);
Image2.Left:=Image1.Left;
Image3.Left:=col+Label3.Width+S(3);
Image5.Left:=col+Label2.Width+S(3);
ListBox1.Left:=col+S(11);
ListBox2.Left:=col+S(11);
ListBox3.Left:=col+S(11);
//----------------------------------------
end;
//----------------------------------------------------------------------------

end;

procedure TForm1.RichText1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//---------------------------------
linha_atual:=LinhaAtual(RichText1);
//---------------------------------

 if (RichText2.Visible = True) then
 begin
 //-------------------------
 Abrir1.Enabled     :=False;
 Copiar1.Enabled    :=False;
 Selecionar1.Enabled:=False;
 Localizar1.Enabled :=False;
 //-------------------------
 end
 else
 begin
 //------------------------
 Abrir1.Enabled     :=True;
 Copiar1.Enabled    :=True;
 Selecionar1.Enabled:=True;
 Localizar1.Enabled :=True;
 //------------------------
 end;

 //---------------------------------
end;

procedure TForm1.RichText2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//---------------------------------
linha_atual:=LinhaAtual(RichText2);
//---------------------------------
Abrir1.Enabled     :=True;
Copiar1.Enabled    :=True;
Selecionar1.Enabled:=True;
//---------------------------------
end;

procedure TForm1.btnnumerosClick(Sender: TObject);
begin
//-----------------------------------------------------
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
editar:=True; //--> Variável GLOBAL (Editar)
//-----------------------------------------------------

Panel1.Visible:=True;

//-------------
BotoesTopo_Off;
//-------------

  if RichText1.Visible = True then
  Correcao_Numerica(RichText1,RichText2,ProgressBar1,True,Label4,Label8)
  else
  Correcao_Numerica(RichText2,RichText1,ProgressBar1,False,Label4,Label8);

//--------------------------
btnabrir.Enabled     :=True;
lstabrir.Enabled     :=True;
btnsalvar.Enabled    :=True;
lstsalvar.Enabled    :=True;
btnsalvarcomo.Enabled:=True;
lstsalvarcomo.Enabled:=True;
btnrenomear.Enabled  :=True;
lstrenomear.Enabled  :=True;
btn_editAvancada.Enabled:=True;
lst_editAvancada.Enabled:=True;
//--------------------------

  if box_edicao.Visible = True then
  begin
  box_edicao.Visible:=False;
    //------------------------------------------
    if (RichText1.SelAttributes.Size > 8) then
    begin
    RichText1.SelectAll;
    RichText1.SelAttributes.Size:=8;
    combo_tamanho.ItemIndex:=0;
    end;

    if (RichText2.SelAttributes.Size > 8) then
    begin
    RichText2.SelectAll;
    RichText2.SelAttributes.Size:=8;
    combo_tamanho.ItemIndex:=0;
    end;
    //------------------------------------------
  Label5.Visible:=True;
  Label4.Visible:=True;
  Label8.Visible:=True;
  end;

StatusBar1.Panels[0].Text:=Lang_SRT(26);
Panel1.Visible:=False;
end;

procedure TForm1.btn_editAvancadaClick(Sender: TObject);
begin
{LIMPEZA DE MEMÓRIA INTERNA DO RICHTEXT}
SoftResetPreserveText(RichText1);

StatusBar1.Panels[0].Text:='';

//----------------------
Label4.Visible:=False;
Label5.Visible:=False;
Label8.Visible:=False;
//----------------------

//--------------------------
BotoesTopo_Off;
lstsubstituir.Enabled:=True;
//--------------------------

  FProcessandoLegenda := True;
  Try
     if RichText1.Visible = True then
     Edicao_Avancada(RichText1,ProgressBar1)
     else
     Edicao_Avancada(RichText2,ProgressBar1);
  Finally
  FProcessandoLegenda := False;
  end;

//------------------------------
box_edicao.Top:=RichText1.Top-S(5);
box_edicao.Visible:=True;
//------------------------------
lstitalic.Enabled:=True;
lstunderline.Enabled:=True;
lstfonte.Enabled:=True;
//------------------------------

//--------------------------
btnabrir.Enabled      :=True;
lstabrir.Enabled      :=True;
btnsalvar.Enabled     :=True;
lstsalvar.Enabled     :=True;
btnsalvarcomo.Enabled :=True;
lstsalvarcomo.Enabled :=True;
btnnumeros.Enabled    :=True;
lstnumeros.Enabled    :=True;
btnrenomear.Enabled   :=True;
lstrenomear.Enabled   :=True;
btn_ortografia.Enabled:=True;
lst_ortografia.Enabled:=True;
//---------------------------

end;

procedure TForm1.combo_tamanhoChange(Sender: TObject);
begin
//---------------------------------------------------------------------
{MUDAR TAMANHO DA FONTE}
//---------------------------------------------------------------------
if RichText1.Visible = True then
begin
RichText1.SelectAll;
RichText1.SelAttributes.Size:=StrToInt(combo_tamanho.Items[combo_tamanho.Itemindex]);
end
else
begin
RichText2.SelectAll;
RichText2.SelAttributes.Size:=StrToInt(combo_tamanho.Items[combo_tamanho.Itemindex]);
end;
//---------------------------------------------------------------------
end;

procedure TForm1.btnunderlineClick(Sender: TObject);
begin
//---------------------------------------------------------------------
{CRIAR TAGS - SUBLINHADO}
//---------------------------------------------------------------------
if RichText1.Visible = True then
Italico_Sublinhado(RichText1,False,'<u>','</u>')
else
Italico_Sublinhado(RichText2,False,'<u>','</u>');
//---------------------------------------------------------------------
end;

procedure TForm1.btnitalicoClick(Sender: TObject);
begin
//---------------------------------------------------------------------
{CRIAR TAGS - ITÁLICO}
//---------------------------------------------------------------------
if RichText1.Visible = True then
Italico_Sublinhado(RichText1,True,'<i>','</i>')
else
Italico_Sublinhado(RichText2,True,'<i>','</i>');
//---------------------------------------------------------------------
end;

procedure TForm1.btnfonteClick(Sender: TObject);
begin
//---------------------------------------------------------------------
{CRIAR TAGS - COR DA FONTE}
//---------------------------------------------------------------------
if ColorDialog1.Execute then
begin
 if RichText1.Visible = True then
 Fonte_Cor(RichText1,'<font color="',ColorDialog1.Color,'">','</font>')
 else
 Fonte_Cor(RichText2,'<font color="',ColorDialog1.Color,'">','</font>')
end;
//---------------------------------------------------------------------
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//-----------------------------------------------------------------------------------------------------
{ASSOCIAR EXTENSÃO DE ARQUIVO - .SRT}
//-----------------------------------------------------------------------------------------------------
if ParamCount = 1 then
begin
 if (ExtractFileExt(LowerCase(ParamStr(1))) <> '.srt') then
 MessageBox(Application.Handle, pchar(Lang_SRT(27)+#13#13+'Error code:  #0103'), pchar(Application.Title), MB_ICONSTOP+MB_OK)
 else
 Novo_Carregar(ParamStr(1));
end;
//-----------------------------------------------------------------------------------------------------
end;

procedure TForm1.lstlocalizarClick(Sender: TObject);
begin
//------------------------------
if RichText1.Visible = True then
posicionar_inicio(RichText1)
else
posicionar_inicio(RichText2);
//------------------------------

//--------------------------------------------------
Form6_substituir.Caption:=Lang_SRT(36);
Form6_substituir.Label2.Visible:=False;
Form6_substituir.Edit2.Visible:=False;
Form6_substituir.btn_substituir.Visible:=False;
Form6_substituir.btn_substituir_tudo.Visible:=False;
Form6_substituir.CheckBox2.Visible:=False;
//--------------------------------------------------

Form6_substituir.btn_cancelar.Top:=Form6_substituir.btn_substituir.Top+3;
Form6_substituir.CheckBox3.Top:=Form6_substituir.Label1.Top+40;
Form6_substituir.CheckBox1.Top:=Form6_substituir.CheckBox3.Top+24;
Form6_substituir.Height:=140;

//-----------------------------
Form6_substituir.Visible:=True;
//-----------------------------

end;

procedure TForm1.lstsubstituirClick(Sender: TObject);
begin
//------------------------------
if RichText1.Visible = True then
posicionar_inicio(RichText1)
else
posicionar_inicio(RichText2);
//------------------------------

//-------------------------------------------------
Form6_substituir.Caption:=Lang_SRT(37);
Form6_substituir.Label2.Visible:=True;
Form6_substituir.Edit2.Visible:=True;
Form6_substituir.btn_substituir.Visible:=True;
Form6_substituir.btn_substituir_tudo.Visible:=True;
Form6_substituir.CheckBox2.Visible:=True;
//-------------------------------------------------

Form6_substituir.btn_cancelar.Top:=Form6_substituir.btn_substituir_tudo.Top+30;
Form6_substituir.CheckBox3.Top:=Form6_substituir.Label2.Top+40;
Form6_substituir.CheckBox1.Top:=Form6_substituir.CheckBox3.Top+24;
Form6_substituir.CheckBox2.Top:=Form6_substituir.CheckBox1.Top+24;
Form6_substituir.Height:=190;

//-----------------------------
Form6_substituir.Visible:=True;
//-----------------------------

end;

procedure TForm1.edit_legendaEnter(Sender: TObject);
begin
//------------------------------
if RichText1.Visible = True then
RichText1.SetFocus
else
RichText2.SetFocus;
//------------------------------
end;

procedure TForm1.RichText1Enter(Sender: TObject);
begin
//------------------------------
if RichText2.Visible = True then
RichText2.SetFocus;
//------------------------------
end;

procedure TForm1.combo_tamanhoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//-------------------------------------------
{MAXIMIZAR TELA - ALT+ENTER}
//-------------------------------------------
if Form1.WindowState = wsMaximized then
begin
  if (ssAlt in Shift) and (Key=Ord(#13)) then
  Form1.WindowState:=wsNormal;
end
else
begin
  if (ssAlt in Shift) and (Key=Ord(#13)) then
  Form1.WindowState:=wsMaximized;
end;
//-------------------------------------------
end;

procedure TForm1.Sobre1Click(Sender: TObject);
begin
Application.CreateForm(TAboutBox, AboutBox);
AboutBox.ShowModal;
AboutBox.Free;
end;

procedure TForm1.btntempoClick(Sender: TObject);
begin
Application.CreateForm(TForm2, Form2);
Form2.ShowModal;
Form2.Free;
end;

procedure TForm1.btnstretchClick(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);
Form3.ShowModal;
Form3.Free;
end;

procedure TForm1.btnfrapsClick(Sender: TObject);
begin
Application.CreateForm(TForm5, Form5);
Form5.ShowModal;
Form5.Free;
end;

procedure TForm1.lsteditarClick(Sender: TObject);
begin
btneditar.Click;
end;

procedure TForm1.lsttempoClick(Sender: TObject);
begin
btntempo.Click;
end;

procedure TForm1.Abrir1Click(Sender: TObject);
begin
btnabrir.Click;
end;

procedure TForm1.lststretchClick(Sender: TObject);
begin
btnstretch.Click;
end;

procedure TForm1.lstnumerosClick(Sender: TObject);
begin
btnnumeros.Click;
end;

procedure TForm1.lstrenomearClick(Sender: TObject);
begin
btnrenomear.Click;
end;

procedure TForm1.lst_editAvancadaClick(Sender: TObject);
begin
btn_editAvancada.Click;
end;

procedure TForm1.lstitalicClick(Sender: TObject);
begin
btnitalico.Click;
end;

procedure TForm1.lstunderlineClick(Sender: TObject);
begin
btnunderline.Click;
end;

procedure TForm1.lstfonteClick(Sender: TObject);
begin
btnfonte.Click;
end;

procedure TForm1.lstfrapsClick(Sender: TObject);
begin
btnfraps.Click;
end;

procedure TForm1.Localizar1Click(Sender: TObject);
begin
lstlocalizar.Click;
end;

procedure TForm1.lstsairClick(Sender: TObject);
begin
Close;
end;

procedure TForm1.lstprocurarClick(Sender: TObject);
begin
btnprocurar.Click;
end;

procedure TForm1.lstsalvarClick(Sender: TObject);
begin
btnsalvar.Click;
end;

procedure TForm1.lstabrirClick(Sender: TObject);
begin
btnabrir.Click;
end;

procedure TForm1.lstsalvarcomoClick(Sender: TObject);
begin
btnsalvarcomo.Click;
end;

procedure TForm1.btnfundoClick(Sender: TObject);
begin
//-------------------------------
if RichText1.Color = clBlack then
RichText1.Color:=clWhite
else
RichText1.Color:=clBlack;
//-------------------------------
end;

procedure TForm1.Menu_SobreClick(Sender: TObject);
begin
ShellExecute(0,Nil,PChar(SRT_BLOG_Global),Nil,Nil,0);
end;

procedure TForm1.btntagsClick(Sender: TObject);
var
HexColor: string;
begin

  if not ColorDialog1.Execute then
  Exit;

//-----------------------------------------------------
editar:=True; //--> Variável GLOBAL (Editar)
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
//-----------------------------------------------------
Panel1.Visible:=True;

BotoesTopo_Off;

SoftResetPreserveText(RichText1);
HexColor := ColorToHex(ColorDialog1.Color);

  FProcessandoLegenda := True;
  Try
  // FASE 1 — TEXTO (rápido)
  AtualizarTextoComFont(RichText1.Lines, HexColor, ProgressBar1);
  // FASE 2 — VISUAL (15 Primeiros diálogos)
  ColorirVisualLimitado(RichText1, ColorDialog1.Color, 15);
  Finally
  FProcessandoLegenda := False;
  end;

//--------------------------
btnabrir.Enabled     :=True;
lstabrir.Enabled     :=True;
btnsalvar.Enabled    :=True;
lstsalvar.Enabled    :=True;
btnsalvarcomo.Enabled:=True;
lstsalvarcomo.Enabled:=True;
btnrenomear.Enabled  :=True;
lstrenomear.Enabled  :=True;
btntags.Enabled      :=True;
lsttags.Enabled      :=True;
//--------------------------

SendMessage(RichText1.Handle, WM_VSCROLL, SB_TOP, 0);

StatusBar1.Panels[0].Text := Lang_SRT(28);
Panel1.Visible := False;
end;


procedure TForm1.btn_ortografiaClick(Sender: TObject);
var
  Texto, Palavra: string;
  I, InicioPalavra: Integer;
begin

Screen.Cursor := crHourGlass;

  try
  InitHunspell(DictNameForLang(Language_Global));
  finally
  Screen.Cursor := crDefault;
  end;

  FProcessandoLegenda := True;
  try
    // Limpa formatação
    {
    RichText1.SelectAll;
    RichText1.SelAttributes.Style := [];
    RichText1.SelAttributes.Color := clBlack;
    RichText1.SelLength := 0;
    }
    Texto := RichText1.Text;
    Palavra := '';
    InicioPalavra := 0;

    for I := 1 to Length(Texto) do
    begin
      if IsLetter(Texto[I]) then
      begin
        if Palavra = '' then
        InicioPalavra := I - 1; // RichText é 0-based

      Palavra := Palavra + Texto[I];
      end
      else
      begin
        if Palavra <> '' then
        begin
        Palavra := CleanWord(Palavra);

          if (Length(Palavra) > 2) and (not SpellOK(Palavra)) then
          begin
            RichText1.SelStart := InicioPalavra;
            RichText1.SelLength := Length(Palavra);
            RichText1.SelAttributes.Style := [fsUnderline];
            RichText1.SelAttributes.Color := clRed;
          end;

        Palavra := '';
        end;
      end;
    end;

    // Última palavra
    if Palavra <> '' then
    begin
      Palavra := CleanWord(Palavra);

      if (Length(Palavra) > 2) and (not SpellOK(Palavra)) then
      begin
        RichText1.SelStart := InicioPalavra;
        RichText1.SelLength := Length(Palavra);
        RichText1.SelAttributes.Style := [fsUnderline];
        RichText1.SelAttributes.Color := clRed;
      end;
    end;

    RichText1.SelLength := 0;
  Finally
  FProcessandoLegenda := False;
  end;

SendMessage(RichText1.Handle,WM_VSCROLL,SB_TOP,0);
//----------------------------
btn_ortografia.Enabled:=False;
lst_ortografia.Enabled:=False;
//----------------------------
end;


procedure TForm1.btnclosecaptionClick(Sender: TObject);
var
j: Integer;
Linha,LinhaLimpa: String;
Bloco, Novo: TStringList;
TemTextoValido: Boolean;
ContadorRemocoes: Integer;
DentroCC: Boolean;
Fonte: TRichEdit;
AntesCC, DialogosComCC: Integer;
begin
//-----------------------------------------------------
editar:=True; //--> Variável GLOBAL (Editar)
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
//-----------------------------------------------------

Panel1.Visible:=True;

BotoesTopo_Off;

ContadorRemocoes:=0;
DialogosComCC := 0;

  if RichText2.Visible then
  Fonte:=RichText2
  else
  Fonte:=RichText1;

ProgressBar1.Visible:=True;
ProgressBar1.Position:=0;
ProgressBar1.Max:=Fonte.Lines.Count;

Bloco:=TStringList.Create;
Novo :=TStringList.Create;

  try
  j := 0;

    while j < Fonte.Lines.Count do
    begin
    ProgressBar1.Position := j + 1;

      if (IsNumeric(Trim(Fonte.Lines[j]))) and
         (j + 1 < Fonte.Lines.Count) and
         (AnsiContainsStr(Fonte.Lines[j+1], ' --> ')) then
      begin
      Bloco.Clear;
      TemTextoValido := False;
      DentroCC := False;
      Bloco.Add(Fonte.Lines[j]);
      Bloco.Add(Fonte.Lines[j+1]);
      AntesCC := ContadorRemocoes;
      Inc(j, 2);

        while (j < Fonte.Lines.Count) and (Trim(Fonte.Lines[j]) <> '') do
        begin
        Linha := Fonte.Lines[j];
        LinhaLimpa := Trim(RemoverCC(Linha, DentroCC, ContadorRemocoes));

          if (LinhaLimpa = '-') or (LinhaLimpa = '–') then
          LinhaLimpa := '';

          if LinhaLimpa <> '' then
          begin
          Bloco.Add(LinhaLimpa);
          TemTextoValido := True;
          end;

        Inc(j);
        end;

        if ContadorRemocoes > AntesCC then
        Inc(DialogosComCC);

        if TemTextoValido then
        begin
        Novo.AddStrings(Bloco);
        Novo.Add('');
        end;

      end
      else
      Inc(j);

      if (j mod 100 = 0) then
      begin
      ProgressBar1.Refresh;
      Application.ProcessMessages;
      end;

    end;

  Application.ProcessMessages;

  //O resultado SEMPRE vai para o RichText1
  RichText1.Lines.BeginUpdate;
    try
    RichText1.Lines.Assign(Novo);
    finally
    RichText1.Lines.EndUpdate;
    end;

  finally
  Bloco.Free;
  Novo.Free;
  ProgressBar1.Visible:=False;
  end;

  if RichText2.Visible then
  begin
  RichText2.Clear;
  RichText2.Visible:=False;
  AjustarAlturas;
  end;

SendMessage(RichText1.Handle, WM_VSCROLL, SB_TOP, 0);
Contar_Linhas_Dialogos(RichText1,ProgressBar1,Label4,Label8);

ListBox1.Clear;
ListBox1.Visible:=False;
ListBox2.Clear;
ListBox2.Visible:=False;
ListBox3.Clear;
ListBox3.Visible:=False;
Label2.Caption:='';
Label2.Visible:=False;
Label3.Caption:='';
Label3.Visible:=False;
Image1.Visible:=False;
Image3.Visible:=False;
Image5.Visible:=False;

//----------------------------
btnabrir.Enabled:=True;
lstabrir.Enabled:=True;
lstsalvar.Enabled:=True;
btnsalvar.Enabled:=True;
lstsalvarcomo.Enabled:=True;
btnsalvarcomo.Enabled:=True;
btn_editAvancada.Enabled:=True;
lst_editAvancada.Enabled:=True;
btnnumeros.Enabled:=True;
lstnumeros.Enabled:=True;
btnrenomear.Enabled:=True;
lstrenomear.Enabled:=True;
btntags.Enabled:=True;
lsttags.Enabled:=True;
btn_ortografia.Enabled:=True;
lst_ortografia.Enabled:=True;
//----------------------------

  if ContadorRemocoes = 0 then
  begin
  Label1.Caption:='';
  Label1.Visible:=False;
  Image2.Visible:=False;
  StatusBar1.Panels[0].Text := Lang_SRT(29);
  end
  else
  begin
  Label1.Caption:=Format(Lang_SRT(35),[DialogosComCC]);
  Label1.Font.Color:=clBlue;
  Label1.Visible:=True;
  Image2.Left:=Label1.Left+Label1.Width+S(3);
  Image2.Visible:=True;
  StatusBar1.Panels[0].Text := Lang_SRT(30);
  end;

OrganizarListas;
Panel1.Visible := False;
end;

procedure TForm1.lstclosecaptionClick(Sender: TObject);
begin
btnclosecaption.Click;
end;

procedure TForm1.Idioma_AutoClick(Sender: TObject);
begin
Lang_Apply(0);
TraduzirContagem;
end;

procedure TForm1.Idioma_PorClick(Sender: TObject);
begin
Lang_Apply(1);
TraduzirContagem;
end;

procedure TForm1.Idioma_EngClick(Sender: TObject);
begin
Lang_Apply(2);
TraduzirContagem;
end;

procedure TForm1.Idioma_EspClick(Sender: TObject);
begin
Lang_Apply(3);
TraduzirContagem;
end;

procedure TForm1.Idioma_ItaClick(Sender: TObject);
begin
Lang_Apply(4);
TraduzirContagem;
end;

procedure TForm1.Idioma_FraClick(Sender: TObject);
begin
Lang_Apply(5);
TraduzirContagem;
end;


end.
