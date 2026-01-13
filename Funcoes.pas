unit Funcoes;

interface

Uses Unit1,ComCtrls,StdCtrls,Windows,Messages,IdHTTP,Forms,Wininet,
     SysUtils,Graphics,StrUtils,dialogs;

{REPASSA AS VARIÁVEIS DO ARQUIVO .DPR PARA VARIÁVEIS GLOBAIS}
procedure VarGlobais(Executavel,Diretorio,Versao,Blog:String);
{VERIFICA OS ARQUIVOS DE LEGENDA PARA SERIADOS} 
function Seriado_Quantidade:Boolean;
{VERIFICA SE UMA STRING É NUMÉRICA}
function IsNumeric(const S:String):Boolean;
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
{VERIFICAR SE FOI SELECIONADO O DRIVE DE CD}
function DriveCD:Char;
{SALVAR COMO...}
procedure Salvar_Como;
{TODOS OS BOTÕES DO TOPO FICAM "FALSE"}
procedure BotoesTopo_Off;
{EXIBIR O NÚMERO DA LINHA QUANDO FOR POSICIONADO COM O MOUSE OU TECLADO}
function LinhaAtual(TextoLegenda:TRichEdit):Longint;
{MOSTRAR LISTAGEM DE SOBREPOSIÇÕES E LIMITES DE LINHA - LISTBOX1 E LISTBOX2}
procedure Lista_Indices(var Texto1,Texto2:TRichEdit;ListBox1:TListBox;aux:Boolean;vetor: Array of Integer);

implementation

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
   case MessageBox(Application.Handle, pchar('Foram localizados '+IntToStr(cont_legenda_global+cont_video)+
                                                  ' arquivos de legenda e video de uma Série.'+#13#13+'Deseja ajustar as legendas?')
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
   MessageBox(Application.Handle, pchar('Foi localizado uma legenda com repetição de temporada e episódio neste diretório.'+#13#13+
                                         'Verifique as legendas com '+UpperCase(repetido)+' antes de prosseguir.'+#13#13+
                                         'Error code:  #0107')
                                 , pchar(Application.Title), MB_ICONERROR+MB_OK)
   else
   begin

       if cont_video > cont_legenda_global then
       MessageBox(Application.Handle, pchar('A quantidade de EPISÓDIOS está superior ao de seus arquivos de legenda.'+
                                             #13+'Verifique antes de prosseguir.'+
                                             #13#13+'Episódios: '+IntToStr(cont_video)+' arquivos'+
                                             #13+'Legendas: '+IntToStr(cont_legenda_global)+' arquivos'), pchar(Application.Title), MB_ICONWARNING+MB_OK);


       if cont_legenda_global > cont_video then
       MessageBox(Application.Handle, pchar('A quantidade de LEGENDAS está superior ao de seus arquivos de video.'+
                                             #13+'Verifique antes de prosseguir.'+
                                             #13#13+'Episódios: '+IntToStr(cont_video)+' arquivos'+
                                             #13+'Legendas: '+IntToStr(cont_legenda_global)+' arquivos'), pchar(Application.Title), MB_ICONWARNING+MB_OK);

       if (cont_video = 0) and (cont_legenda_global = 0) then
       MessageBox(Application.Handle, pchar('Não foi possível localizar nenhum arquivo de legenda ou video de uma Série no formato padrão neste diretório.'+#13#13+'Error code:  #0105')
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
 MessageBox(Application.Handle, pchar('Não foi possível aplicar a formatação de texto desejada.'+#13+'Remova a atual antes de adicionar outra ou verifique se selecionou corretamente o texto desejado.'), pchar(Application.Title), MB_ICONWARNING+MB_OK);

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
 MessageBox(Application.Handle, pchar('Não foi possível aplicar a formatação de cores no texto desejado.'+#13+'Remova a atual antes de adicionar outra ou verifique se selecionou corretamente o texto desejado.'), pchar(Application.Title), MB_ICONWARNING+MB_OK);

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
i:integer;
begin
dialogo:=0;  //--> Variável GLOBAL
linha  :=0;  //--> Variável GLOBAL

 for i:= 0 to Legenda.Lines.Count -1 do
 begin
 ProgressBar1.Position := ProgressBar1.Position + 1;
   if (IsNumeric(Legenda.lines[i])) and (AnsiContainsStr(Legenda.Lines[i+1],' --> ')) and ((Trim(Legenda.Lines[i-1])) = '') then
   dialogo:=dialogo+1;
 linha:=linha+1;
 end;

//-------------------------------------------------------------------
Mensagem_Texto_LinhaDialogo(linha,dialogo,Label_Linha,Label_Dialogo);
//-------------------------------------------------------------------
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Mensagem_Texto_LinhaDialogo(var linha_aux,dialogo_aux:Integer;Label_Linha,Label_Dialogo:TLabel);
begin
{MONTA O TEXTO PARA EXIBIR LINHAS E DIÁLOGOS APÓS CONTABILIZAR}

 if linha_aux = 1 then
 Label_Linha.Caption:='1 Linha'
 else
 Label_Linha.Caption:=IntToStr(linha_aux)+' Linhas';

 if dialogo_aux = 1 then
 Label_Dialogo.Caption:='1 Diálogo'
 else
 Label_Dialogo.Caption:=IntToStr(dialogo_aux)+' Diálogos';

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function FormatZero(const aNumber,Length:Integer):String;
begin
Result:=SysUtils.Format('%.*d',[Length,aNumber]);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function DriveCD:Char;
var
drivemap,mask:DWORD;
i:Integer;
root:String;
begin
Result:=#0;
root:='A:';
drivemap:=GetLogicalDrives;
mask:=1;

{
0 The drive type cannot be determined.
1 The root directory does not exist.

DRIVE_REMOVABLE The drive can be removed from the drive.
DRIVE_FIXED The disk cannot be removed from the drive.
DRIVE_REMOTE The drive is a remote (network) drive.
DRIVE_CDROM The drive is a CD-ROM drive.
DRIVE_RAMDISK The drive is a RAM disk.
}

  for i:= 1 to 32 do
  begin
    if (mask and drivemap) <> 0 then
      if GetDriveType(PChar(root)) = DRIVE_CDROM then
      begin
      result:=root[1];
      break;
      end;
    mask:=mask shl 1;
    Inc(root[1]);
    end;

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Salvar_Como;
begin
salvar:=False; //--> Variável GLOBAL (Salvar Alterações)

//---------------------------------
Form1.btnsalvar.Enabled:=False;
Form1.lstsalvar.Enabled:=False;
Form1.btnsalvarcomo.Enabled:=False;
Form1.lstsalvarcomo.Enabled:=False;
Form1.btncores.Enabled:=False;
Form1.lstcores.Enabled:=False;
Form1.btnfraps.Enabled:=False;
Form1.lstfraps.Enabled:=False;
Form1.btnnumeros.Enabled:=False;
Form1.lstnumeros.Enabled:=False;
//---------------------------------

   if Form1.RichText2.Visible = True then
   Form1.RichText2.Lines.SaveToFile(Form1.SaveDialog1.FileName)
   else
   Form1.RichText1.Lines.SaveToFile(Form1.SaveDialog1.FileName);

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
Form1.btncores.Enabled:=False;
Form1.lstcores.Enabled:=False;
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
//------------------------------------------------------------------------------

end.

 