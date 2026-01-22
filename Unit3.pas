unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, StrUtils,
  WinSkinData, OleCtnrs, MPlayer, RXSpin, pngimage;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    Bevel1: TBevel;
    SkinData1: TSkinData;
    Image1: TImage;
    Image2: TImage;
    duvida_pri_dialogo: TSpeedButton;
    duvida_ult_dialogo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure duvida_pri_dialogoClick(Sender: TObject);
    procedure duvida_ult_dialogoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1,Funcoes;

resourceString

mensagem_ajuda_01 = 'Neste campo você deverá informar o tempo inicial do PRIMEIRO diálogo da legenda.'+#13+#13+
                    'ATENÇÃO:'+#13+
                    'Não confunda o diálogo com informações de créditos em cima de criação/sincronia da legenda.';

mensagem_ajuda_02 = 'Neste campo você deverá informar o tempo inicial do ÚLTIMO diálogo da legenda.'+#13+#13+
                    'ATENÇÃO:'+#13+
                    'Não confunda o diálogo com informações de créditos em cima de criação/sincronia da legenda.';

mensagem_erro_0301 = 'O valor de tempo informado em PRIMEIRO DIÁLOGO é inválido!'+#13+
                     'Defina um valor inferior ao formato máximo de 24h.'+#13#13+
                     'Error code:  #0301';

mensagem_erro_0302 = 'O valor de tempo informado em ÚLTIMO DIÁLOGO é inválido!'+#13+
                     'Defina um valor inferior ao formato máximo de 24h.'+#13#13+
                     'Error code:  #0302';

mensagem_erro_0303 = 'O valor de tempo informado em PRIMEIRO DIÁLOGO é inválido!'+#13+
                     'Defina um valor de tempo INFERIOR ao do ÚLTIMO DIÁLOGO.'+#13#13+
                     'Error code:  #0303';

mensagem_erro_0304 = 'O valor de tempo informado em ÚLTIMO DIÁLOGO é inválido!'+#13+
                     'Defina um valor de tempo SUPERIOR ao do PRIMEIRO DIÁLOGO.'+#13#13+
                     'Error code:  #0304';

//----------------------------------------------------------

{FUNÇÃO PARA FAZER CONSISTÊNCIAS NOS CAMPOS DE MASKEDIT}
procedure consistencia_tempo (var MaskEdit1,MaskEdit2: TMaskEdit; mensagem_erro_01,mensagem_erro_02: String; icone_erro: TImage; MaskEdit: TMaskEdit; botao_ok: TSpeedButton; aux: Boolean);
var
Mask1,Mask2:String;
begin

Mask1:=Trim(MaskEdit1.Text);
Mask2:=Trim(MaskEdit2.Text);

if (Length(Mask1) = 12) then
begin
  try
  begin
  StrToTime(Mask1);
  icone_erro.Visible:=False;
  end;
    except
    begin
    MessageBox(Application.Handle,pchar(mensagem_erro_01),pchar(Application.Title), MB_ICONERROR+MB_OK);
    icone_erro.Visible:=True;
    MaskEdit.Clear;
    end;
  end;
end;

 if (Length(Mask1) = 12) and (Length(Mask2) = 12) and (icone_erro.Visible = False) then
 begin
   if aux = True then
   begin
      {TRUE - QUANDO É CHAMADO PELO MASKEDIT1 - PRIMEIRO DIÁLOGO}
      if StrToTime(Mask1) > StrToTime(Mask2) then
      begin
      MessageBox(Application.Handle,pchar(mensagem_erro_02),pchar(Application.Title), MB_ICONERROR+MB_OK);
      icone_erro.Visible:=True;
      MaskEdit.Clear;
      end
      else
      botao_ok.Enabled:=True;
   end
   else
   begin
      {FALSE - QUANDO É CHAMADO PELO MASKEDIT2 - ÚLTIMO DIÁLOGO}
      if StrToTime(Mask1) < StrToTime(Mask2) then
      begin
      MessageBox(Application.Handle,pchar(mensagem_erro_02),pchar(Application.Title), MB_ICONERROR+MB_OK);
      icone_erro.Visible:=True;
      MaskEdit.Clear;
      end
      else
      botao_ok.Enabled:=True;
   end
 end
 else
 botao_ok.Enabled:=False;

end;
//----------------------------------------------------------

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
Form3.Caption:=Application.Title+' - Sincronia Gradativa - Stretch/Shrink';
end;

procedure TForm3.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TForm3.btnOKClick(Sender: TObject);
var
j,cont:Integer;
new_legenda: Array of String;
tempo_inicial_desejado, tempo_final_desejado,
tempo_total_atual, tempo_desejado,
tempo_final_atual, tempo_inicial_atual,
tempo_inicial_atual_dialogo, tempo_final_atual_dialogo,
duracao_dialogo,duracao_tempo_inicial,
percentual_tempo_inicial, percentual_duracao,
novo_tempo1, novo_tempo2: String;

begin
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)
cont:=0;

//-------------------------
Form3.Visible:=False;
Form1.Panel1.Visible:=True;
//-------------------------

tempo_inicial_desejado:=MaskEdit1.Text;
tempo_final_desejado  :=MaskEdit2.Text;

 //-------------
 BotoesTopo_Off;
 //-------------

 Form1.ProgressBar1.Visible:=True;

 Form1.ProgressBar1.Position:=0;
 Form1.ProgressBar1.Max:=Form1.RichText1.Lines.Count;
 Form1.ProgressBar1.Refresh;
 Form1.RichText2.Lines.Clear;

SetLength(new_legenda,Form1.RichText1.Lines.Count); //--> Define o tamanho do Vetor Dinâmico

           tempo_inicial_atual:= copy(vt_tempo[0],1,12);
           tempo_final_atual  := copy(vt_tempo[Length(vt_tempo)-1],1,12);

           tempo_total_atual  := FormatDateTime('HH:MM:SS,ZZZ', StrToTime(tempo_final_atual)   - StrToTime(tempo_inicial_atual))   ;
           tempo_desejado     := FormatDateTime('HH:MM:SS,ZZZ', StrToTime(tempo_final_desejado)- StrToTime(tempo_inicial_desejado));

           for j:=0 to Form1.RichText1.Lines.Count -1 do
           begin
           Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;
           new_legenda[j]:=Form1.RichText1.Lines[j];

              if (AnsiContainsStr(Form1.RichText1.Lines[j],' --> ')) and (IsNumeric(Form1.RichText1.lines[j-1])) and (Trim(Form1.RichText1.lines[j-2]) = '') then
              begin
              Inc(cont);

              {Pega o TEMPO Inicial e Final para cada ocorrência de tempo}
              tempo_inicial_atual_dialogo:=copy(Form1.RichText1.Lines[j],1 ,12);
              tempo_final_atual_dialogo  :=copy(Form1.RichText1.Lines[j],18,12);

              {Faz o cálculo para saber a DURAÇÃO do DIÁLOGO da ocorrência ATUAL}
              duracao_dialogo   :=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(tempo_final_atual_dialogo)-StrToTime(tempo_inicial_atual_dialogo)));
              percentual_duracao:=FloatToStr(StrToTime(duracao_dialogo)/StrToTime(tempo_total_atual));

              {Faz o cálculo para saber a DURAÇÃO do TEMPO INICIAL do diálogo ATUAL}
              duracao_tempo_inicial:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(tempo_inicial_atual_dialogo)-StrToTime(tempo_inicial_atual)));
              percentual_tempo_inicial:=FloatToStr(StrToTime(duracao_tempo_inicial)/StrToTime(tempo_total_atual));

                //Quando for o PRIMEIRO Diálogo
                if cont = 1 then
                begin
                novo_tempo1:=MaskEdit1.Text;
                novo_tempo2:=FormatDateTime('HH:MM:SS,ZZZ',(StrToTime(tempo_desejado)*StrToFloat(percentual_duracao))+StrToTime(novo_tempo1));
                end
                else
                begin
                  //Quando for o ÚLTIMO Diálogo
                  if cont = Length(vt_tempo) then
                  begin
                  novo_tempo1:=MaskEdit2.Text;
                  novo_tempo2:=FormatDateTime('HH:MM:SS,ZZZ',(StrToTime(tempo_desejado)*StrToFloat(percentual_duracao))+StrToTime(novo_tempo1));
                  end
                  //Quando for O RESTO dos Diálogos
                  else
                  begin
                  novo_tempo1:=FormatDateTime('HH:MM:SS,ZZZ', StrToTime(tempo_desejado)*StrToFloat(percentual_tempo_inicial)+StrToTime(tempo_inicial_desejado));
                  novo_tempo2:=FormatDateTime('HH:MM:SS,ZZZ', (StrToTime(tempo_desejado)*StrToFloat(percentual_duracao))+StrToTime(novo_tempo1));
                  end;
                end;

              new_legenda[j]:=novo_tempo1+' --> '+novo_tempo2; //--> Preenche o Vetor com os novos valores de TEMPO
              end;

           Form1.RichText2.Lines.Add(new_legenda[j]);
           end;

Form1.RichText2.Top:=Form1.RichText1.Top;
Form1.RichText2.Height:=Form1.RichText1.Height;
Form1.RichText1.Visible:=False;
Form1.RichText2.Visible:=True;

  //--------------------------------
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
  Form1.btn_editAvancada.Enabled:=True;
  Form1.lst_editAvancada.Enabled:=True;
  //--------------------------------

 Form1.ProgressBar1.Visible:=False;
 Form1.StatusBar1.Panels[0].Text:='Sincronia gradativa realizada com sucesso!';

Form1.Panel1.Visible:=False;
Close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form3.Release;
Form3:=Nil;
end;

procedure TForm3.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //Precisa ativar o KeyPreview no Form para funcionar
 if Key = VK_ESCAPE then
 Close;

end;

procedure TForm3.MaskEdit1Change(Sender: TObject);
begin
consistencia_tempo(MaskEdit1,MaskEdit2,mensagem_erro_0301,mensagem_erro_0303,Image1,MaskEdit1,btnOK,True);
end;

procedure TForm3.MaskEdit2Change(Sender: TObject);
begin
consistencia_tempo(MaskEdit2,MaskEdit1,mensagem_erro_0302,mensagem_erro_0304,Image2,MaskEdit2,btnOK,False);
end;

procedure TForm3.duvida_pri_dialogoClick(Sender: TObject);
begin
MessageBox(Application.Handle,pchar(mensagem_ajuda_01),pchar(Application.Title), MB_ICONINFORMATION+MB_OK);
end;

procedure TForm3.duvida_ult_dialogoClick(Sender: TObject);
begin
MessageBox(Application.Handle,pchar(mensagem_ajuda_02),pchar(Application.Title), MB_ICONINFORMATION+MB_OK);
end;

end.
