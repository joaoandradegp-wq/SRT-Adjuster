unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, RxGIF, abfControls, Animate,
  GIFCtrl, OleCtrls, SHDocVw, RXCtrls, ShellAPI;

type
  Tsplash_screen = class(TForm)
    Image1: TImage;
    rx_loading: TRxGIFAnimator;
    RxLabel1: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
Splash_Screen: TSplash_Screen;

implementation

uses Unit1;

{$R *.dfm}

procedure ExecutarExe(const CaminhoExe: string);
begin
  ShellExecute(0,'open',PChar(CaminhoExe),nil,nil,SW_SHOWNORMAL);
end;

procedure Tsplash_screen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Splash_Screen.Release;
Splash_Screen:=Nil;
end;

procedure Tsplash_screen.FormCreate(Sender: TObject);
begin
if Form1 <> nil then
rx_loading.Visible:=False;

ExecutarExe(ExtractFilePath(Application.ExeName) + 'check_update.exe');
end;

end.
