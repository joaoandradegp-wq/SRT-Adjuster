unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, ExtCtrls, Buttons, StdCtrls, StrUtils, ComCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    Bevel1: TBevel;
    SkinData1: TSkinData;
    combo_fps_legenda: TComboBox;
    combo_fps_video: TComboBox;
    duvida_fps_atual: TSpeedButton;
    duvida_fps_desejado: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure combo_fps_legendaChange(Sender: TObject);
    procedure combo_fps_videoChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure duvida_fps_atualClick(Sender: TObject);
    procedure duvida_fps_desejadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1,Funcoes;

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
Form5.Caption:=Application.Title+' - Sincronia de Frame Rate - FPS';
end;

procedure TForm5.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form5.Release;
Form5:=Nil;
end;

procedure TForm5.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //Precisa ativar o KeyPreview no Form para funcionar
 if Key = VK_ESCAPE then
 Close;
 
end;

procedure TForm5.combo_fps_legendaChange(Sender: TObject);
begin
 if (combo_fps_legenda.ItemIndex = 0) or (combo_fps_video.ItemIndex = 0) then
 btnOK.Enabled:=False
 else
 btnOK.Enabled:=True;

end;

procedure TForm5.combo_fps_videoChange(Sender: TObject);
begin
 if (combo_fps_video.ItemIndex = 0) or (combo_fps_legenda.ItemIndex = 0) then
 btnOK.Enabled:=False
 else
 btnOK.Enabled:=True;

end;

procedure TForm5.btnOKClick(Sender: TObject);
var
j: Integer;
new_legenda: Array of String;
tempo1,tempo2,new_tempo1,new_tempo2: String;
begin
salvar:=True; //--> Variável GLOBAL (Salvar Alterações)

//--------------------------
Form5.Visible:=False;
Form1.Panel1.Visible:=True;
//--------------------------

Form1.RichText2.Lines.Clear;

 //-------------
 BotoesTopo_Off;
 //-------------

 Form1.ProgressBar1.Visible:=True;

 Form1.ProgressBar1.Position:=0;
 Form1.ProgressBar1.Max:=Form1.RichText1.Lines.Count;
 Form1.ProgressBar1.Refresh;

SetLength(new_legenda,Form1.RichText1.Lines.Count); //--> Define o tamanho do Vetor Dinâmico

           for j:=0 to Form1.RichText1.Lines.Count-1 do
           begin
           Form1.ProgressBar1.Position:=Form1.ProgressBar1.Position+1;
           new_legenda[j]:=Form1.RichText1.Lines[j];

              if (AnsiContainsStr(Form1.RichText1.Lines[j],' --> ')) and (IsNumeric(Form1.RichText1.lines[j-1])) and (Trim(Form1.RichText1.lines[j-2]) = '') then
              begin
              tempo1:=FormatDateTime('HH:MM:SS,ZZZ', StrToTime(copy(Form1.RichText1.Lines[j],1 ,12)));
              tempo2:=FormatDateTime('HH:MM:SS,ZZZ', StrToTime(copy(Form1.RichText1.Lines[j],18,12)));

              new_tempo1:=FormatDateTime('HH:MM:SS,ZZZ',((StrToTime(tempo1)/StrToFloat(combo_fps_video.Text))*(StrToFloat(combo_fps_legenda.Text))));
              new_tempo2:=FormatDateTime('HH:MM:SS,ZZZ',((StrToTime(tempo2)/StrToFloat(combo_fps_video.Text))*(StrToFloat(combo_fps_legenda.Text))));

              new_legenda[j]:=new_tempo1+' --> '+new_tempo2; //--> Preenche o Vetor com os novos valores de TEMPO
              end;
            Form1.RichText2.Lines.Add(new_legenda[j]);
            end;

Form1.RichText1.Visible:=False;
Form1.RichText2.Top:=Form1.RichText1.Top;
Form1.RichText2.Height:=Form1.RichText1.Height;
Form1.RichText2.Visible:=True;
Form1.RichText2.SelStart:=0;

SendMessage(Form1.RichText2.Handle, WM_VSCROLL, SB_TOP, 0);

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
 Form1.StatusBar1.Panels[0].Text:='Sincronia de Frame Rate realizada com sucesso!';

Form1.Panel1.Visible:=False;
Close;
end;

procedure TForm5.duvida_fps_atualClick(Sender: TObject);
begin
MessageBox(Application.Handle,'Neste campo você deverá informar a TAXA DE QUADROS do video que deseja sincronizar.'
          +#13+#13+'Verifique as propriedades do arquivo de video para conseguir esta informação.'
          ,pchar(Application.Title), MB_ICONINFORMATION+MB_OK);
end;

procedure TForm5.duvida_fps_desejadoClick(Sender: TObject);
begin
MessageBox(Application.Handle,'Neste campo você deverá informar para qual TAXA DE QUADROS que deseja converter, após informar anteriormente o Frame Rate Atual do arquivo de video.'
          ,pchar(Application.Title), MB_ICONINFORMATION+MB_OK);
end;

end.

