unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ShellAPI, Buttons, ComCtrls, ToolWin,
  ExtCtrls, Menus, WinSkinData, Gauges, ClipBrd, RxGIF, pngextra, pngimage,
  MruUnit,FileCtrl, RxCombos, OleCtrls, Animate, GIFCtrl;

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
    lstabrir: TMenuItem;
    lstsalvarcomo: TMenuItem;
    lstprocurar: TMenuItem;
    lstsair: TMenuItem;
    N1: TMenuItem;
    btnconsertar: TSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    SkinData1: TSkinData;
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
    ToolButton4: TToolButton;
    Menu_Caracter: TMenuItem;
    lstitalic: TMenuItem;
    lstunderline: TMenuItem;
    btncores: TSpeedButton;
    lstcores: TMenuItem;
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
    Doaes1: TMenuItem;
    N6: TMenuItem;
    Website1: TMenuItem;
    SiganosnoFacebook1: TMenuItem;
    PerfilLegendasTV1: TMenuItem;
    Sobre1: TMenuItem;
    btnfonte: TSpeedButton;
    lstfonte: TMenuItem;
    N01: TMenuItem;
    Label5: TLabel;
    Localizar1: TMenuItem;
    Label2: TLabel;
    btnfundo: TSpeedButton;
    lstfundo: TMenuItem;
    btntags: TSpeedButton;
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
    procedure btncoresClick(Sender: TObject);
    procedure lstcoresClick(Sender: TObject);
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
    procedure Doaes1Click(Sender: TObject);
    procedure Website1Click(Sender: TObject);
    procedure SiganosnoFacebook1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure btnfonteClick(Sender: TObject);
    procedure lstfonteClick(Sender: TObject);
    procedure Localizar1Click(Sender: TObject);
    procedure btnfundoClick(Sender: TObject);
    procedure btntagsClick(Sender: TObject);
  private
  MostRecentFiles1: TMostRecentFiles;
    { Private declarations }
  public
  //--------------------------------------------------------------------------------------------------  
  function Novo_Carregar(parametro: String): Boolean;
  procedure DropFiles(var Msg: TMessage); message wm_DropFiles;
  //--------------------------------------------------------------------------------------------------
  { Public declarations }
  end;

var
  Form1: TForm1;
  //---------------------------------
  {DADOS DO SRT ADJUSTER - VARIÁVEIS}
       SRT_EXE_Global,
      SRT_RAIZ_Global,
    SRT_VERSAO_Global,
    //   URL_MD5_Global,
      SRT_BLOG_Global,
  SRT_FACEBOOK_Global,
    SRT_PAYPAL_Global:String;
  //---------------------------------

  dialogo,linha,linha_atual,cont_legenda_global,ListBox_Novo: Integer;
  salvar,editar: Boolean;
  caminho_arquivo, tempo, entrada: String;

  vt_sobreposicao,vt_limitelinha: Array of Integer;
  vt_tempo,vt_id,vt_linha,vt_linha_localizar,vt_seriado,vt_nome_arquivo,vt_nome_arquivo_normal: Array of String;
  arquivo:TextFile;
  Flags : Cardinal;

const
  qtde_formatos = 11;
  videos_suportados: array[0..qtde_formatos] of String =
  ('.mp4','.avi','.mpg','.mpeg','.mov','.rmvb','.rm','.ra','.wmv','.wma','.flv','.mkv');

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, CommCtrl, Funcoes;

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
//--------------------
Label1.Visible:=False;
Image1.Visible:=False;
Image2.Visible:=False;
Label3.Visible:=False;
Image3.Visible:=False;
//--------------------
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
 ProgressBar1.Max:=(Round(FileSize(arquivo) * 1.7))+RichText1.Lines.Count;
 ProgressBar1.Refresh;
 //-----------------------------------------------------------------------

   while not eof (arquivo) do
   begin
   Readln(arquivo,entrada);
   ProgressBar1.Position := ProgressBar1.Position + 1;
   end;

 CloseFile(arquivo);
 RichText1.Lines.LoadFromFile(String(PChar(parametro)));
 FindFirst(parametro,faArchive,SR);

 //-------------------------------------------------------------------------------------
 Label5.Caption:=Copy(FloatToStr(SR.Size/KB),0,pos(',',FloatToStr(SR.Size/KB))+1)+' KB';
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

 RichText1.Height:=Form1.Height-164;
 RichText1.Visible:=True;

   {LINHAS, DIÁLOGOS e TAMANHO}
   if (Label4.Visible = False) then
   begin
   Label5.Visible:=True;
   Label4.Visible:=True;
   Label8.Visible:=True;
   end;

 //------------------------
 btnabrir.Enabled:=True;
 lstabrir.Enabled:=True;
 btnprocurar.Enabled:=True;
 lstprocurar.Enabled:=True;
 btncores.Enabled:=True;
 lstcores.Enabled:=True;
 btntempo.Enabled:=True;
 lsttempo.Enabled:=True;
 btnstretch.Enabled:=True;
 btnstretch.Enabled:=True;
 btnfraps.Enabled:=True;
 lstfraps.Enabled:=True;
 btnnumeros.Enabled:=True;
 lstnumeros.Enabled:=True;
 btnrenomear.Enabled:=True;
 lstrenomear.Enabled:=True;
 //------------------------

 {SOBREPOSIÇÕES}
 Label1.Caption:='';
 Label1.Font.Color:=clBlack;
 ListBox1.Clear;
 ListBox1.Visible:=False;

 {LIMITES DE LINHA}
 Label3.Caption:='';
 Label3.Top:=Label1.Top+16;;
 ListBox2.Clear;
 ListBox2.Visible:=False;

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
 Panel1.Visible:=False;
 end
 else
 begin
 Panel1.Visible:=True;
 MessageBox(Application.Handle, pchar('O documento carregado não possui diálogos no padrão de uma legenda SRT.'+#13#13+'Error code:  #0102'), pchar(Application.Title), MB_ICONSTOP+MB_OK);
 StatusBar1.Panels[0].Text:='O documento carregado não possui diálogos no padrão de uma legenda SRT.'+#13#13+'Error code:  #0102';
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
procedure TForm1.DropFiles(var Msg: TMessage);
var
FileCount,BufferSize:Word;
Drop:HDROP;
FileName:String;
Pt:TPoint;
RctMemo:TRect;
begin

StatusBar1.Panels[0].Text:='';

 if (salvar = True) then
 begin
  case MessageBox(Application.Handle, pchar('Deseja salvar as alterações realizadas para esta legenda antes de sair?'),pchar(Application.Title),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) of
    idYes:btnsalvarcomo.Click;
    idNo :salvar:=False; //--> Variável GLOBAL (Salvar Alterações)
  end;
 end;

 if (salvar = False) then
 begin
  Drop := Msg.wParam;

  {QUANTIDADE DE ARQUIVOS SOLTOS - DROPPED}
  FileCount := DragQueryFile(Drop, $FFFFFFFF, nil, 0);
  {PEGA A ÁREA DO FORM1}
  RctMemo := Form1.BoundsRect;
   {SE SOLTOU NA ÁREA DO FORM1}
   if not PtInRect(RctMemo, Pt) then
   begin
     if FileCount > 1 then
     MessageBox(Application.Handle,pchar('Será mostrado apenas o conteúdo da primeira legenda selecionada.'),pchar(Application.Title),MB_ICONINFORMATION+MB_OK);

   {PEGA O COMPRIMENTO NECESSÁRIO PARA O NOME DO ARQUIVO, SEM CONTAR COM CARACTERE NULO DO FIM DA STRING}
   {O SEGUNDO PARÂMETRO(ZERO) INDICA O PRIMEIRO ARQUIVO DA LISTA}
   BufferSize:=DragQueryFile(Drop,0,nil,0);

   SetLength(FileName,BufferSize+1);

    if DragQueryFile(Drop, 0, PChar(FileName), BufferSize+1) = BufferSize then
    begin
       //---------------------------------------------------------------------------------------------------
       if (ExtractFileExt(LowerCase(pchar(FileName))) <> '.srt') then
       begin
       MessageBox(Application.Handle, pchar('O arquivo carregado não é um documento de legenda no formato SRT.'+#13#13+'Error code:  #0103'), pchar(Application.Title), MB_ICONSTOP+MB_OK);
       StatusBar1.Panels[0].Text:='O arquivo carregado não é um documento de legenda no formato SRT.'+#13#13+'Error code:  #0103';
       end
       else
       Novo_Carregar(FileName);
       //---------------------------------------------------------------------------------------------------
    end
    else
      begin
      Panel1.Visible:=True;
      MessageBox(Application.Handle, pchar('Ocorreu um erro interno do sistema.'+#13#13+'Error code:  #0101'), pchar(Application.Title), MB_ICONERROR+MB_OK);
      Close;
      end;

   end;
  Msg.Result := 0;
 end;

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
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

  //------------------------
  ProgressBar1.Brush.Color:=clBtnFace;
  Label1.Color:=Form1.Color;
  Label3.Color:=Form1.Color;
  //------------------------

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
 if SelectDirectory('Certifique-se de que exista apenas um título de Série por diretório para que as legendas sejam ajustadas corretamente.', OpenDialog1.InitialDir ,Pasta) then
 begin

   if DriveCD = Copy(Pasta,0,1) then
   begin
   MessageBox(Application.Handle,pchar('Não é possível ajustar arquivos de legenda em uma unidade de CD.'+#13#13+'Error code:  #0104'),pchar(Application.Title),MB_ICONERROR+MB_OK);
   btnrenomear.Click;
   end
   {INÍCIO - ELSE}
   else
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
        nome_arquivo:=LowerCase(SR.Name);
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
              if (vt_nome_arquivo[i] = LowerCase(vt_nome_arquivo_normal[i])+'.srt') then
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
        MessageBox(Application.Handle,pchar('Foi realizado ajuste em 1 legenda com sucesso!'), pchar(Application.Title), MB_ICONINFORMATION+MB_OK)
        else
        MessageBox(Application.Handle,pchar('Foram realizados ajustes em '+IntToStr(Nao_Encontrados.Count)+' legendas com sucesso!'),pchar(Application.Title),MB_ICONERROR+MB_OK);
      end;
      //----------------------------------------------------------------------------------------------------------------------------------------
      if Sim_Encontrados.Count > 0 then
      begin
        if Sim_Encontrados.Count = 1 then
        MessageBox(Application.Handle,pchar('Foi realizado ajuste em 1 legenda com sucesso!'), pchar(Application.Title), MB_ICONINFORMATION+MB_OK)
        else
        MessageBox(Application.Handle,pchar('Foram realizados ajustes em '+IntToStr(Nao_Encontrados.Count)+' legendas com sucesso!'),pchar(Application.Title),MB_ICONINFORMATION+MB_OK);
      end;

      if (Sim_Encontrados.Count = 0) and (Nao_Encontrados.Count = 0) then
      MessageBox(Application.Handle, pchar('Não foi necessário realizar ajustes nas legendas encontradas neste diretório!'+#13+#13+pasta), pchar(Application.Title), MB_ICONWARNING+MB_OK);
      //----------------------------------------------------------------------------------------------------------------------------------------

     Sim_Encontrados.Free;
     Nao_Encontrados.Free;
     end;
     {FIM - Seriado_Quantidade}
   end;
   {FIM - ELSE}
 end;
 {FIM - SelectDirectory}

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
{SOBREPOSIÇÕES}
//----------------------------------------------------------------
if RichText2.Visible = False then
Lista_Indices(RichText1,RichText2,ListBox1,False,vt_sobreposicao)
else
Lista_Indices(RichText2,RichText1,ListBox1,True, vt_sobreposicao);
//----------------------------------------------------------------
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
{LIMITES DE LINHA}
//---------------------------------------------------------------
if RichText2.Visible = False then
Lista_Indices(RichText1,RichText2,ListBox2,False,vt_limitelinha)
else
Lista_Indices(RichText2,RichText1,ListBox2,True, vt_limitelinha);
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
       case MessageBox(Application.Handle, pchar('A legenda atual já existe.'+#13+'Deseja substituí-lo?                       '), pchar('Confirmar '+SaveDialog1.Title), MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) of
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
begin
cont1:=0;
cont2:=0;
k:=0;

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

   //-----------------------------------------------------------------------
   //LIMITES DE LINHA - TEXTOS
   //-----------------------------------------------------------------------
   if (cont1 > 0) then
   begin
    if (cont1 = 1) then
    Label3.Caption:='1 Limite de Linha'
    else
    Label3.Caption:=IntToStr(cont1)+' Limites de Linha';

   //----------------------------------------
   Image3.Left:=Label3.Width+Form1.Width-174;
   Label3.Visible:=True;
   Image3.Visible:=True;
   //----------------------------------------
   btneditar.Enabled:=True;
   lsteditar.Enabled:=True;
   //----------------------------------------

    if (cont1 = 1) then
    StatusBar1.Panels[0].Text:='Esta legenda possui 1 ocorrência.'
    else
    StatusBar1.Panels[0].Text:='Esta legenda possui '+IntToStr(cont1+cont2)+' ocorrências.';
   end;
                   
   //-----------------------------------------------------------------------
   //SOBREPOSIÇÕES - TEXTOS
   //-----------------------------------------------------------------------
   if (cont2 > 0) then
   begin
      if (cont2 = 1) then
      Label1.Caption:='1 Sobreposição'
      else
      Label1.Caption:=IntToStr(cont2)+' Sobreposições';

   //----------------------------------------
   Image1.Left:=Label1.Width+Form1.Width-174;
   Label1.Font.Color:=clRed; //LETRA VERMELHA
   Label1.Visible:=True;
   Image1.Visible:=True;
   Image2.Left:=Image1.Left;
   //----------------------------------------
   btnconsertar.Enabled:=True;
   lstconsertar.Enabled:=True;

     if (cont2 = 1) then
     StatusBar1.Panels[0].Text:='Esta legenda possui 1 ocorrência.'
     else
     StatusBar1.Panels[0].Text:='Esta legenda possui '+IntToStr(cont1+cont2)+' ocorrências.';
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
     btncores.Enabled  :=True;
     lstcores.Enabled  :=True;
     //-----------------------
     StatusBar1.Panels[0].Text:='Esta legenda não possui nenhum tipo de ocorrência.';
     end;

 if Label1.Visible = True then
 begin
 Label3.Top:=Label1.Top+16;
 Image3.Top:=Image1.Top+16;
 end
 else
 begin
 Label3.Top:=Label1.Top;
 Image3.Top:=Image1.Top;
 end;

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
i: Integer;
tempo1,tempo2: String;
begin
//------------------------------------------------------
salvar:=True;  //--> Variável GLOBAL (Salvar Alterações)
//------------------------------------------------------
                     
//-------------
BotoesTopo_Off;
//-------------

ProgressBar1.Visible:=True;
ProgressBar1.Position:=0;
ProgressBar1.Max:=Length(vt_tempo)-1;
ProgressBar1.Refresh;
RichText2.Text:=RichText1.Text;

  for i:=0 to Length(vt_tempo)-2 do
  begin
  ProgressBar1.Position:=ProgressBar1.Position+1;
  //--------------------------------
  tempo1:=copy(vt_tempo[i]  ,18,12);
  tempo2:=copy(vt_tempo[i+1],1 ,12);
  //--------------------------------
    if StrToTime(tempo1) > StrToTime(tempo2) then
    RichText2.Text:=(StringReplace(RichText2.Text,tempo1,tempo2,[rfReplaceAll, rfIgnoreCase]));
  end;

RichText1.Height:=Trunc(Form1.Height/2)-84;
RichText2.Height:=RichText1.Height;
RichText2.Top:=RichText1.Top+RichText1.Height+5;
RichText2.Visible:=True;
RichText2.SetFocus;
ProgressBar1.Visible:=False;

//--------------------------------------------------
StatusBar1.Panels[0].Text:='Sobreposições corrigidas com sucesso!';
Label1.Font.Color:=clBlue; //LETRA AZUL
Image1.Visible:=False;
Image2.Visible:=True;
//--------------------------------------------------

//------------------------------------------------
SendMessage(RichText1.Handle,WM_VSCROLL,SB_TOP,0);
SendMessage(RichText2.Handle,WM_VSCROLL,SB_TOP,0);
//------------------------------------------------

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
  case MessageBox(Application.Handle,pchar('Deseja salvar as alterações realizadas para esta legenda antes de sair?'),pchar(Application.Title),MB_ICONWARNING+MB_YESNOCANCEL+MB_DEFBUTTON2) of
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
//----------------------------------------------------------------
{EXIBIR LISTBOX1 - Sobreposições}
//----------------------------------------------------------------
if (ListBox1.Items.Text <> '') and (ListBox1.Visible = False) then
begin
ListBox1.Visible:=True;
ListBox1.Left:=Label1.Left+11;
ListBox1.Width:=94;
  if ListBox1.Items.Count < 11 then
  ListBox1.Height:=ListBox1.Items.Count*14+1
  else
  ListBox1.Height:=145;
ListBox1.Top:=Label1.Top+16;
Label3.Top:=ListBox1.Top+ListBox1.Height+4;
ListBox2.Top:=Label3.Top+16;
end
else
begin
ListBox1.Visible:=False;
Label3.Top:=Label1.Top+16;
ListBox2.Top:=Label3.Top+16;
end;
Image3.Top:=Label3.Top-1;
//----------------------------------------------------------------
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
//----------------------------------------------------------------
{EXIBIR LISTBOX2 - Limites de Linha}
//----------------------------------------------------------------
if (ListBox2.Items.Text <> '') and (ListBox2.Visible = False) then
begin
ListBox2.Visible:=True;
ListBox2.Left:=Label3.Left+11;
ListBox2.Width:=94;
  if ListBox2.Items.Count < 11 then
  ListBox2.Height:=ListBox2.Items.Count*14+1
  else
  ListBox2.Height:=145;
ListBox2.Top:=Label3.Top+16;
end
else
ListBox2.Visible:=False;
//----------------------------------------------------------------
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
 MargenIzquierdo:=10;
 MargenDerecho:=10;
 R := RichText1.ClientRect;
 R.Left:=R.Left + MargenIzquierdo;
 R.Top:=R.Top + 2;
 R.Bottom:=R.Bottom - 2;
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
begin

  //----------------------------------------------------------------------------
  if (salvar = True) then
  begin
    //--------------------------------------------------------------------------
    case MessageBox(Application.Handle,pchar('Tem certeza que deseja sobrescrever a legenda original?'),pchar(Application.Title),MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) of
     idYes:
          begin
          salvar:=False;  //--> Variável GLOBAL (Salvar Alterações)
          //---------------------------
          btnsalvar.Enabled    :=False;
          lstsalvar.Enabled    :=False;
          btnsalvarcomo.Enabled:=False;
          lstsalvarcomo.Enabled:=False;
          btnfraps.Enabled     :=False;
          lstfraps.Enabled     :=False;
          btnnumeros.Enabled   :=False;
          lstnumeros.Enabled   :=False;
          btncores.Enabled     :=False;
          lstcores.Enabled     :=False;
          //---------------------------

           if RichText2.Visible = True then
           RichText2.Lines.SaveToFile(caminho_arquivo)
           else
           RichText1.Lines.SaveToFile(caminho_arquivo);

          Form1.Caption:=Application.Title;
          StatusBar1.Panels[0].Text:=Trim(edit_legenda.text);
          //---------------------------
          lstlocalizar.Enabled :=False;
          lstsubstituir.Enabled:=False;
          //---------------------------
          Panel1.Visible:=True;
          end;
     idNo:
         salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
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
 case MessageBox(Application.Handle,pchar('Deseja salvar as alterações realizadas para esta legenda antes de sair?'),pchar(Application.Title),MB_ICONWARNING+MB_YESNOCANCEL+MB_DEFBUTTON2) of
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
begin
//----------------------------------------------------------------------------
{ ALTURA MÍNIMA  = 574 }
{ LARGURA MÍNIMA = 776 }
//----------------------------------------------------------------------------
if (Form1 <> nil) and (Form1.Height >= 574) and (Form1.Width >= 776) then
begin
  Bevel1.Width:=Form1.Width-16;
  edit_legenda.Width:=Form1.Width-16;
  
  RichText1.Width:=Form1.Width-184;
  RichText2.Width:=RichText1.Width;
    //------------------------------------------------
    if RichText2.Visible = False then
    RichText1.Height:=Form1.Height-164
    else
    begin
      if RichText1.Visible = True then
      begin
      RichText1.Height:=Trunc(Form1.Height/2)-84;
      RichText2.Height:=RichText1.Height;
      RichText2.Top:=RichText1.Top+RichText1.Height+5;
      end
      else
      begin
      RichText2.Top:=RichText1.Top;
      RichText2.Height:=Form1.Height-164;
      end
    end;
    //------------------------------------------------
    
  ProgressBar1.Width:=StatusBar1.Width;
  ProgressBar1.Top:=StatusBar1.Top+2;

  box_edicao.Left:=Form1.Width-185;
  //----------------------------------------
  Label1.Left:=Form1.Width-177;
  Label3.Left:=Form1.Width-177;
  Label4.Left:=Form1.Width-177;
  Label5.Left:=Form1.Width-177;
  Label8.Left:=Form1.Width-177;
  Image1.Left:=Label1.Width+Form1.Width-174;
  Image2.Left:=Label1.Width+Form1.Width-174;
  Image3.Left:=Label3.Width+Form1.Width-174;
  ListBox1.Left:=Label1.Left+11;
  ListBox2.Left:=Label3.Left+11;
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
btncores.Enabled     :=True;
lstcores.Enabled     :=True;
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

StatusBar1.Panels[0].Text:='Correção numérica realizada com sucesso!';
Panel1.Visible:=False;
end;

procedure TForm1.btncoresClick(Sender: TObject);
begin
//-----------------------------------------------------
//editar:=True; //--> Variável GLOBAL (Editar)
//salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
//-----------------------------------------------------

StatusBar1.Panels[0].Text:='';

//----------------------
Label1.Visible:=False;
Label3.Visible:=False;
Label4.Visible:=False;
Label5.Visible:=False;
Label8.Visible:=False;
Image1.Visible:=False;
Image2.Visible:=False;
Image3.Visible:=False;
ListBox1.Visible:=False;
ListBox2.Visible:=False;
//----------------------

//--------------------------
BotoesTopo_Off;
lstsubstituir.Enabled:=True;
//--------------------------

  if RichText1.Visible = True then
  Edicao_Avancada(RichText1,ProgressBar1)
  else
  Edicao_Avancada(RichText2,ProgressBar1);

//------------------------------
box_edicao.Top:=RichText1.Top-5;
box_edicao.Visible:=True;
//------------------------------
lstitalic.Enabled:=True;
lstunderline.Enabled:=True;
lstfonte.Enabled:=True;
lstfundo.Enabled:=True;
//------------------------------

//--------------------------
btnabrir.Enabled     :=True;
lstabrir.Enabled     :=True;
btnsalvar.Enabled    :=True;
lstsalvar.Enabled    :=True;
btnsalvarcomo.Enabled:=True;
lstsalvarcomo.Enabled:=True;
btnnumeros.Enabled   :=True;
lstnumeros.Enabled   :=True;
btnrenomear.Enabled  :=True;
lstrenomear.Enabled  :=True;
//--------------------------

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
 MessageBox(Application.Handle, pchar('O arquivo carregado não é um documento de legenda no formato SRT.'+#13#13+'Error code:  #0103'), pchar(Application.Title), MB_ICONSTOP+MB_OK)
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
Form6_substituir.Caption:='Localizar';
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
Form6_substituir.Caption:='Substituir';
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

procedure TForm1.Doaes1Click(Sender: TObject);
begin
ShellExecute(0,Nil,PChar(SRT_PAYPAL_Global),Nil,Nil,0);
end;

procedure TForm1.Website1Click(Sender: TObject);
begin
ShellExecute(0,Nil,PChar(SRT_BLOG_Global),Nil,Nil,0);
end;

procedure TForm1.SiganosnoFacebook1Click(Sender: TObject);
begin
ShellExecute(0,Nil,PChar(SRT_FACEBOOK_Global),Nil,Nil,0);
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

procedure TForm1.lstcoresClick(Sender: TObject);
begin
btncores.Click;
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

procedure TForm1.btntagsClick(Sender: TObject);
var
i: Integer;
tempo1,tempo2: String;
begin
//------------------------------------------------------
salvar:=True;  //--> Variável GLOBAL (Salvar Alterações)
//------------------------------------------------------
                     
//-------------
BotoesTopo_Off;
//-------------

ProgressBar1.Visible:=True;
ProgressBar1.Position:=0;
ProgressBar1.Max:=Length(vt_tempo)-1;
ProgressBar1.Refresh;
RichText2.Text:=RichText1.Text;

  for i:=0 to Length(vt_tempo)-2 do
  begin
  ProgressBar1.Position:=ProgressBar1.Position+1;
  //--------------------------------
  tempo1:=copy(vt_tempo[i]  ,18,12);
  tempo2:=copy(vt_tempo[i+1],1 ,12);
  //--------------------------------


    if StrToTime(tempo1) > StrToTime(tempo2) then
    RichText2.Text:=(StringReplace(RichText2.Text,tempo1,tempo2,[rfReplaceAll, rfIgnoreCase]));


  end;

RichText1.Height:=Trunc(Form1.Height/2)-84;
RichText2.Height:=RichText1.Height;
RichText2.Top:=RichText1.Top+RichText1.Height+5;
RichText2.Visible:=True;
RichText2.SetFocus;
ProgressBar1.Visible:=False;

//--------------------------------------------------
StatusBar1.Panels[0].Text:='Sobreposições corrigidas com sucesso!';
Label1.Font.Color:=clBlue; //LETRA AZUL
Image1.Visible:=False;
Image2.Visible:=True;
//--------------------------------------------------

//------------------------------------------------
SendMessage(RichText1.Handle,WM_VSCROLL,SB_TOP,0);
SendMessage(RichText2.Handle,WM_VSCROLL,SB_TOP,0);
//------------------------------------------------

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
//--------------------------

end;

end.

