unit Funcoes_Genericas;

interface

uses
Windows, SysUtils, Classes, Graphics, TLHelp32;

function  SystemDir:String;
procedure FileCopy(const SourceFileName,TargetFileName:String);
function  IsRunningProcess(ExeFileName:String):Boolean;
function  KillTask(ExeFileName:String):Integer;
function  Inverter_String(Texto:String):String;
function  HexToColor(sColor:String):TColor;
function  Resolucao_Tela_Fusion(Resolucao:Integer):String;
procedure Localiza_Move(Diretorio: String);
function  Bloquear_Caracteres(Campo:String):Boolean;
function  Diretorio_Corrente(Arquivo:String):String;
function  Trocar_String(S,Localizar,Substituir:String):String;

implementation
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function SystemDir: String;
var
dir: array [0..MAX_PATH] of Char;
begin
GetSystemDirectory(dir, MAX_PATH);
Result := StrPas(dir);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure FileCopy(const SourceFileName,TargetFileName:String);
var
S,T: TFileStream;
begin
S:=TFileStream.Create(SourceFileName,fmOpenRead);
 try
 T:=TFileStream.Create(TargetFileName,fmOpenWrite or fmCreate);
   try
   T.CopyFrom(S,S.Size);
   finally
   T.Free;
   end;
 finally
 S.Free;
 end;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function IsRunningProcess(exeFileName:String):Boolean;
var 
ContinueLoop   :BOOL;
FSnapshotHandle:THandle;
FProcessEntry32:TProcessEntry32;
begin
Result:=False;

FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
FProcessEntry32.dwSize:=SizeOf(FProcessEntry32);
ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
         UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
         UpperCase(ExeFileName))) then
    Result := True;
  ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

CloseHandle(FSnapshotHandle);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function KillTask(ExeFileName:String):Integer;
const
PROCESS_TERMINATE = $0001;
var
ContinueLoop   :BOOL;
FSnapshotHandle:THandle;
FProcessEntry32:TProcessEntry32;
begin
Result:=0;

FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
FProcessEntry32.dwSize:=SizeOf(FProcessEntry32);
ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
         UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
         UpperCase(ExeFileName))) then
    Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),FProcessEntry32.th32ProcessID),0));
  ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  
CloseHandle(FSnapshotHandle);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function Inverter_String(Texto:String):String;
var
i:Integer;
begin
Result:='';

 for i:=Length(Texto) downto 1 do
 Result:=Result+Copy(Texto,i,1);

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function HexToColor(sColor:String):TColor;
begin
Result:=RGB(StrToInt('$'+Copy(sColor,1,2)),
            StrToInt('$'+Copy(sColor,3,2)),
            StrToInt('$'+Copy(sColor,5,2)));
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function Resolucao_Tela_Fusion(Resolucao:Integer):String;
var
aux:Double;
begin
{
DResolution=0,3,0,4
1024x768

0 + (256 * 3) = 768
0 + (256 * 4) = 1024
}
aux   :=Resolucao/256;
Result:=IntToStr(Trunc(aux));
aux   :=Trunc(aux)*256;
aux   :=Resolucao-aux;

Result:=IntToStr(Trunc(aux))+','+Result;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Localiza_Move(Diretorio:String);
var
SearchRec: TSearchRec;
begin
Diretorio:=Trim(Diretorio);

 if Diretorio[Length(Diretorio)] <> '' then
 Diretorio:=Diretorio + '';

SetCurrentDir(diretorio);
               
 if FindFirst('*.rpi', faAnyFile, SearchRec) = 0 then
 Repeat
  if not (SearchRec.Name = '2xSaI.rpi') then
  begin
   if DirectoryExists(Diretorio+'Render Plugin') = False then
   ForceDirectories(Diretorio+'Render Plugin');
    Try
    FileCopy(Diretorio+SearchRec.Name,Diretorio+'Render Plugin\'+SearchRec.Name);
    Finally
    DeleteFile(Diretorio+SearchRec.Name);
    end;
  end;
 Until FindNext(SearchRec) <> 0;
 
FindClose(SearchRec);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function Bloquear_Caracteres(Campo:String):Boolean;
var
i:integer;
begin
i:=1;
Result:=False;

 while i < Length(Campo)+1 do
 begin
  if (Campo[i] in ['0'..'9','a'..'z','A'..'Z']) or (Campo[i] = ' ') then
  begin
  Result:=False;
  Inc(i);
  end
   else
   begin
   Result:=True;
   Break;
   end;
 end;

end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function Diretorio_Corrente(Arquivo:String):String;
var
posicao:Integer;
caminho:String;
begin
posicao:=Pos('\',Inverter_String(ExtractFileDir(Arquivo)));
caminho:=Inverter_String(Copy(ExtractFileDir(Arquivo),0,Length(ExtractFileDir(Arquivo))));

Result:=Inverter_String(Copy(caminho,1,posicao-1));
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function Trocar_String(S,Localizar,Substituir:String):String;
var
retorno:String;
posicao:Integer;
begin
retorno:=S;
posicao:=Pos(Localizar,retorno);

 if posicao <> 0 then
 begin
 Delete(retorno,posicao,Length(Localizar));
 Insert(Substituir,retorno,posicao);
 end;

Result:=retorno;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------


end.
 