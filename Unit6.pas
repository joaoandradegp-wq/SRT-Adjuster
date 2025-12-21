unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, WinSkinData, ComCtrls, StrUtils;

type
  TForm6_substituir = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    btn_localizar: TSpeedButton;
    btn_substituir: TSpeedButton;
    btn_substituir_tudo: TSpeedButton;
    btn_cancelar: TSpeedButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    SkinData1: TSkinData;
    procedure Edit1Change(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_localizarClick(Sender: TObject);
    procedure btn_substituir_tudoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btn_substituirClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6_substituir: TForm6_substituir;

implementation

uses Unit1;

//----------------------------------------------------------

{FUNÇÃO PARA "SUBSTITUIR TUDO" e "MARCAR SENTENÇAS ENCONTRADAS"}
Procedure FindReplace (const encontra_string, substitui_string: String;
                         Var Legenda: TRichEdit;
                             Maiuscula_Minuscula,Marca_Palavra,Palavra_Inteira: Boolean);
var
i,posicao,ocorrencias,inicio_palavra: Integer;
linha_texto,palavra_plural,palavra_singular,palavra_original: String;
begin
ocorrencias:=0;

   //--------------------------------------------------
   if Maiuscula_Minuscula = True then
   palavra_original:=LowerCase(encontra_string)
   else
   palavra_original:=encontra_string;
   //--------------------------------------------------

 //---------------------------------------------------------------------
 if Marca_Palavra = True then
 begin

    for i:= 0 to Legenda.Lines.count - 1 do
    begin
    //----------------------------------------------------------------------------------------
    inicio_palavra:=pos(copy(palavra_original,1,Length(palavra_original)),Legenda.Lines[i])-1;
    //----------------------------------------------------------------------------------------

      //--------------------------------
      if Maiuscula_Minuscula = True then
      linha_texto:=LowerCase(Legenda.Lines[i])
      else
      linha_texto:=Legenda.Lines[i];
      //--------------------------------

           if Palavra_Inteira = True then
           begin
               if AnsiContainsStr(linha_texto,palavra_original) then
               begin
                   //----------------------------------------------------------------------------------
                   if ( not ( copy(Legenda.Lines[i],inicio_palavra,1)[1] in ['a'..'z','A'..'Z']    ) or
                            ( copy(Legenda.Lines[i],inicio_palavra,1) = copy(palavra_original,1,1) ) )

                   then
                   begin
                   Inc(ocorrencias);
                   Legenda.SelStart:=Legenda.Perform(EM_LINEINDEX, i, 0)+Pos(palavra_original,linha_texto)-1;
                   Legenda.SelLength:=Length(palavra_original);
                   Legenda.SelAttributes.Color:=rgb(255,140,0);
                   Legenda.SelAttributes.Style:=[fsBold];
                   end;
                   //----------------------------------------------------------------------------------
               end;
           end
           else
           begin
               //----------------------------------------------------
               if AnsiContainsStr(linha_texto,palavra_original) then
               begin
               Inc(ocorrencias);
               Legenda.SelStart:=Legenda.Perform(EM_LINEINDEX, i, 0)+Pos(palavra_original,linha_texto)-1;
               Legenda.SelLength:=Length(palavra_original);
               Legenda.SelAttributes.Color:=rgb(255,140,0);
               Legenda.SelAttributes.Style:=[fsBold];    
               end;
               //----------------------------------------------------
           end;

    end;

 palavra_singular:='marcação';
 palavra_plural  :='marcações';
 end
 //---------------------------------------------------------------------
 else
 begin

    for i:= 0 to Legenda.Lines.count - 1 do
    begin
    //----------------------------------------------------------------------------------------
    inicio_palavra:=pos(copy(palavra_original,1,Length(palavra_original)),Legenda.Lines[i])-1;
    //----------------------------------------------------------------------------------------

      //--------------------------------
      if Maiuscula_Minuscula = True then
      linha_texto:=LowerCase(Legenda.Lines[i])
      else
      linha_texto:=Legenda.Lines[i];
      //--------------------------------

      repeat
         //-----------------------------------
         posicao:=Pos(palavra_original,linha_texto);
         //-----------------------------------
         if posicao > 0 then
         begin
            //-----------------------------------------------------------------------------------------
            if Palavra_Inteira = True then
            begin
                   //----------------------------------------------------------------------------------
                   if ( not ( copy(Legenda.Lines[i],inicio_palavra,1)[1] in ['a'..'z','A'..'Z']    ) or
                            ( copy(Legenda.Lines[i],inicio_palavra,1) = copy(palavra_original,1,1) ) )
                   then
                   begin
                   Inc(ocorrencias);
                   Delete(linha_texto,posicao,Length(palavra_original));
                   Insert(substitui_string,linha_texto,posicao);
                   Legenda.Lines[i]:=linha_texto;
                   end
                   else
                   break;
                   //----------------------------------------------------------------------------------
            end
            else
            begin
            Inc(ocorrencias);
            Delete(linha_texto,posicao,Length(palavra_original));
            Insert(substitui_string,linha_texto,posicao);
            Legenda.Lines[i]:=linha_texto;
            end;
            //-----------------------------------------------------------------------------------------
         end;
      until posicao = 0;

    end;

 palavra_singular:='substituição';
 palavra_plural  :='substituições';
 end;

      if ocorrencias = 0 then
      MessageBox(Application.Handle,pchar('Não foi possível encontrar "'+encontra_string+'"'),pchar(Application.Title), MB_ICONINFORMATION+MB_OK)
      else
      begin
        if ocorrencias = 1 then
        MessageBox(Application.Handle,pchar('Foi realizada '+IntToStr(ocorrencias)+' '+palavra_singular+' em toda a legenda.'),pchar(Application.Title), MB_ICONINFORMATION+MB_OK)
        else
        MessageBox(Application.Handle,pchar('Foram realizadas '+IntToStr(ocorrencias)+' '+palavra_plural+' em toda a legenda.'),pchar(Application.Title), MB_ICONINFORMATION+MB_OK);
      end;

end;
//----------------------------------------------------------

{FUNÇÃO PARA "LOCALIZAR" e "SUBSTITUIR"}
procedure Localizar (const palavra_original,substitui_string: String;
                       Var Legenda: TRichEdit;
                           Maiuscula_Minuscula,Palavra_Inteira,Localiza_ou_Substitui: Boolean;
                           Botao: TSpeedButton);
var
FoundPos,StartSearch,EndSearch: LongInt;
Options: TSearchTypes;
linha_texto: String;
linha,coluna: Integer;
begin
Options:=[];

   //--------------------------------
   if Maiuscula_Minuscula = False then
   Options:=Options+[stMatchCase];
   //--------------------------------

   //--------------------------------
   if Palavra_Inteira = True then
   Options:=Options+[stWholeWord];
   //--------------------------------

 //----------------------------------------------
 StartSearch:=Legenda.SelStart+Legenda.SelLength;
 EndSearch:=Length(Legenda.Text);
 //----------------------------------------------

 FoundPos:=Legenda.FindText(palavra_original, StartSearch, EndSearch, Options);

  if FoundPos <> -1 then
  begin
     if Localiza_ou_Substitui = True then
     begin
     Botao.Caption:='&Localizar Próxima';
     //-------------------------------------------
     Legenda.SelStart:=FoundPos;
     Legenda.Perform(EM_SCROLLCARET, FoundPos, 0);
     Legenda.SelLength:=Length(palavra_original);
     //-------------------------------------------
     Legenda.SetFocus;
     end
     else
     begin
     Botao.Caption:='&Substituir Próxima';
     //-----------------------------------------------------
     linha:=Legenda.Perform(EM_LINEFROMCHAR,FoundPos,0);
     coluna:=FoundPos-Legenda.Perform(EM_LINEINDEX,linha,0);
     //-----------------------------------------------------
     linha_texto:=Legenda.Lines[linha];

        //----------------------------------------------------
        Delete(linha_texto,coluna+1,Length(palavra_original));
        Insert(substitui_string,linha_texto,coluna+1);
        Legenda.Lines[linha]:=linha_texto;
        //----------------------------------------------------

     //-------------------------------------------
     Legenda.SelStart:=FoundPos;
     Legenda.Perform(EM_SCROLLCARET, FoundPos, 0);
     Legenda.SelLength:=Length(substitui_string);
     //-------------------------------------------
     Legenda.SetFocus;
     end;
  end
  else
  begin
  MessageBox(Application.Handle, pchar('Não foi possível encontrar "'+palavra_original+'"'), pchar(Application.Title), MB_ICONINFORMATION+MB_OK);
    if Localiza_ou_Substitui = True then
    Botao.Caption:='&Localizar'
    else
    Botao.Caption:='&Substituir';
  end;

end;
//----------------------------------------------------------

{FUNÇÃO PARA POSICIONAR O CURSOR NO INÍCIO DA LEGENDA}
procedure posicionar_inicio (var Legenda: TRichEdit);
begin
   Legenda.SelLength:=0;
   Legenda.SelStart:=0;
end;
//----------------------------------------------------------

{$R *.dfm}

procedure TForm6_substituir.Edit1Change(Sender: TObject);
begin
   if Length(Trim(Edit1.Text)) > 0 then
   begin
   btn_localizar.Enabled:=True;
       //---------------------------------
       if CheckBox2.Checked = True then
       begin
       btn_substituir.Enabled:=False;
       btn_substituir_tudo.Enabled:=False;
       end
       //---------------------------------
       else
       if Length(Trim(Edit2.Text)) > 0 then
       begin
       btn_substituir.Enabled:=True;
       btn_substituir_tudo.Enabled:=True;
       end;
       //---------------------------------
   end
   else
   begin
   btn_localizar.Enabled:=False;
   btn_substituir.Enabled:=False;
   btn_substituir_tudo.Enabled:=False;
   end;

end;

procedure TForm6_substituir.Edit2Change(Sender: TObject);
begin
   if Length(Trim(Edit2.Text)) > 0 then
   begin
     //----------------------------------
     if Length(Trim(Edit1.Text)) > 0 then
     begin
     btn_localizar.Enabled:=True;
       //---------------------------------
       if CheckBox2.Checked = True then
       begin
       btn_substituir.Enabled:=False;
       btn_substituir_tudo.Enabled:=False;
       end
       else
       begin
       btn_substituir.Enabled:=True;
       btn_substituir_tudo.Enabled:=True;
       end;
       //---------------------------------
     end;
     //----------------------------------
   end
   else
   begin
   btn_substituir.Enabled:=False;
   btn_substituir_tudo.Enabled:=False;
   end;

end;

procedure TForm6_substituir.btn_cancelarClick(Sender: TObject);
begin
Close;
end;

procedure TForm6_substituir.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //Precisa ativar o KeyPreview no Form para funcionar
 if Key = VK_ESCAPE then
 Close;

end;

procedure TForm6_substituir.btn_localizarClick(Sender: TObject);
begin

 if (Form1.RichText1.Visible = True) and (Length(btn_localizar.Caption) = 10) then
 posicionar_inicio(Form1.RichText1)
 else
 posicionar_inicio(Form1.RichText2);

 {MARCAR SENTENÇAS ENCONTRADAS}
 {if CheckBox2.Checked = True then
 begin
   if Form1.RichText1.Visible = True then
   FindReplace(Trim(Edit1.Text),'',Form1.RichText1,CheckBox1.Checked,True,CheckBox3.Checked)
   else
   FindReplace(Trim(Edit1.Text),'',Form1.RichText2,CheckBox1.Checked,True,CheckBox3.Checked);
 end
 else  }
 {LOCALIZAR}
 begin
   if Form1.RichText1.Visible = True then
   Localizar(Trim(Edit1.Text),'',Form1.RichText1,CheckBox1.Checked,CheckBox3.Checked,True,btn_localizar)
   else
   Localizar(Trim(Edit1.Text),'',Form1.RichText2,CheckBox1.Checked,CheckBox3.Checked,True,btn_localizar)
 end;

end;

procedure TForm6_substituir.btn_substituirClick(Sender: TObject);
begin

 if (Form1.RichText1.Visible = True) and (Length(btn_substituir.Caption) = 11) then
 posicionar_inicio(Form1.RichText1)
 else
 posicionar_inicio(Form1.RichText2);

 {SUBSTITUIR}
 if Form1.RichText1.Visible = True then
 Localizar(Trim(Edit1.Text),Trim(Edit2.Text),Form1.RichText1,CheckBox1.Checked,CheckBox3.Checked,False,btn_substituir)
 else
 Localizar(Trim(Edit1.Text),Trim(Edit2.Text),Form1.RichText2,CheckBox1.Checked,CheckBox3.Checked,False,btn_substituir)

end;

procedure TForm6_substituir.btn_substituir_tudoClick(Sender: TObject);
begin

 {SUBSTITUIR TUDO}
 if Form1.RichText1.Visible = True then
 FindReplace(Trim(Edit1.Text),Trim(Edit2.Text),Form1.RichText1,CheckBox1.Checked,False,CheckBox3.Checked)
 else
 FindReplace(Trim(Edit1.Text),Trim(Edit2.Text),Form1.RichText2,CheckBox1.Checked,False,CheckBox3.Checked);

end;

procedure TForm6_substituir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//(DESLIGAR) FORM NA FRENTE DE TUDO
SetWindowPos(Form6_substituir.Handle, HWND_NOTOPMOST,
             Form6_substituir.Left,
             Form6_substituir.Top,
             Form6_substituir.Width,
             Form6_substituir.Height, 0);

  //-----------------------------------
  Form1.Menu_Arquivo.Enabled:=True;
  Form1.Menu_Ferramentas.Enabled:=True;
  Form1.Menu_Caracter.Enabled:=True;
  Form1.Menu_Sobre.Enabled:=True;
  Form1.ToolBar1.Enabled:=True;
  Form1.box_edicao.Enabled:=True;
  //-----------------------------------

//-----------------------
Edit1.Clear;
Edit2.Clear;
CheckBox1.Checked:=False;
CheckBox2.Checked:=False;
CheckBox3.Checked:=False;
Edit1.SetFocus;
btn_localizar.Caption:='&Localizar';
btn_substituir.Caption:='&Substituir';
//-----------------------

end;

procedure TForm6_substituir.CheckBox2Click(Sender: TObject);
begin
//----------
Edit2.Clear;
//----------

 if CheckBox2.Checked = True then
 begin
 //-------------------------------------------
 btn_localizar.Caption:='Localizar e &Marcar';
 btn_substituir.Enabled:=False;
 btn_substituir_tudo.Enabled:=False;
 Edit2.Clear;
 Edit2.Enabled:=False;
 //-------------------------------------------
 end
 else
 begin
 btn_localizar.Caption:='&Localizar';
 Edit2.Enabled:=True
 end;

//-------------
Edit1.SetFocus;
//-------------

end;

procedure TForm6_substituir.CheckBox1Click(Sender: TObject);
begin
//-------------
Edit1.SetFocus;
//-------------

end;

procedure TForm6_substituir.CheckBox3Click(Sender: TObject);
begin
//-------------
Edit1.SetFocus;
//-------------

end;

procedure TForm6_substituir.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //---------------------------------------------------
 if (Key = 13) and (Length(Trim(Edit1.Text)) > 0) then
 btn_localizar.Click;
 //---------------------------------------------------

    {CTRL+A}
   //--------------------------------------------
   if (Key = Ord('A')) and (ssCtrl in Shift) then
   begin
     TEdit(Sender).SelectAll;
     Key:=0;
   end;
   //--------------------------------------------

end;

procedure TForm6_substituir.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //---------------------------------------------------
 if (Key = 13) and (Length(Trim(Edit2.Text)) > 0) then
 btn_substituir.Click;
 //---------------------------------------------------

   {CTRL+A}
   //--------------------------------------------
   if (Key = Ord('A')) and (ssCtrl in Shift) then
   begin
     TEdit(Sender).SelectAll;
     Key:=0;
   end;
   //--------------------------------------------

end;

procedure TForm6_substituir.FormActivate(Sender: TObject);
begin
Form6_substituir.Color:=Form1.Color;

//(LIGAR) FORM NA FRENTE DE TUDO
SetWindowPos(Form6_substituir.Handle, HWND_TOPMOST,
             Form6_substituir.Left,
             Form6_substituir.Top,
             Form6_substituir.Width,
             Form6_substituir.Height, 0);

  //-----------------------------------
  Form1.Menu_Arquivo.Enabled:=False;
  Form1.Menu_Ferramentas.Enabled:=False;
  Form1.Menu_Caracter.Enabled:=False;
  Form1.Menu_Sobre.Enabled:=False;
  Form1.ToolBar1.Enabled:=False;
  Form1.box_edicao.Enabled:=False;
  //-----------------------------------
  
end;

end.
