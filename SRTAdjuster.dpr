program SRTAdjuster;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Splash_Screen},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6_substituir},
  Unit7 in 'Unit7.pas' {AboutBox},
  Funcoes in 'Funcoes.pas',
  SysUtils,
  WinInet,
  ShellAPI;

{$R *.res}

const
//------------------------------------------------------
SRT_VERSAO     = '1.3';
SRT_BLOG       = 'http://phobosfreeware.blogspot.com.br';
//------------------------------------------------------
var
//------------------------------------------------------
SRT_EXE,
SRT_RAIZ:String;
//------------------------------------------------------

begin
//------------------------------------------------------
SRT_EXE:=Copy(ExtractFileName(Application.ExeName),0,Length(ExtractFileName(Application.ExeName))-4);
SRT_RAIZ:=GetCurrentDir+'\';
//------------------------------------------------------

{TRANSFERE AS VARIÁVEIS PARA O FORM1}
//-------------------------------------------------------------------------------
VarGlobais(SRT_EXE,SRT_RAIZ,SRT_VERSAO,SRT_BLOG);
//-------------------------------------------------------------------------------

Application.Initialize;
Application.Title := 'SRT Adjuster 1.3';

Splash_Screen:=Tsplash_screen.Create(Application);
Splash_Screen.Show;
Splash_Screen.Refresh;
Sleep(3000);
Splash_Screen.Hide;
Splash_Screen.Free;

Application.CreateForm(TForm1, Form1);
Application.CreateForm(TForm6_substituir, Form6_substituir);
Application.Run;

end.


