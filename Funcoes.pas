unit Funcoes;

interface

Uses Unit1,Classes,ComCtrls,StdCtrls,Windows,Messages,IdHTTP,Forms,Wininet,
     SysUtils,Graphics,StrUtils,dialogs;

{VERIFICA SE EXISTE ARQUIVO DE VÍDEO NA PASTA DA LEGENDA}
function EncontrarVideoCorrespondente(const CaminhoSRT: string): string;
{REPASSA AS VARIÁVEIS DO ARQUIVO .DPR PARA VARIÁVEIS GLOBAIS}
procedure VarGlobais(Executavel,Diretorio,Versao,Blog:String);
{VERIFICA SE UMA STRING É NUMÉRICA}
function IsNumeric(const S:String):Boolean;
{FUNÇÃO PARA EDIÇÃO AVANÇADA}
procedure Edicao_Avancada (var Legenda: TRichEdit; ProgressBar1: TProgressBar);
{VERIFICA OS ARQUIVOS DE LEGENDA PARA SERIADOS} 
function Seriado_Quantidade:Boolean;
{CONVERTER CORES EM HEXADECIAL PARA TCOLOR}
function HexToColor(AValue:String):TColor;
{CONVERTER CORES EM TCOLOR PARA HEXADECIAL}
function ColorToHex(Color:TColor):String;
{FUNÇÃO PARA POSICIONAR O CURSOR NO INÍCIO DA LEGENDA}
procedure posicionar_inicio (var Legenda:TRichEdit);
{FUNÇÃO PARA FAZER UM BBCODE DE ITÁLICO E SUBLINHADO}
procedure Italico_Sublinhado(var Legenda:TRichEdit;Atributo:Boolean;Tag_Open,Tag_Close:String);
{FUNÇÃO PARA FAZER UM BBCODE DE COR}
procedure Fonte_Cor(var Legenda:TRichEdit;Tag_Open1:String;Tag_Open2:TColor;Tag_Open3,Tag_Close:String);
{CORREÇÃO NUMÉRICA DE ÍNDICE}
procedure Correcao_Numerica (var Texto1,Texto2:TRichEdit;ProgressBar1:TProgressBar;aux:Boolean;Label_Linha,Label_Dialogo:Tlabel);
{CONTABILIZAR LINHAS E DIÁLOGOS}
procedure Contar_Linhas_Dialogos (var Legenda:TRichEdit;ProgressBar1:TProgressBar;Label_Linha,Label_Dialogo:TLabel);
{MONTA O TEXTO PARA EXIBIR LINHAS E DIÁLOGOS APÓS CONTABILIZAR}
procedure Mensagem_Texto_LinhaDialogo(var linha_aux,dialogo_aux:Integer;Label_Linha,Label_Dialogo:TLabel);
{FORMATAR NÚMEROS COM ZERO A ESQUERDA - AJUSTE DE TEMPO - FORM2}
function FormatZero(const aNumber,Length:Integer):String;
{SALVAR COMO...}
procedure Salvar_Como;
{TODOS OS BOTÕES DO TOPO FICAM "FALSE"}
procedure BotoesTopo_Off;
{EXIBIR O NÚMERO DA LINHA QUANDO FOR POSICIONADO COM O MOUSE OU TECLADO}
function LinhaAtual(TextoLegenda:TRichEdit):Longint;
{MOSTRAR LISTAGEM DE SOBREPOSIÇÕES, LIMITES DE LINHA E CLOSED CAPTION - LISTBOX1, 2 E 3}
procedure Lista_Indices(var Texto1,Texto2:TRichEdit;ListBox1:TListBox;aux:Boolean;vetor: Array of Integer);
{FUNÇÕES VINDAS DA UNIT1 - 01/03}
{EXTRAI SOMENTE OS NÚMEROS DE UM TEXTO}
function NumeroDoCaption(const S: string): Integer;
{MONTA O TEXTO DA CONTAGEM CONFORME O ID DO IDIOMA}
function TextoContagem(Id, N: Integer): String;
{TRADUZ OS TEXTOS DE CONTAGEM (LINHAS, DIÁLOGOS E OCORRÊNCIAS) AO TROCAR O IDIOMA}
procedure TraduzirContagem;
{SINCRONIZA A ROLAGEM ENTRE DOIS RICHEDIT}
procedure SincronizarRolagem(Origem, Destino: TRichEdit);
{ESCALA DE DPI - CONVERTE UM VALOR EM PIXELS (96 DPI) PARA O DPI ATUAL DO FORM}
function S(v: Integer): Integer;
{AJUSTA A ALTURA DOS RICHEDIT (1 OU 2 VISÍVEIS) ATÉ A BARRA DE STATUS}
procedure AjustarAlturas;
{EMPILHA OS LABELS E AS LISTAS DE OCORRÊNCIAS NA COLUNA DA DIREITA}
procedure OrganizarListas;
{MOSTRA OU ESCONDE A LISTA DE OCORRÊNCIAS}
procedure ToggleLista(LB: TListBox; Lbl: TLabel);
{REMOVE OS TEXTOS DE CLOSED CAPTION (ENTRE COLCHETES)}
function RemoverCC(const S: string; var DentroCC: Boolean; var Contador: Integer): string;
{VERIFICA SE O CARACTERE É UMA LETRA}
function IsLetter(C: Char): Boolean;
{LIMPA A PALAVRA ANTES DE CONSULTAR O DICIONÁRIO}
function CleanWord(const S: string): string;
{VERIFICA SE A PALAVRA ESTÁ CORRETA NO DICIONÁRIO}
function SpellOK(const Palavra: string): Boolean;
{VERIFICA SE A PALAVRA É CURTA DEMAIS PARA SER VERIFICADA}
function IsTooShort(const S: string): Boolean;
{RETORNA O NOME DO DICIONÁRIO CONFORME O IDIOMA}
function DictNameForLang(Idioma: Integer): string;
{CARREGA O DICIONÁRIO DO HUNSPELL}
procedure InitHunspell(const DictName: string);
{LÊ O ARQUIVO DE TEXTO DETECTANDO A CODIFICAÇÃO}
function LerArquivoTexto(const Arq: string): string;
{RESETAR DA MEMÓRIA O CAMPO RICHTEXT}
procedure SoftResetPreserveText(RE: TRichEdit);
{APLICA A TAG DE COR (FONT) EM TODOS OS DIÁLOGOS}
procedure AtualizarTextoComFont(Lines: TStrings;const HexColor: string;Progress: TProgressBar);
{COLORE O VISUAL DOS PRIMEIROS DIÁLOGOS}
procedure ColorirVisualLimitado(RE: TRichEdit;AColor: TColor;MaxDialogos: Integer);
{CARREGA A LEGENDA (.SRT) NO RICHTEXT1 E PREPARA A TELA}
function Novo_Carregar(parametro: String): Boolean;
{RENOMEIA AS LEGENDAS DA PASTA CONFORME OS VÍDEOS DO SERIADO}
procedure Renomear_Series;
{PROCESSA A LEGENDA: SOBREPOSIÇÕES, LIMITES DE LINHA E CLOSED CAPTION}
procedure Processar_Legenda;
{CORRIGE AS SOBREPOSIÇÕES DE TEMPO (RESULTADO NO RICHTEXT2)}
procedure Corrigir_Sobreposicao;
{ALTERA A COR DA LEGENDA COM A TAG FONT}
procedure Alterar_Cor_Legenda;
{VERIFICA A ORTOGRAFIA E SUBLINHA AS PALAVRAS NÃO ENCONTRADAS}
procedure Verificar_Ortografia;
{REMOVE OS TEXTOS DE CLOSED CAPTION DA LEGENDA}
procedure Remover_CloseCaption;

implementation

uses Language, System.IOUtils, FileCtrl, Controls;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function EncontrarVideoCorrespondente(const CaminhoSRT: string): string;
var
Pasta, NomeBase: string;
Extensoes: array[0..5] of string;
i: Integer;
begin
Result := '';
Pasta := ExtractFilePath(CaminhoSRT);
NomeBase := ChangeFileExt(ExtractFileName(CaminhoSRT), '');

Extensoes[0] := '.mp4';
Extensoes[1] := '.mkv';
Extensoes[2] := '.avi';
Extensoes[3] := '.mov';
Extensoes[4] := '.wmv';
Extensoes[5] := '.webm';

  for i := Low(Extensoes) to High(Extensoes) do
  begin
    if FileExists(Pasta + NomeBase + Extensoes[i]) then
    begin
    Result := Pasta + NomeBase + Extensoes[i];
    Exit;
    end;
  end;
  
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure VarGlobais(Executavel,Diretorio,Versao,Blog:String);
begin
     SRT_EXE_Global:=Executavel;
    SRT_RAIZ_Global:=Diretorio;
  SRT_VERSAO_Global:=Versao;
    SRT_BLOG_Global:=Blog;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Edicao_Avancada (var Legenda: TRichEdit; ProgressBar1: TProgressBar);
var
i: Integer;
linha_sem_espaco,cores:String;
begin
ProgressBar1.Visible:=True;
ProgressBar1.Position:=0;
ProgressBar1.Max:=Legenda.Lines.Count;
ProgressBar1.Refresh;

    for i:= 0 to Legenda.Lines.Count -1 do
    begin
    ProgressBar1.Position:=ProgressBar1.Position+1;

       if (IsNumeric(Legenda.lines[i])) and (AnsiContainsStr(Legenda.Lines[i+1],' --> ')) and (Trim(Legenda.lines[i-1]) = '') then
       begin
       Legenda.SelStart := Legenda.Perform(EM_LINEINDEX, i, 0);
       Legenda.SelLength := Length(Legenda.Lines[i]);
       Legenda.SelAttributes.Style:=Legenda.SelAttributes.Style+[fsBold];

       Legenda.SelStart := Legenda.Perform(EM_LINEINDEX, i+1, 0);
       Legenda.SelLength := Length(Legenda.Lines[i+1]);
       Legenda.SelAttributes.Color:=clNavy;
       end;

       //-------------------------------------------------------------------------------------
       if Pos('<i>',Legenda.Lines[i]) > 0 then
       begin
       Legenda.SelStart := Legenda.Perform(EM_LINEINDEX, i, 0)+Pos('<i>',Legenda.Lines[i])-1;

          if Pos('</i>',Legenda.Lines[i+1]) > 0 then
          Legenda.SelLength := Length(Legenda.Lines[i])+Length(Legenda.Lines[i+1])+4
          else
          Legenda.SelLength := Length(Legenda.Lines[i]);

       Legenda.SelAttributes.Style:=Legenda.SelAttributes.Style+[fsItalic];
       Legenda.SelAttributes.Color:=clGray;
       end;
       //-------------------------------------------------------------------------------------

       //-------------------------------------------------------------------------------------
       if Pos('<u>',Legenda.Lines[i]) > 0 then
       begin
       Legenda.SelStart := Legenda.Perform(EM_LINEINDEX, i, 0)+Pos('<u>',Legenda.Lines[i])-1;

          if Pos('</u>',Legenda.Lines[i+1]) > 0 then
          Legenda.SelLength := Length(Legenda.Lines[i])+Length(Legenda.Lines[i+1])+4
          else
          Legenda.SelLength := Length(Legenda.Lines[i]);

       Legenda.SelAttributes.Style:=Legenda.SelAttributes.Style+[fsUnderline];
       Legenda.SelAttributes.Color:=clGray;
       end;
       //-------------------------------------------------------------------------------------

       {RETIRA OS ESPAÇOS EM BRANCO DO MEIO DA STRING}
       linha_sem_espaco:=StringReplace(Trim(Legenda.Lines[i]),' ',EmptyStr,[rfReplaceAll]);
       //-------------------------------------------------------------------------------------
       if Pos('<fontcolor="#',linha_sem_espaco) > 0 then
       begin
       Legenda.SelStart := Legenda.Perform(EM_LINEINDEX, i, 0)+Pos('<fontcolor="#',linha_sem_espaco)-1;

          if Pos('</font>',Legenda.Lines[i+1]) > 0 then
          Legenda.SelLength := Length(Legenda.Lines[i])+Length(Legenda.Lines[i+1])+4
          else
          Legenda.SelLength := Length(Legenda.Lines[i]);

       cores:=Copy(Trim(Legenda.Lines[i]),Pos('#',Trim(Legenda.Lines[i]))+1,6);
       Legenda.SelAttributes.Color:=HexToColor(cores);
       end;
       //-------------------------------------------------------------------------------------

    end;

 Legenda.SelStart:=0;
 Legenda.ReadOnly:=False;

ProgressBar1.Visible:=False;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function Seriado_Quantidade:Boolean;
var
i,j,cont_video: Integer;
nome_arquivo,extensao_arquivo,seriado,nome_arquivo_normal,repetido: String;
repetiu: Boolean;
begin
Result:=False;
repetiu:=False;

cont_legenda_global:=0;
cont_video:=0;

{INÍCIO - FOR I}
for i := 0 to Length(vt_nome_arquivo)-1 do
begin
nome_arquivo:=vt_nome_arquivo[i];
extensao_arquivo:=ExtractFileExt(nome_arquivo);
nome_arquivo_normal:=ChangeFileExt(vt_nome_arquivo[i],EmptyStr);

   {INÍCIO - FOR J}
   for j := 0 to ( Length(nome_arquivo)-Length(extensao_arquivo) ) do
   begin
      {INÍCIO - IF S01E01}
      if (
           (LowerCase(nome_arquivo[j]) = 's')
            and
            ( IsNumeric(nome_arquivo[j+1]) or IsNumeric(nome_arquivo[j+2]) )
             and
             ( (LowerCase(nome_arquivo[j+2]) = 'e') or (LowerCase(nome_arquivo[j+3]) = 'e') )
                and
                ( IsNumeric(nome_arquivo[j+3]) or IsNumeric(nome_arquivo[j+5]) )
         )
      then
      begin
          {INÍCIO - IF .SRT}
          if extensao_arquivo = '.srt' then
          begin
          Inc(cont_legenda_global);
          //---------------------------------------------------------------------------
          seriado:=Copy(nome_arquivo,j,6);
           //---------------------------------------------------------------------------
           if not ( IsNumeric(Copy(seriado,3,1)) and IsNumeric(Copy(seriado,6,1)) ) then
           seriado:=Copy(seriado,1,2)+Copy(seriado,3,2);
           //---------------------------------------------------------------------------
          vt_seriado[cont_legenda_global-1]:=seriado;
          vt_nome_arquivo[cont_legenda_global-1]:=nome_arquivo;
           //-------------------------------------------------------------------------
           if (cont_legenda_global-1 > 0) and (vt_seriado[cont_legenda_global-2] = seriado) then
           begin
           repetido:=vt_seriado[cont_legenda_global-2];
           repetiu:=True;
           break;
           end;
           //-------------------------------------------------------------------------
          end
          else
          begin
          //-------------------------------------------------------------------------
           case AnsiIndexStr(extensao_arquivo,videos_suportados) of
           0..qtde_formatos:
                           begin
                           Inc(cont_video);
                           vt_nome_arquivo_normal[cont_video-1]:=nome_arquivo_normal;
                           end;
          end;
          //-------------------------------------------------------------------------
          end;
          {FIM - IF .SRT}
      end;
      {FIM - IF S01E01}
   end;
   {FIM - FOR J}

end;
{FIM - FOR I}

if  (cont_legenda_global+cont_video > 0) and (cont_video = cont_legenda_global) and (repetiu = False) then
begin
   case MessageBox(Application.Handle, pchar(Format(Lang_SRT(87),[cont_legenda_global+cont_video]))
                                          , pchar(Application.Title), MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) of
   idYes:
        Result:=True;
   idNo :
        begin
        Result:=False;
        Form1.btnrenomear.Click;
        end;
   end;
end
else
begin
Result:=False;

   if (repetiu = True) then
   MessageBox(Application.Handle, pchar(Format(Lang_SRT(88),[UpperCase(repetido)])+#13#13+
                                         'Error code:  #0107')
                                 , pchar(Application.Title), MB_ICONERROR+MB_OK)
   else
   begin

       if cont_video > cont_legenda_global then
       MessageBox(Application.Handle, pchar(Format(Lang_SRT(89),[cont_video,cont_legenda_global])), pchar(Application.Title), MB_ICONWARNING+MB_OK);


       if cont_legenda_global > cont_video then
       MessageBox(Application.Handle, pchar(Format(Lang_SRT(90),[cont_video,cont_legenda_global])), pchar(Application.Title), MB_ICONWARNING+MB_OK);

       if (cont_video = 0) and (cont_legenda_global = 0) then
       MessageBox(Application.Handle, pchar(Lang_SRT(91)+#13#13+'Error code:  #0105')
                                      , pchar(Application.Title), MB_ICONERROR+MB_OK);



   end;

Form1.btnrenomear.Click;
end;

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function IsNumeric(const S:String):Boolean;
var
P: PChar;
begin
P      := PChar(S);
Result := False;

 while P^ <> #0 do
 begin
   if not (P^ in ['0'..'9']) then Exit;
   Inc(P);
 end;
 Result := True;

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function HexToColor(AValue:String):TColor;
var
iRed,iGreen,iBlue:Integer;
begin

iRed  := StrToInt('$' + AValue[1] + AValue[2]);
iGreen:= StrToInt('$' + AValue[3] + AValue[4]);
iBlue := StrToInt('$' + AValue[5] + AValue[6]);
Result:= RGB(iRed, iGreen, iBlue);

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function ColorToHex(Color:TColor):String;
begin
Result:=IntToHex(GetRValue(Color),2)+IntToHex(GetGValue(Color),2)+IntToHex(GetBValue(Color),2);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure posicionar_inicio (var Legenda:TRichEdit);
begin
Legenda.SelLength:=0;
Legenda.SelStart:=0;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Italico_Sublinhado(var Legenda:TRichEdit;Atributo:Boolean;Tag_Open,Tag_Close:String);
begin

 if not (AnsiContainsStr(Legenda.SelText,' --> '))   and
    not (AnsiContainsStr(Legenda.SelText,Tag_Open))  and
    not (AnsiContainsStr(Legenda.SelText,Tag_Close)) and
        (Trim(Legenda.SelText) <> '')
 then
 begin
   //-----------------------------------------
   if Atributo = True then
   Legenda.SelAttributes.Style:=[fsItalic]
   else
   Legenda.SelAttributes.Style:=[fsUnderline];
   //-----------------------------------------
 Legenda.SelAttributes.Color:=clGray;
    //----------------------------------------------------------
    if pos(#$D,Legenda.SelText+#13) > 0 then
    begin
    Legenda.SelText:=Tag_Open+Legenda.SelText;
    Legenda.SelStart:=Legenda.SelStart-1;
     if Length(Legenda.Text[Legenda.SelStart+1]) = 1 then
     Legenda.SelStart:=Legenda.SelStart+1;
    end;
    Legenda.SelText:=Tag_Close;
    //----------------------------------------------------------
 end
 else
 MessageBox(Application.Handle, pchar(Lang_SRT(92)), pchar(Application.Title), MB_ICONWARNING+MB_OK);

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Fonte_Cor(var Legenda:TRichEdit;Tag_Open1:String;Tag_Open2:TColor;Tag_Open3,Tag_Close:String);
begin

 if not (AnsiContainsStr(Legenda.SelText,' --> ')) and
    not (AnsiContainsStr(Legenda.SelText,Tag_Open1+'#')) and
    not (AnsiContainsStr(Legenda.SelText,Tag_Close)) and
        (Trim(Legenda.SelText) <> '')
 then
 begin
 Legenda.SelAttributes.Color:=Tag_Open2;
   //-----------------------------------------------------------------------------------------------
   if pos(#$D,Legenda.SelText+#13) > 0 then
   begin
   Legenda.SelText:=Tag_Open1+'#'+ColorToHex(Tag_Open2)+Tag_Open3+Legenda.SelText;
   Legenda.SelStart:=Legenda.SelStart-1;
     if Length(Legenda.Text[Legenda.SelStart+1]) = 1 then
     Legenda.SelStart:=Legenda.SelStart+1;
   end;
   Legenda.SelText:=Tag_Close;
   //-----------------------------------------------------------------------------------------------
 end
 else
 MessageBox(Application.Handle, pchar(Lang_SRT(93)), pchar(Application.Title), MB_ICONWARNING+MB_OK);

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Correcao_Numerica (var Texto1,Texto2:TRichEdit;ProgressBar1:TProgressBar;aux:Boolean;Label_Linha,Label_Dialogo:Tlabel);
var
j,numero_id: Integer;
new_legenda: Array of String;
begin
dialogo:=0;  //--> Variável GLOBAL
linha:=0;    //--> Variável GLOBAL

numero_id:=0;
Texto1.ReadOnly:=True;
//-------------------------
ProgressBar1.Visible:=True;
ProgressBar1.Position:=0;
ProgressBar1.Refresh;
//-------------------------
ProgressBar1.Max:=Texto1.Lines.Count;
SetLength(new_legenda,Texto1.Lines.Count); //--> Define o tamanho do Vetor Dinâmico
Texto2.Lines.Clear;

   for j:=0 to Texto1.Lines.Count -1 do
   begin
   ProgressBar1.Position:=ProgressBar1.Position+1;
   new_legenda[j]:=Texto1.Lines[j];
     if (IsNumeric(Texto1.lines[j])) and (AnsiContainsStr(Texto1.Lines[j+1],' --> ')) and (Trim(Texto1.lines[j-1]) = '') then
     begin
     //-----------------
     dialogo:=dialogo+1;
     //-----------------
     Inc(numero_id);
     new_legenda[j]:=IntToStr(numero_id); //--> Preenche o Vetor com os novos valores de ID
     end;
   //-------------
   linha:=linha+1;
   //-------------
   Texto2.Lines.Add(new_legenda[j]);
   end;

Texto1.Visible:=False;
  //--------------------------------------
  {Caso o RichText2 esteja Visible = True}
  if aux = True then
  Texto2.Top:=Texto1.Top;
  //--------------------------------------
Texto2.Height:=Form1.Height-164;
SendMessage(Texto2.Handle, WM_VSCROLL, SB_TOP, 0);
//--------------------
Texto2.SelStart:=0;
Texto2.Visible:=True;
Texto2.SetFocus;
//--------------------

//-------------------------------------------------------------------
Mensagem_Texto_LinhaDialogo(linha,dialogo,Label_Linha,Label_Dialogo);
//-------------------------------------------------------------------
ProgressBar1.Visible:=False;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Contar_Linhas_Dialogos (var Legenda:TRichEdit;ProgressBar1:TProgressBar;Label_Linha,Label_Dialogo:TLabel);
var
i: Integer;
Lista: TStringList;
begin
dialogo:=0;  //--> Variável GLOBAL
linha  :=Legenda.Lines.Count;  //--> Variável GLOBAL (mesma contagem de antes)

Lista:=TStringList.Create;
  try
  Lista.Text:=Legenda.Text;    //--> uma única chamada ao RichEdit

    for i:=0 to Lista.Count-1 do
    begin
      if IsNumeric(Lista[i]) and
         (i+1 < Lista.Count) and
         AnsiContainsStr(Lista[i+1],' --> ') and
         ((i = 0) or (Trim(Lista[i-1]) = '')) then
      Inc(dialogo);
    end;

  finally
  Lista.Free;
  end;

//-------------------------------------------------------------------
Mensagem_Texto_LinhaDialogo(linha,dialogo,Label_Linha,Label_Dialogo);
//-------------------------------------------------------------------
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Mensagem_Texto_LinhaDialogo(var linha_aux,dialogo_aux:Integer;Label_Linha,Label_Dialogo:TLabel);
begin

 if linha_aux = 1 then
 Label_Linha.Caption:=Lang_SRT(43)
 else
 Label_Linha.Caption:=Format(Lang_SRT(41),[linha_aux]);

 if dialogo_aux = 1 then
 Label_Dialogo.Caption:=Lang_SRT(44)
 else
 Label_Dialogo.Caption:=Format(Lang_SRT(42),[dialogo_aux]);

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function FormatZero(const aNumber,Length:Integer):String;
begin
Result:=SysUtils.Format('%.*d',[Length,aNumber]);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Salvar_Como;
begin
salvar:=False; //--> Variável GLOBAL (Salvar Alterações)

//------------------------------------
Form1.btnsalvar.Enabled:=False;
Form1.lstsalvar.Enabled:=False;
Form1.btnsalvarcomo.Enabled:=False;
Form1.lstsalvarcomo.Enabled:=False;
Form1.btn_editAvancada.Enabled:=False;
Form1.lst_editAvancada.Enabled:=False;
Form1.btnfraps.Enabled:=False;
Form1.lstfraps.Enabled:=False;
Form1.btnnumeros.Enabled:=False;
Form1.lstnumeros.Enabled:=False;
//------------------------------------

   if Form1.RichText2.Visible = True then
   Form1.RichText2.Lines.SaveToFile(caminho_arquivo, TEncoding.UTF8)
   else
   Form1.RichText1.Lines.SaveToFile(caminho_arquivo, TEncoding.UTF8);

Form1.Caption:=Application.Title;
Form1.StatusBar1.Panels[0].Text:=Trim(ExtractFileName(Form1.SaveDialog1.FileName));

//---------------------------------
Form1.lstlocalizar.Enabled:=False;
Form1.lstsubstituir.Enabled:=False;
//---------------------------------

Form1.Panel1.Visible:=True;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure BotoesTopo_Off;
begin
{ABRIR}
Form1.btnabrir.Enabled:=False;
Form1.lstabrir.Enabled:=False;
{SALVAR}
Form1.btnsalvar.Enabled:=False;
Form1.lstsalvar.Enabled:=False;
{SALVAR COMO}
Form1.btnsalvarcomo.Enabled:=False;
Form1.lstsalvarcomo.Enabled:=False;
{PROCESSAR LEGENDA}
Form1.btnprocurar.Enabled:=False;
Form1.lstprocurar.Enabled:=False;
{CORREÇÃO DE SOBREPOSIÇÃO}
Form1.btnconsertar.Enabled:=False;
Form1.lstconsertar.Enabled:=False;
{EDITAR}
Form1.btneditar.Enabled:=False;
Form1.lsteditar.Enabled:=False;
{EDIÇÃO AVANÇADA}
Form1.btn_editAvancada.Enabled:=False;
Form1.lst_editAvancada.Enabled:=False;
{AJUSTE DE TEMPO}
Form1.btntempo.Enabled:=False;
Form1.lsttempo.Enabled:=False;
{SINCRONIA GRADATIVA}
Form1.btnstretch.Enabled:=False;
Form1.lststretch.Enabled:=False;
{SINCRONIA DE FRAMERATE}
Form1.btnfraps.Enabled:=False;
Form1.lstfraps.Enabled:=False;
{CORREÇÃO NUMÉRICA}
Form1.btnnumeros.Enabled:=False;
Form1.lstnumeros.Enabled:=False;
{RENOMEAR SÉRIES}
Form1.btnrenomear.Enabled:=False;
Form1.lstrenomear.Enabled:=False;
{ALTERAR COR DA LEGENDA}
Form1.btntags.Enabled:=False;
Form1.lsttags.Enabled:=False;
{VERIFICAR ORTOGRAFIA}
Form1.btn_ortografia.Enabled:=False;
Form1.lst_ortografia.Enabled:=False;
{REMOVER CLOSE-CAPTION}
Form1.btnclosecaption.Enabled:=False;
Form1.lstclosecaption.Enabled:=False;

{INFORMAÇÕES DE PROCESSAMENTO}
Form1.Label1.Visible:=False;
Form1.Label2.Visible:=False;
Form1.Label3.Visible:=False;
//----------------------------
Form1.ListBox1.Visible:=False;
Form1.ListBox2.Visible:=False;
Form1.ListBox3.Visible:=False;
//----------------------------
Form1.Image1.Visible:=False;
Form1.Image2.Visible:=False;
Form1.Image3.Visible:=False;
Form1.Image5.Visible:=False;
//----------------------------
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function LinhaAtual(TextoLegenda:TRichEdit):Longint;
begin
Result:=TextoLegenda.SelStart-SendMessage(TextoLegenda.Handle,EM_LINEINDEX,
                              SendMessage(TextoLegenda.Handle,EM_LINEFROMCHAR,TextoLegenda.SelStart,0),0);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Lista_Indices(var Texto1,Texto2: TRichEdit; ListBox1: TListBox; aux: Boolean; vetor: Array of Integer);
var
i:Integer;
LinhaAtual,LinhaTotal,LinhaDiferenca,LinhaNova:Integer;
begin
//---------------------------------------------------
LinhaTotal:=Texto1.Lines.Count;
SendMessage(Texto1.Handle, WM_VSCROLL, SB_BOTTOM, 0);
//---------------------------------------------------

LinhaDiferenca:=linha-LinhaTotal;

//--------------------------------
for i := 0 to Length(vetor)-1 do
vetor[i]:=vetor[i]-LinhaDiferenca;
//--------------------------------

LinhaAtual:=vetor[ListBox1.ItemIndex+1]-1; //--> Vetor GLOBAL
LinhaNova:=LinhaAtual;

//----------------------------------------------------------
Texto1.SelStart:=Texto1.Perform(EM_LINEINDEX, LinhaNova, 0);
Texto1.Perform(EM_SCROLLCARET, LinhaNova, 0);
Texto1.SelLength:=Length(Texto1.Lines[LinhaNova]);
Texto1.SetFocus;
//----------------------------------------------------------

 if aux = True then
 begin
 SendMessage(Texto2.Handle, WM_VSCROLL, SB_BOTTOM, 0);
 Texto2.SelStart:=Texto2.Perform(EM_LINEINDEX, LinhaNova, 0);
 Texto2.Perform(EM_SCROLLCARET, LinhaNova, 0);
 end;

end;
//------------------------------------------------------------------------------
{TRADUZIR CONTAGEM - 02/09}
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
{TRADUZIR CONTAGEM - 03/09}
//------------------------------------------------------------------------------
function TextoContagem(Id, N: Integer): String;
begin
  case Id of
    31, 33, 95: Result := Lang_SRT(Id);
  else
    Result := Format(Lang_SRT(Id), [N]);
  end;
end;
//------------------------------------------------------------------------------
{TRADUZIR CONTAGEM - 04/09}
//------------------------------------------------------------------------------
procedure TraduzirContagem;
var
nLinhas, nDialogos: Integer;
begin
  if Form1.Label4.Visible then
  begin
  nLinhas  :=NumeroDoCaption(Form1.Label4.Caption);
  nDialogos:=NumeroDoCaption(Form1.Label8.Caption);
  Form1.Label4.Caption:=Format(Lang_SRT(41),[nLinhas]);
  Form1.Label8.Caption:=Format(Lang_SRT(42),[nDialogos]);
  end;

  if (Form1.FIdLabel1 <> 0) and (Form1.Label1.Caption <> '') then
  Form1.Label1.Caption:=TextoContagem(Form1.FIdLabel1, NumeroDoCaption(Form1.Label1.Caption));

  if (Form1.FIdLabel2 <> 0) and (Form1.Label2.Caption <> '') then
  Form1.Label2.Caption:=TextoContagem(Form1.FIdLabel2, NumeroDoCaption(Form1.Label2.Caption));

  if (Form1.FIdLabel3 <> 0) and (Form1.Label3.Caption <> '') then
  Form1.Label3.Caption:=TextoContagem(Form1.FIdLabel3, NumeroDoCaption(Form1.Label3.Caption));

Form1.Image1.Left:=Form1.Label1.Left+Form1.Label1.Width+S(3);
Form1.Image2.Left:=Form1.Image1.Left;
Form1.Image3.Left:=Form1.Label3.Left+Form1.Label3.Width+S(3);
Form1.Image5.Left:=Form1.Label2.Left+Form1.Label2.Width+S(3);
end;
//------------------------------------------------------------------------------
{SINCRONIZAR ROLAGEM - 01/02}
//------------------------------------------------------------------------------
procedure SincronizarRolagem(Origem, Destino: TRichEdit);
var
PrimOrigem, PrimDestino: Integer;
begin
PrimOrigem :=SendMessage(Origem.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
PrimDestino:=SendMessage(Destino.Handle, EM_GETFIRSTVISIBLELINE, 0, 0);
SendMessage(Destino.Handle, EM_LINESCROLL, 0, PrimOrigem - PrimDestino);
end;
//------------------------------------------------------------------------------
{ESCALA DE DPI
Converte um valor em pixels (pensado para 96 DPI) para o DPI atual do Form}
//------------------------------------------------------------------------------
function S(v: Integer): Integer;
begin
Result := MulDiv(v, Form1.CurrentPPI, 96);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure AjustarAlturas;
var
area: Integer;
begin
area := Form1.StatusBar1.Top - Form1.RichText1.Top - S(4);

  if Form1.RichText2.Visible then
  begin
    if Form1.RichText1.Visible then
    begin
    Form1.RichText1.Height := (area - S(5)) div 2;
    Form1.RichText2.Height := Form1.RichText1.Height;
    Form1.RichText2.Top    := Form1.RichText1.Top + Form1.RichText1.Height + S(5);
    end
    else
    begin
    Form1.RichText2.Top    := Form1.RichText1.Top;
    Form1.RichText2.Height := area;
    end;
  end
  else
  Form1.RichText1.Height := area;

end;
//------------------------------------------------------------------------------
{ORGANIZAR LISTAS - 01/05}
//------------------------------------------------------------------------------
procedure OrganizarListas;
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
y := Form1.Label1.Top;
Empilha(Form1.Label1, Form1.ListBox1);
Empilha(Form1.Label3, Form1.ListBox2);
Empilha(Form1.Label2, Form1.ListBox3);
Form1.Image3.Top := Form1.Label3.Top - S(1);
Form1.Image5.Top := Form1.Label2.Top - S(1);
end;
//------------------------------------------------------------------------------
{TOGGLE LISTA - 01/04}
//------------------------------------------------------------------------------
procedure ToggleLista(LB: TListBox; Lbl: TLabel);
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

{ORGANIZAR LISTAS - 02/05}
OrganizarListas;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
{DICIONÁRIO - 03/03}
//------------------------------------------------------------------------------
function IsLetter(C: Char): Boolean;
begin
  Result :=
    ((C >= 'A') and (C <= 'Z')) or
    ((C >= 'a') and (C <= 'z')) or
    (Ord(C) >= 192);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function CleanWord(const S: string): string;
begin
 Result := LowerCase(Trim(S));
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function SpellOK(const Palavra: string): Boolean;
var
W: AnsiString;
begin
  if Palavra = '' then
  Exit;

W:=AnsiString(LowerCase(Palavra));
Result := Hunspell_spell(HunHandle, PAnsiChar(W)) <> 0;

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function IsTooShort(const S: string): Boolean;
begin
Result := Length(S) <= 3;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
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
  {BRANCO}
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
//------------------------------------------------------------------------------
function Novo_Carregar(parametro: String): Boolean;
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
Form1.RichText1.Color:=clWhite;
Form1.Panel1.Visible:=True;

//-------------
BotoesTopo_Off;
//-------------

//--------------------------------
Form1.box_edicao.Visible:=False;
Form1.lstitalic.Enabled:=False;
Form1.lstunderline.Enabled:=False;
Form1.lstfonte.Enabled:=False;
//--------------------------------

//---------------------------------
Form1.lstlocalizar.Enabled:=False;
Form1.lstsubstituir.Enabled:=False;
//---------------------------------

//-----------------------------
Form1.RichText1.Clear;
Form1.RichText2.Clear;
Form1.RichText2.Visible:=False;
//-----------------------------

//--------------------------------------------
{MODO DE EDICÃO}
//--------------------------------------------
editar:=False; //--> Variável GLOBAL (Editar)
if Form1.RichText1.ReadOnly = False then
Form1.RichText1.ReadOnly:=True;
//--------------------------------------------

 //-------------------------------
 Form1.ProgressBar1.Visible:=True;
 AssignFile(arquivo,parametro);
 Reset(arquivo);
 //-------------------------------
 Form1.ProgressBar1.Position:=0;
 Form1.ProgressBar1.Visible:=True;
 Form1.ProgressBar1.Refresh;
 Application.ProcessMessages;
 //-------------------------------

   while not eof (arquivo) do
   begin
   Readln(arquivo,entrada);
   Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
   end;

 CloseFile(arquivo);

 Bytes := TEncoding.Unicode.GetPreamble + TEncoding.Unicode.GetBytes(LerArquivoTexto(parametro));
 MS := TBytesStream.Create(Bytes);
  try
  Form1.RichText1.Lines.LoadFromStream(MS);
  finally
  MS.Free;
  end;

 FindFirst(parametro,faArchive,SR);

 //-------------------------------------------------------------------------------------
 Form1.Label5.Caption:=Copy(FloatToStr(SR.Size/KB),0,pos(',',FloatToStr(SR.Size/KB))+1)+' KB';
 FindClose(SR);
 Contar_Linhas_Dialogos(Form1.RichText1,Form1.ProgressBar1,Form1.Label4,Form1.Label8);
 //-------------------------------------------------------------------------------------

 {DIÁLOGO - INÍCIO}
 if dialogo > 0 then
 begin
 //-----------------------------------------------------------------
 Form1.Caption:=Application.Title+' - '+ExtractFileName(parametro);
 Form1.edit_legenda.Text:='      '+ExtractFileName(parametro);
 MostRecentFiles1.AddFile(ExtractFileName(parametro));
 caminho_arquivo:=parametro;
 //-----------------------------------------------------------------

 Form1.StatusBar1.Panels[0].Text:='';
 Form1.lstlocalizar.Enabled:=True;

 Form1.RichText1.Visible:=True;
 AjustarAlturas;

   {LINHAS, DIÁLOGOS e TAMANHO}
   if (Form1.Label4.Visible = False) then
   begin
   Form1.Label5.Visible:=True;
   Form1.Label4.Visible:=True;
   Form1.Label8.Visible:=True;
   end;

 //-----------------------------------
 Form1.btnabrir.Enabled:=True;
 Form1.lstabrir.Enabled:=True;
 Form1.btnprocurar.Enabled:=True;
 Form1.lstprocurar.Enabled:=True;
 Form1.btn_editAvancada.Enabled:=True;
 Form1.lst_editAvancada.Enabled:=True;
 Form1.btntempo.Enabled:=True;
 Form1.lsttempo.Enabled:=True;
 Form1.btnstretch.Enabled:=True;
 Form1.lststretch.Enabled:=True;
 Form1.btnfraps.Enabled:=True;
 Form1.lstfraps.Enabled:=True;
 Form1.btnnumeros.Enabled:=True;
 Form1.lstnumeros.Enabled:=True;
 Form1.btnrenomear.Enabled:=True;
 Form1.lstrenomear.Enabled:=True;
 Form1.btntags.Enabled:=True;
 Form1.lsttags.Enabled:=True;
 Form1.btnclosecaption.Enabled:=False;
 Form1.lstclosecaption.Enabled:=False;
 //-----------------------------------

 {SOBREPOSIÇÕES}
 Form1.Label1.Caption:='';
 Form1.Label1.Font.Color:=clBlack;
 Form1.ListBox1.Clear;
 Form1.ListBox1.Visible:=False;

 {LIMITES DE LINHA}
 Form1.Label3.Caption:='';
 Form1.ListBox2.Clear;
 Form1.ListBox2.Visible:=False;

{CLOSED CAPTION}
Form1.Label2.Caption:='';
Form1.ListBox3.Clear;
Form1.ListBox3.Visible:=False;

  //--------------------------------------------------------------------
  if (Form1.RichText1.SelAttributes.Style = [fsBold]) then
  begin
  Form1.RichText1.SelectAll;
  Form1.RichText1.SelAttributes.Style:=Form1.RichText1.SelAttributes.Style-[fsBold];
  Form1.RichText1.SelStart:=0;
  end;

  if (Form1.RichText1.SelAttributes.Style = [fsItalic]) then
  begin
  Form1.RichText1.SelectAll;
  Form1.RichText1.SelAttributes.Style:=Form1.RichText1.SelAttributes.Style-[fsItalic];
  Form1.RichText1.SelStart:=0;
  end;
  //--------------------------------------------------------------------

  //----------------------------------------------
  if (Form1.RichText1.SelAttributes.Size > 8) then
  begin
  Form1.RichText1.SelectAll;
  Form1.RichText1.SelAttributes.Size:=8;
  Form1.combo_tamanho.ItemIndex:=0;
  end;

  if (Form1.RichText2.SelAttributes.Size > 8) then
  begin
  Form1.RichText2.SelectAll;
  Form1.RichText2.SelAttributes.Size:=8;
  Form1.combo_tamanho.ItemIndex:=0;
  end;
  //----------------------------------------------

 {Leva para a primeira linha do RichText1}
 SendMessage(Form1.RichText1.Handle, WM_VSCROLL, SB_TOP, 0);

 Form1.RichText1.SelStart:=0;
 salvar:=False;
 Form1.Panel1.Visible:=False;
 end
 else
 begin
 Form1.Panel1.Visible:=True;
 MessageBox(Application.Handle, pchar(Lang_SRT(12)+#13#13+'Error code:  #0102'), pchar(Application.Title), MB_ICONSTOP+MB_OK);
 Form1.StatusBar1.Panels[0].Text:=Lang_SRT(12)+#13#13+'Error code:  #0102';
 //------------------------------
 Form1.btnabrir.Enabled:=True;
 Form1.lstabrir.Enabled:=True;
 Form1.btnrenomear.Enabled:=True;
 Form1.lstrenomear.Enabled:=True;
 //------------------------------
 end;
 {DIÁLOGO - FIM}

Form1.ProgressBar1.Visible:=False;
Result:=True;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Renomear_Series;
var
i,cont:Integer;
pasta,nome_arquivo,extensao_video:String;
SR:TSearchRec;
Nao_Encontrados,Sim_Encontrados:TStringList;
begin

 {INÍCIO - SelectDirectory}
 {shell:MyComputerFolder}
 if SelectDirectory(Lang_SRT(40), Form1.OpenDialog1.InitialDir ,Pasta) then
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
   SetLength(vt_seriado,cont);              //--> Vetor GLOBAL
   SetLength(vt_nome_arquivo_normal,cont);  //--> Vetor GLOBAL
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Processar_Legenda;
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

Form1.ProgressBar1.Visible:=True;
Form1.ProgressBar1.Position:=0;
Form1.ProgressBar1.Max:=Form1.RichText1.Lines.Count;
Form1.ProgressBar1.Refresh;

           //----------------------------------------------------------------------------------------
           //SEPARA LINHA, ID, TEMPO e DIÁLOGO da Legenda - INÍCIO
           //----------------------------------------------------------------------------------------
           for j:= 0 to Form1.RichText1.Lines.Count-1 do
           begin
           Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;

             //----------------------------------------------------------------------------------------
             {LINHA, ID, TEMPO - INÍCIO}
             //----------------------------------------------------------------------------------------
             if (IsNumeric(Form1.RichText1.lines[j])) and (AnsiContainsStr(Form1.RichText1.Lines[j+1],' --> ')) and ((Trim(Form1.RichText1.Lines[j-1])) = '') then
             begin
             Inc(k);
             vt_linha[k-1]:=IntToStr(j+1);              //--> Número da Linha
             vt_id[k-1]:=Form1.RichText1.Lines[j];      //--> ID da Legenda
             vt_tempo[k-1]:=Form1.RichText1.Lines[j+1]; //--> Tempo da Legenda

               //---------------------------------------
               //DIÁLOGO - INÍCIO
               //---------------------------------------
               i:=1;
               while (Form1.RichText1.Lines[j+i+1] <> '') do
               begin
               Inc(i);

                   //INDICA DIÁLOGO ACIMA DE 2 LINHAS
                   if (i>3) then
                   begin
                   Inc(cont1);

                   Form1.ListBox2.Items.Add(IntToStr(cont1)+' - '+Form1.RichText1.Lines[j]);

                   SetLength(vt_limitelinha,cont1+1); //--> Define o tamanho do Vetor Dinâmico
                   vt_limitelinha[cont1]:=j+1;        //--> Preenche o Vetor com as linhas de LIMITES DE LINHA
                   break;
                   end;

               end;
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

                Form1.ListBox1.Items.Add(IntToStr(cont2)+' - '+vt_id[i]);

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

     while j < Form1.RichText1.Lines.Count do
     begin
       if (IsNumeric(Trim(Form1.RichText1.Lines[j]))) and
          (j + 1 < Form1.RichText1.Lines.Count) and
          (AnsiContainsStr(Form1.RichText1.Lines[j+1], ' --> ')) then
       begin
       idLinha:=j;
       DentroCC:=False;
       AntesCC:=ContCC;
       Inc(j, 2);

         while (j < Form1.RichText1.Lines.Count) and (Trim(Form1.RichText1.Lines[j]) <> '') do
         begin
         RemoverCC(Form1.RichText1.Lines[j], DentroCC, ContCC);
         Inc(j);
         end;

         if ContCC > AntesCC then
         begin
         Inc(cont3);
         Form1.ListBox3.Items.Add(IntToStr(cont3)+' - '+Form1.RichText1.Lines[idLinha]);
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
   {TRADUZIR CONTAGEM - 05/09}
   //-----------------------------------------------------------------------
   if (cont3 > 0) then
   begin
     if (cont3 = 1) then
     Form1.FIdLabel2:=95
     else
     Form1.FIdLabel2:=96;

   Form1.Label2.Caption:=Format(Lang_SRT(96),[cont3]);

   //-----------------------------------------------------------
   Form1.Image5.Left:=Form1.Label2.Left+Form1.Label2.Width+S(3);
   Form1.Label2.Visible:=True;
   Form1.Image5.Visible:=True;
   //-----------------------------------------------------------
   Form1.btnclosecaption.Enabled:=True;
   Form1.lstclosecaption.Enabled:=True;
   //----------------------------------------
   end;

   //-----------------------------------------------------------------------
   //LIMITES DE LINHA - TEXTOS
   {TRADUZIR CONTAGEM - 06/09}
   //-----------------------------------------------------------------------
   if (cont1 > 0) then
   begin
     if (cont1 = 1) then
     Form1.FIdLabel3:=31
     else
     Form1.FIdLabel3:=32;

   Form1.Label3.Caption:=Format(Lang_SRT(32),[cont1]);

   //----------------------------------------
   Form1.Image3.Left:=Form1.Label3.Left+Form1.Label3.Width+S(3);
   Form1.Label3.Visible:=True;
   Form1.Image3.Visible:=True;
   //----------------------------------------
   Form1.btneditar.Enabled:=True;
   Form1.lsteditar.Enabled:=True;
   //----------------------------------------

    if (cont1 = 1) then
    Form1.StatusBar1.Panels[0].Text:=Lang_SRT(19)
    else
    Form1.StatusBar1.Panels[0].Text:=Format(Lang_SRT(20),[cont1+cont2]);
   end;

   //-----------------------------------------------------------------------
   //SOBREPOSIÇÕES - TEXTOS
   {TRADUZIR CONTAGEM - 07/09}
   //-----------------------------------------------------------------------
   if (cont2 > 0) then
   begin
     if (cont2 = 1) then
     Form1.FIdLabel1:=33
     else
     Form1.FIdLabel1:=34;

   Form1.Label1.Caption:=Format(Lang_SRT(34),[cont2]);

   //----------------------------------------
   Form1.Image1.Left:=Form1.Label1.Left+Form1.Label1.Width+S(3);
   Form1.Label1.Font.Color:=clRed; //LETRA VERMELHA
   Form1.Label1.Visible:=True;
   Form1.Image1.Visible:=True;
   Form1.Image2.Left:=Form1.Image1.Left;
   //----------------------------------------
   Form1.btnconsertar.Enabled:=True;
   Form1.lstconsertar.Enabled:=True;

     if (cont2 = 1) then
     Form1.StatusBar1.Panels[0].Text:=Lang_SRT(19)
     else
     Form1.StatusBar1.Panels[0].Text:=Format(Lang_SRT(20),[cont1+cont2]);
   end;
   //-----------------------------------------------------------------------

     if (cont1 = 0) and (cont2 = 0) then
     begin
     //-----------------------------------
     Form1.btntempo.Enabled  :=True;
     Form1.lsttempo.Enabled  :=True;
     Form1.btnstretch.Enabled:=True;
     Form1.lststretch.Enabled:=True;
     Form1.btnfraps.Enabled  :=True;
     Form1.lstfraps.Enabled  :=True;
     Form1.btnnumeros.Enabled:=True;
     Form1.lstnumeros.Enabled:=True;
     Form1.btn_editAvancada.Enabled:=True;
     Form1.lst_editAvancada.Enabled:=True;
     //-----------------------------------
     Form1.StatusBar1.Panels[0].Text:=Lang_SRT(21);
     end;

{ORGANIZAR LISTAS - 03/05}
OrganizarListas;

Form1.ProgressBar1.Visible:=False;
//------------------------
Form1.btnabrir.Enabled:=True;
Form1.lstabrir.Enabled:=True;
Form1.btnrenomear.Enabled:=True;
Form1.lstrenomear.Enabled:=True;
//------------------------

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Corrigir_Sobreposicao;
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

Rot[1]:=Form1.Label1; Lst[1]:=Form1.ListBox1;
Rot[2]:=Form1.Label3; Lst[2]:=Form1.ListBox2;
Rot[3]:=Form1.Label2; Lst[3]:=Form1.ListBox3;

  for k:=1 to 3 do
  begin
  RotVis[k]:=Rot[k].Visible;
  LstVis[k]:=Lst[k].Visible;
  RotCap[k]:=Rot[k].Caption;
  Itens[k]:=TStringList.Create;
  Itens[k].Assign(Lst[k].Items);
  end;

Img3Vis:=Form1.Image3.Visible;
Img5Vis:=Form1.Image5.Visible;

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

  Form1.Image3.Visible:=Img3Vis;
  Form1.Image5.Visible:=Img5Vis;

  Form1.ProgressBar1.Visible:=True;
  Form1.ProgressBar1.Position:=0;
  Form1.ProgressBar1.Max:=Length(vt_tempo)-1;
  Form1.ProgressBar1.Refresh;

  SL:=TStringList.Create;
    try
    SL.Assign(Form1.RichText1.Lines);

      for i:=0 to Length(vt_tempo)-2 do
      begin
      Form1.ProgressBar1.Position:=i+1;
      tempo1:=Copy(vt_tempo[i]  ,18,12);
      tempo2:=Copy(vt_tempo[i+1],1 ,12);

        if StrToTime(tempo1) > StrToTime(tempo2) then
        begin
        ln:=StrToInt(vt_linha[i]);
          if (ln < SL.Count) and (Copy(SL[ln],18,12) = tempo1) then
          SL[ln]:=Copy(SL[ln],1,17) + tempo2 + Copy(SL[ln],30,MaxInt);
        end;
      end;

    Form1.RichText2.Lines.Assign(SL);
    finally
    SL.Free;
    end;
  finally
    for k:=1 to 3 do
    Itens[k].Free;
  end;

Form1.RichText2.Visible:=True;
AjustarAlturas;
Form1.RichText2.SetFocus;
Form1.ProgressBar1.Visible:=False;

//-----------------------------------------------------------
Form1.StatusBar1.Panels[0].Text:=Lang_SRT(22);
Form1.Label1.Font.Color:=clBlue;  //LETRA AZUL
Form1.Image1.Visible:=False;      //ALERTA
Form1.Image2.Left:=Form1.Label1.Left+Form1.Label1.Width+S(3);
Form1.Image2.Visible:=True;       //SUCESSO
Form1.Image3.Left:=Form1.Label3.Left+Form1.Label3.Width+S(3);
Form1.Image5.Left:=Form1.Label2.Left+Form1.Label2.Width+S(3);
//-----------------------------------------------------------

{ORGANIZAR LISTAS - 04/05}
OrganizarListas;

SendMessage(Form1.RichText1.Handle,WM_VSCROLL,SB_TOP,0);
SendMessage(Form1.RichText2.Handle,WM_VSCROLL,SB_TOP,0);

//------------------------------------------------------------
Form1.btnabrir.Enabled     :=True;
Form1.lstabrir.Enabled     :=True;
Form1.btnsalvar.Enabled    :=True;
Form1.lstsalvar.Enabled    :=True;
Form1.btnsalvarcomo.Enabled:=True;
Form1.lstsalvarcomo.Enabled:=True;
Form1.btnrenomear.Enabled  :=True;
Form1.lstrenomear.Enabled  :=True;
Form1.lstlocalizar.Enabled :=False;
//------------------------------------------------------------
{CC continua disponível se houver ocorrência}
Form1.btnclosecaption.Enabled:=Form1.ListBox3.Items.Count > 0;
Form1.lstclosecaption.Enabled:=Form1.btnclosecaption.Enabled;
//------------------------------------------------------------

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Alterar_Cor_Legenda;
var
HexColor: string;
begin

  if not Form1.ColorDialog1.Execute then
  Exit;

//-----------------------------------------------------
editar:=True; //--> Variável GLOBAL (Editar)
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
//-----------------------------------------------------
Form1.Panel1.Visible:=True;

BotoesTopo_Off;

SoftResetPreserveText(Form1.RichText1);
HexColor := ColorToHex(Form1.ColorDialog1.Color);

  FProcessandoLegenda := True;
  Try
  // FASE 1 — TEXTO (rápido)
  AtualizarTextoComFont(Form1.RichText1.Lines, HexColor, Form1.ProgressBar1);
  // FASE 2 — VISUAL (15 Primeiros diálogos)
  ColorirVisualLimitado(Form1.RichText1, Form1.ColorDialog1.Color, 15);
  Finally
  FProcessandoLegenda := False;
  end;

//--------------------------------
Form1.btnabrir.Enabled     :=True;
Form1.lstabrir.Enabled     :=True;
Form1.btnsalvar.Enabled    :=True;
Form1.lstsalvar.Enabled    :=True;
Form1.btnsalvarcomo.Enabled:=True;
Form1.lstsalvarcomo.Enabled:=True;
Form1.btnrenomear.Enabled  :=True;
Form1.lstrenomear.Enabled  :=True;
Form1.btntags.Enabled      :=True;
Form1.lsttags.Enabled      :=True;
//--------------------------------

SendMessage(Form1.RichText1.Handle, WM_VSCROLL, SB_TOP, 0);

Form1.StatusBar1.Panels[0].Text := Lang_SRT(28);
Form1.Panel1.Visible := False;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Verificar_Ortografia;
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
    Texto := Form1.RichText1.Text;
    Palavra := '';
    InicioPalavra := 0;

    for I := 1 to Length(Texto) do
    begin
      if IsLetter(Texto[I]) then
      begin
        if Palavra = '' then
        InicioPalavra := I - 1;

      Palavra := Palavra + Texto[I];
      end
      else
      begin
        if Palavra <> '' then
        begin
        Palavra := CleanWord(Palavra);

          if (Length(Palavra) > 2) and (not SpellOK(Palavra)) then
          begin
            Form1.RichText1.SelStart := InicioPalavra;
            Form1.RichText1.SelLength := Length(Palavra);
            Form1.RichText1.SelAttributes.Style := [fsUnderline];
            Form1.RichText1.SelAttributes.Color := clRed;
          end;

        Palavra := '';
        end;
      end;
    end;

    // Última Palavra
    if Palavra <> '' then
    begin
      Palavra := CleanWord(Palavra);

      if (Length(Palavra) > 2) and (not SpellOK(Palavra)) then
      begin
        Form1.RichText1.SelStart := InicioPalavra;
        Form1.RichText1.SelLength := Length(Palavra);
        Form1.RichText1.SelAttributes.Style := [fsUnderline];
        Form1.RichText1.SelAttributes.Color := clRed;
      end;
    end;

    Form1.RichText1.SelLength := 0;
  Finally
  FProcessandoLegenda := False;
  end;

SendMessage(Form1.RichText1.Handle,WM_VSCROLL,SB_TOP,0);
//----------------------------------
Form1.btn_ortografia.Enabled:=False;
Form1.lst_ortografia.Enabled:=False;
//----------------------------------

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Remover_CloseCaption;
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

Form1.Panel1.Visible:=True;

BotoesTopo_Off;

ContadorRemocoes:=0;
DialogosComCC := 0;

  if Form1.RichText2.Visible then
  Fonte:=Form1.RichText2
  else
  Fonte:=Form1.RichText1;

Form1.ProgressBar1.Visible:=True;
Form1.ProgressBar1.Position:=0;
Form1.ProgressBar1.Max:=Fonte.Lines.Count;

Bloco:=TStringList.Create;
Novo :=TStringList.Create;

  try
  j := 0;

    while j < Fonte.Lines.Count do
    begin
    Form1.ProgressBar1.Position := j + 1;

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
      Form1.ProgressBar1.Refresh;
      Application.ProcessMessages;
      end;

    end;

  Application.ProcessMessages;

  //O resultado SEMPRE vai para o RichText1
  Form1.RichText1.Lines.BeginUpdate;
    try
    Form1.RichText1.Lines.Assign(Novo);
    finally
    Form1.RichText1.Lines.EndUpdate;
    end;

  finally
  Bloco.Free;
  Novo.Free;
  Form1.ProgressBar1.Visible:=False;
  end;

  if Form1.RichText2.Visible then
  begin
  Form1.RichText2.Clear;
  Form1.RichText2.Visible:=False;
  AjustarAlturas;
  end;

SendMessage(Form1.RichText1.Handle, WM_VSCROLL, SB_TOP, 0);
Contar_Linhas_Dialogos(Form1.RichText1,Form1.ProgressBar1,Form1.Label4,Form1.Label8);

//-----------------------------------
Form1.ListBox1.Clear;
Form1.ListBox1.Visible:=False;
Form1.ListBox2.Clear;
Form1.ListBox2.Visible:=False;
Form1.ListBox3.Clear;
Form1.ListBox3.Visible:=False;
Form1.Label2.Caption:='';
Form1.Label2.Visible:=False;
Form1.Label3.Caption:='';
Form1.Label3.Visible:=False;
Form1.Image1.Visible:=False;
Form1.Image3.Visible:=False;
Form1.Image5.Visible:=False;
//-----------------------------------
Form1.btnabrir.Enabled:=True;
Form1.lstabrir.Enabled:=True;
Form1.lstsalvar.Enabled:=True;
Form1.btnsalvar.Enabled:=True;
Form1.lstsalvarcomo.Enabled:=True;
Form1.btnsalvarcomo.Enabled:=True;
Form1.btn_editAvancada.Enabled:=True;
Form1.lst_editAvancada.Enabled:=True;
Form1.btnnumeros.Enabled:=True;
Form1.lstnumeros.Enabled:=True;
Form1.btnrenomear.Enabled:=True;
Form1.lstrenomear.Enabled:=True;
Form1.btntags.Enabled:=True;
Form1.lsttags.Enabled:=True;
Form1.btn_ortografia.Enabled:=True;
Form1.lst_ortografia.Enabled:=True;
//-----------------------------------

  //----------------------------
  {TRADUZIR CONTAGEM - 08/09}
  //----------------------------
  if ContadorRemocoes = 0 then
  begin
  Form1.Label1.Caption:='';
  Form1.Label1.Visible:=False;
  Form1.Image2.Visible:=False;
  Form1.StatusBar1.Panels[0].Text := Lang_SRT(29);
  end
  else
  begin
  Form1.FIdLabel1:=35;
  Form1.Label1.Caption:=TextoContagem(Form1.FIdLabel1, DialogosComCC);
  Form1.Label1.Font.Color:=clBlue;
  Form1.Label1.Visible:=True;
  Form1.Image2.Left:=Form1.Label1.Left+Form1.Label1.Width+S(3);
  Form1.Image2.Visible:=True;
  Form1.StatusBar1.Panels[0].Text := Lang_SRT(30);
  end;

{ORGANIZAR LISTAS - 05/05}
OrganizarListas;

Form1.Panel1.Visible := False;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

end.

