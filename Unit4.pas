unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls,
  OleCtrls, SHDocVw, ShellAPI, Vcl.Imaging.GIFImg;

type
  Tsplash_screen = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    loading: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
Splash_Screen: TSplash_Screen;

implementation

uses Unit1, Language;

{$R *.dfm}

procedure Tsplash_screen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Splash_Screen.Release;
Splash_Screen:=Nil;
end;

procedure Tsplash_screen.FormCreate(Sender: TObject);
begin
Label1.Caption:=Lang_SRT(94);
Label1.Left :=(ClientWidth-Label1.Width ) div 2;
loading.Left:=(ClientWidth-loading.Width) div 2;

if Form1 <> nil then
loading.Visible:=False;

  if FileExists('check_update.exe') then
  ShellExecute(0,'open','check_update.exe',pchar(SRT_VERSAO_Global),nil,SW_HIDE);

end;

procedure Tsplash_screen.FormActivate(Sender: TObject);
begin

  if loading.Picture.Graphic is TGIFImage then
  begin
    TGIFImage(loading.Picture.Graphic).Animate     := True;
    TGIFImage(loading.Picture.Graphic).AnimateLoop := glEnabled;
  end;

end;

end.
