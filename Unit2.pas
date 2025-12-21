unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, StrUtils, WinSkinData;

type
  TForm2 = class(TForm)
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    Label3: TLabel;
    ScrollBar3: TScrollBar;
    GroupBox1: TGroupBox;
    RadioDepois: TRadioButton;
    RadioAntes: TRadioButton;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    ScrollBar4: TScrollBar;
    SkinData1: TSkinData;
    GroupBox3: TGroupBox;
    RadioTempo: TRadioButton;
    RadioDuracao: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ScrollBar1Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure RadioDepoisClick(Sender: TObject);
    procedure RadioAntesClick(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure RadioDuracaoClick(Sender: TObject);
    procedure RadioTempoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  horas,minutos,segundos,msegundos:String;

implementation

uses Unit1, Funcoes;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
Form2.Caption:=Application.Title+' - Ajuste de Tempo';
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form2.Release;
Form2:=Nil;
end;

procedure TForm2.ScrollBar1Change(Sender: TObject);
begin
horas:=Copy(MaskEdit1.Text,1,2);
minutos:=Copy(MaskEdit1.Text,4,2);
segundos:=Copy(MaskEdit1.Text,7,2);
msegundos:=Copy(MaskEdit1.Text,10,3);

segundos:=FormatZero(ScrollBar1.Position,2);;

MaskEdit1.Text:=horas+':'+minutos+':'+segundos+','+msegundos;

 if (ScrollBar1.Position > 0)
 or (ScrollBar2.Position > 0)
 or (ScrollBar3.Position > 0)
 or (ScrollBar4.Position > 0)
 then
 btnOK.Enabled:=True
 else
 btnOK.Enabled:=False;

end;

procedure TForm2.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TForm2.RadioDepoisClick(Sender: TObject);
begin
Label4.Caption:='+';
Label4.Left:=10;
end;

procedure TForm2.RadioAntesClick(Sender: TObject);
begin
//------------------
Label4.Caption:='-';
Label4.Left:=14;
//------------------
end;

procedure TForm2.ScrollBar2Change(Sender: TObject);
begin
//-----------------------------------
horas:=Copy(MaskEdit1.Text,1,2);
minutos:=Copy(MaskEdit1.Text,4,2);
segundos:=Copy(MaskEdit1.Text,7,2);
msegundos:=Copy(MaskEdit1.Text,10,3);
//-----------------------------------

minutos:=FormatZero(ScrollBar2.Position,2);;

MaskEdit1.Text:=horas+':'+minutos+':'+segundos+','+msegundos;

 if (ScrollBar1.Position > 0)
 or (ScrollBar2.Position > 0)
 or (ScrollBar3.Position > 0)
 or (ScrollBar4.Position > 0)
 then
 btnOK.Enabled:=True
 else
 btnOK.Enabled:=False;

end;

procedure TForm2.ScrollBar3Change(Sender: TObject);
begin
//-----------------------------------
horas:=Copy(MaskEdit1.Text,1,2);
minutos:=Copy(MaskEdit1.Text,4,2);
segundos:=Copy(MaskEdit1.Text,7,2);
msegundos:=Copy(MaskEdit1.Text,10,3);
//-----------------------------------

horas:=FormatZero(ScrollBar3.Position,2);;

MaskEdit1.Text:=horas+':'+minutos+':'+segundos+','+msegundos;

 if (ScrollBar1.Position > 0)
 or (ScrollBar2.Position > 0)
 or (ScrollBar3.Position > 0)
 or (ScrollBar4.Position > 0)
 then
 btnOK.Enabled:=True
 else
 btnOK.Enabled:=False;

end;

procedure TForm2.FormActivate(Sender: TObject);
begin
MaskEdit1.Color:=Form2.Color;
end;

procedure TForm2.ScrollBar4Change(Sender: TObject);
begin
//-----------------------------------
horas:=Copy(MaskEdit1.Text,1,2);
minutos:=Copy(MaskEdit1.Text,4,2);
segundos:=Copy(MaskEdit1.Text,7,2);
msegundos:=Copy(MaskEdit1.Text,10,3);
//-----------------------------------

msegundos:=FormatZero(ScrollBar4.Position,3);;

MaskEdit1.Text:=horas+':'+minutos+':'+segundos+','+msegundos;

 if (ScrollBar1.Position > 0)
 or (ScrollBar2.Position > 0)
 or (ScrollBar3.Position > 0)
 or (ScrollBar4.Position > 0)
 then
 btnOK.Enabled:=True
 else
 btnOK.Enabled:=False;

end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //Precisa ativar o KeyPreview no Form para funcionar
 if Key = VK_ESCAPE then
 Close;

end;

procedure TForm2.btnOKClick(Sender: TObject);
var
j,i,aux,cont_negativo,cont_duracao: Integer;
add_tempo1,add_tempo2: String;
new_legenda: Array of String;
begin
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
aux:=0;
cont_negativo:=0;
cont_duracao:=0;

//-------------------------
Form2.Visible:=False;
Form1.Panel1.Visible:=True;
//-------------------------

tempo:=MaskEdit1.Text; //--> Variável GLOBAL (Form1)

 //-------------
 BotoesTopo_Off;
 //-------------

 Form1.ProgressBar1.Visible:=True;

 Form1.ProgressBar1.Position:=0;
 Form1.ProgressBar1.Max:=Form1.RichText1.Lines.Count;
 Form1.ProgressBar1.Refresh;
 Form1.RichText2.Lines.Clear;

SetLength(new_legenda,Form1.RichText1.Lines.Count); //--> Define o tamanho do Vetor Dinâmico

           for j:=0 to Form1.RichText1.Lines.Count-1 do
           begin
           Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;
           new_legenda[j]:=Form1.RichText1.Lines[j];

              if (AnsiContainsStr(Form1.RichText1.Lines[j],' --> ')) and (IsNumeric(Form1.RichText1.lines[j-1])) and (Trim(Form1.RichText1.lines[j-2]) = '') then
              begin
              add_tempo1:=copy(Form1.RichText1.Lines[j],1 ,12);
              add_tempo2:=copy(Form1.RichText1.Lines[j],18,12);

                {01 - AJUSTAR - TEMPO DA LEGENDA}
                if RadioTempo.Checked = True then
                begin
                  {O texto virá DEPOIS}
                  if RadioDepois.Checked = True then
                  begin
                  add_tempo1:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(add_tempo1)+StrToTime(tempo)));
                  add_tempo2:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(add_tempo2)+StrToTime(tempo)));
                  end
                  {O texto virá ANTES}
                  else
                  begin
                    {TEMPO NEGATIVO para DELETAR LINHAS}
                    if (StrToTime(add_tempo1)-StrToTime(tempo) < 0) then
                    begin
                    Inc(cont_negativo);
                        i:=0;
                        while (Form1.RichText1.Lines[j+i] <> '') do
                        begin
                        Inc(i);
                          if (Form1.RichText1.Lines[j+i] = '') then
                          break;
                        end;
                        aux:=aux+i+2; //Contém a QUANTIDADE: Linhas no Diálogo + Espaço em Branco + ID + TEMPO
                        dialogo:=dialogo-1; //--> Variável GLOBAL
                    Form1.ProgressBar1.Max:=(Form1.ProgressBar1.Max-j)+(aux); //--> Define o tamanho do Vetor Dinâmico
                    end
                    {TEMPO POSITIVO}
                    else
                    begin
                    add_tempo1:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(add_tempo1)-StrToTime(tempo)));
                    add_tempo2:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(add_tempo2)-StrToTime(tempo)));
                    end;
                  end;
                end
                {02 - AJUSTAR - DURAÇÃO DO DIÁLOGO}
                else
                begin
                  {AUMENTAR a duração}
                  if RadioDepois.Checked = True then
                  add_tempo2:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(add_tempo2)+StrToTime(tempo)))
                  {DIMINUIR a duração}
                  else
                  begin
                    {TEMPO NEGATIVO}
                    if (StrToTime(add_tempo2)-StrToTime(tempo)) < (StrToTime(add_tempo1)) then
                    Inc(cont_duracao)
                    {TEMPO POSITIVO}
                    else
                    add_tempo2:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(add_tempo2)-StrToTime(tempo)));
                  end;
                end;

              new_legenda[j]:=add_tempo1+' --> '+add_tempo2; //--> Preenche o Vetor com os novos valores de TEMPO
              end;

              if (aux > 0) and (Form1.ProgressBar1.Position < 3)  then
              MessageBox(Application.Handle,'Você está tentando fazer o texto aparecer cedo demais.'+#13
                           +'Algumas linhas de texto (normalmente as primeiras) podem ter valores de tempo NEGATIVOS!'+#13#13
                           +'Isto só pode ser feito APAGANDO estas linhas do arquivo de destino...',
                           pchar(Application.Title), MB_ICONWARNING+MB_OK);

              if (cont_duracao > 0) then
              begin
              MessageBox(Application.Handle,'A duração que você definiu está negativando algums diálogos.'+#13
                           +#13+'Defina uma duração maior que a definida atualmente...'+#13#13+'Error code:  #0201',
                           pchar(Application.Title), MB_ICONERROR+MB_OK);
              break;
              end;

           Form1.RichText2.Lines.Add(new_legenda[j]);
           end;

           {Variável "aux" possui a quantidade de linhas para DELETAR}
           if (aux > 0) then
           begin
             for j:=0 to aux-1 do
             begin
             Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;
             Form1.RichText2.Lines.Delete(0);
             end;
           linha:=linha-aux; //--> Variável GLOBAL
           Form1.Label4.Caption:=IntToStr(linha)+' Linhas';
           Form1.Label8.Caption:=IntToStr(dialogo)+' Diálogos';

             if (cont_negativo = 1) then
             Form1.StatusBar1.Panels[0].Text:='Ajuste de tempo realizado com sucesso, porém foi apagado 1 diálogo.'
             else
             Form1.StatusBar1.Panels[0].Text:='Ajuste de tempo realizado com sucesso, porém foram apagados '+IntToStr(cont_negativo)+' diálogos.';
           end
           else
           begin
             if cont_duracao > 0 then
             Form1.StatusBar1.Panels[0].Text:='A duração que você definiu está negativando algums diálogos.'
             else
             begin
               if RadioTempo.Checked = True then
               Form1.StatusBar1.Panels[0].Text:='Ajuste de tempo realizado com sucesso!'
               else
               Form1.StatusBar1.Panels[0].Text:='Ajuste de duração dos diálogos realizada com sucesso!';
             end
           end;

if cont_duracao > 0 then
begin
Form1.RichText2.Visible:=False;
Form1.RichText1.Visible:=True;
Form1.RichText1.SelStart:=0;

SendMessage(Form1.RichText1.Handle, WM_VSCROLL, SB_TOP, 0);

    //------------------------------
    Form1.btnabrir.Enabled:=True;
    Form1.lstabrir.Enabled:=True;
    Form1.btnprocurar.Enabled:=True;
    Form1.lstprocurar.Enabled:=True;
    Form1.btntempo.Enabled:=True;
    Form1.lsttempo.Enabled:=True;
    Form1.btnfraps.Enabled:=True;
    Form1.lstfraps.Enabled:=True;
    Form1.btnnumeros.Enabled:=True;
    Form1.lstnumeros.Enabled:=True;
    Form1.btnrenomear.Enabled:=True;
    Form1.lstrenomear.Enabled:=True;
    Form1.btncores.Enabled:=True;
    Form1.lstcores.Enabled:=True;
    //------------------------------

end
else
begin
Form1.RichText1.Visible:=False;
Form1.RichText2.Top:=Form1.RichText1.Top;
Form1.RichText2.Height:=Form1.RichText1.Height;
Form1.RichText2.Visible:=True;
Form1.RichText2.SelStart:=0;

SendMessage(Form1.RichText2.Handle, WM_VSCROLL, SB_TOP, 0);

  //-------------------------------
  Form1.btnabrir.Enabled:=True;
  Form1.lstabrir.Enabled:=True;
  Form1.btnsalvar.Enabled:=True;
  Form1.lstsalvar.Enabled:=True;
  Form1.btnsalvarcomo.Enabled:=True;
  Form1.lstsalvarcomo.Enabled:=True;
  Form1.btnnumeros.Enabled:=True;
  Form1.lstnumeros.Enabled:=True;
  Form1.btnrenomear.Enabled:=True;
  Form1.lstrenomear.Enabled:=True;
  Form1.btncores.Enabled:=True;
  Form1.lstcores.Enabled:=True;
  //-------------------------------

end;

Form1.ProgressBar1.Visible:=False;
Form1.Panel1.Visible:=False;
Close;
end;

procedure TForm2.RadioDuracaoClick(Sender: TObject);
begin
Form2.Caption:=Application.Title+' - Ajuste de Duração';
MaskEdit1.Text:='00:00:00,000';
RadioDepois.Caption:='Aumentar a duração';
RadioAntes.Caption:='Diminuir a duração';
GroupBox2.Caption:=' Ajuste da duração: ';
GroupBox1.Caption:=' Sobre o diálogo ';
Label1.Enabled:=False;
ScrollBar2.Position:=0;
ScrollBar2.Enabled:=False;
Label3.Enabled:=False;
ScrollBar3.Position:=0;
ScrollBar3.Enabled:=False;
ScrollBar1.Position:=0;
ScrollBar4.Position:=0;
end;

procedure TForm2.RadioTempoClick(Sender: TObject);
begin
Form2.Caption:=Application.Title+' - Ajuste de Tempo';
MaskEdit1.Text:='00:00:00,000';
RadioDepois.Caption:='O texto virá depois';
RadioAntes.Caption:='O texto virá antes';
GroupBox2.Caption:=' Ajuste do tempo: ';
GroupBox1.Caption:=' Sobre o texto ';
Label1.Enabled:=True;
ScrollBar2.Position:=0;
ScrollBar2.Enabled:=True;
Label3.Enabled:=True;
ScrollBar3.Position:=0;
ScrollBar3.Enabled:=True;
ScrollBar1.Position:=0;
ScrollBar4.Position:=0;
end;

end.
