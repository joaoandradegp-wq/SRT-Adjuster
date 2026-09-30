unit Language;

interface

uses SysUtils, Windows, IniFiles, Forms;

var
  // 0 = Automatico (idioma do Windows) | 1 = Portugues | 2 = English
  Language_Global: Integer = 0;

function  GetLanguageWin: String;
function  Lang_SRT(id: Integer): String;
procedure Lang_Load;
procedure Lang_Save;
procedure Lang_Apply(NewLang: Integer);

implementation

uses Unit1, Unit2, Unit3, Unit5, Unit6, Unit7;

//------------------------------------------------------------------------------
// Retorna o codigo ISO 639-1 do idioma do Windows ('pt', 'en', ...)
//------------------------------------------------------------------------------
function GetLanguageWin: String;
var
  Buf: array[0..9] of Char;
begin
  FillChar(Buf, SizeOf(Buf), 0);
  GetLocaleInfo(GetUserDefaultLangID, LOCALE_SISO639LANGNAME, Buf, Length(Buf));
  Result := LowerCase(String(Buf));
end;

//------------------------------------------------------------------------------
function UsePortuguese: Boolean;
begin
  case Language_Global of
    1: Result := True;
    2: Result := False;
  else
    Result := (GetLanguageWin = 'pt');
  end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// ids 0..5  = aplicam os textos em um Form (chamar no FormCreate de cada Form)
// ids 10... = mensagens (usar Format(Lang_SRT(n),[...]) quando tiver %d / %s)
//------------------------------------------------------------------------------
function Lang_SRT(id: Integer): String;
begin
  Result := '';

  if UsePortuguese then
  begin

    case id of
  0: begin
     //----------------------------------------------------- Form1 (principal)
     Form1.btnitalico.Hint:='Itálico';
     Form1.btnunderline.Hint:='Sublinhado';
     Form1.btnfonte.Hint:='Cor';
     Form1.btnfundo.Hint:='Fundo de Legenda';
     Form1.btnabrir.Hint:='Abrir...';
     Form1.btnsalvar.Hint:='Salvar';
     Form1.btnsalvarcomo.Hint:='Salvar como...';
     Form1.btnprocurar.Hint:='Processamento de Legenda';
     Form1.btnconsertar.Hint:='Correção de Sobreposição de Diálogos';
     Form1.btneditar.Hint:='Editar';
     Form1.btn_editAvancada.Hint:='Edição Avançada';
     Form1.btn_ortografia.Hint:='Verificar Ortografia';
     Form1.btntags.Hint:='Alterar Cor da Legenda';
     Form1.btntempo.Hint:='Ajuste de Tempo';
     Form1.btnstretch.Hint:='Sincronia Gradativa - Stretch/Shrink';
     Form1.btnfraps.Hint:='Sincronia de Frame Rate - FPS';
     Form1.btnclosecaption.Hint:='Remover Closed Captions';
     Form1.btnnumeros.Hint:='Correção Numérica de Índice';
     Form1.btnrenomear.Hint:='Ajuste de Múltiplas Legendas - Séries';
     Form1.Menu_Arquivo.Caption:='&Arquivo';
     Form1.lstabrir.Caption:='Abrir...                  ';
     Form1.lsteditar.Caption:='Editar';
     Form1.lstsalvar.Caption:='Salvar';
     Form1.lstsalvarcomo.Caption:='Salvar como...';
     Form1.lstrecente.Caption:='Últimas Legendas';
     Form1.lstsair.Caption:='Sair';
     Form1.Menu_Ferramentas.Caption:='&Ferramentas';
     Form1.lstlocalizar.Caption:='Localizar...';
     Form1.lstsubstituir.Caption:='Substituir...';
     Form1.lstprocurar.Caption:='Processamento de Legenda';
     Form1.lstconsertar.Caption:='Correção de Sobreposição de Diálogos';
     Form1.lsttempo.Caption:='Ajuste de Tempo';
     Form1.lststretch.Caption:='Sincronia Gradativa - Stretch/Shrink';
     Form1.lstfraps.Caption:='Sincronia de Frame Rate - FPS';
     Form1.lstclosecaption.Caption:='&Remover Closed Captions';
     Form1.lstnumeros.Caption:='Correção Numérica de Índice';
     Form1.lstrenomear.Caption:='Ajuste de &Múltiplas Legendas - Séries';
     Form1.Menu_Caracter.Caption:='F&onte';
     Form1.lst_editAvancada.Caption:='Edição Avançada       ';
     Form1.lstitalic.Caption:='Itálico';
     Form1.lstunderline.Caption:='Sublinhado';
     Form1.lstfonte.Caption:='Cor';
     Form1.lsttags.Caption:='Alterar &Cor da Legenda';
     Form1.lst_ortografia.Caption:='&Verificar Ortografia';
     Form1.Menu_Idioma.Caption:='&Idioma';
     Form1.Idioma_Auto.Caption:='Automático';
     Form1.Idioma_Por.Caption:='Português';
     Form1.Idioma_Eng.Caption:='English';
     Form1.Menu_Sobre.Caption:='&Informações';
     Form1.Sobre1.Caption:='&Sobre...';
     Form1.Abrir1.Caption:='&Abrir...';
     Form1.Copiar1.Caption:='Copiar';
     Form1.Selecionar1.Caption:='Selecionar tudo';
     Form1.Localizar1.Caption:='Localizar...';
     Form1.SaveDialog1.Title:='Salvar como';
     Form1.OpenDialog1.Filter:='Documento de Legenda (*.srt)|*.srt';
     Form1.SaveDialog1.Filter:='Documento de Legenda (*.srt)|*.srt';
     //-----------------------------------------------------
     Form1.Idioma_Auto.Checked:=(Language_Global = 0);
     Form1.Idioma_Por.Checked :=(Language_Global = 1);
     Form1.Idioma_Eng.Checked :=(Language_Global = 2);
     end;
  1: begin
     //----------------------------------------------------- Form2 (Ajuste de Tempo)
     Form2.Label2.Caption:='Segundos:';
     Form2.Label1.Caption:='Minutos:';
     Form2.Label3.Caption:='Horas:';
     Form2.Label5.Caption:='Milissegundos:';
     Form2.btnCancelar.Caption:='Cancelar';
     Form2.GroupBox3.Caption:=' Ajustar ';
     Form2.RadioTempo.Caption:='Tempo da Legenda';
     Form2.RadioDuracao.Caption:='Duração dos Diálogos';
     Form2.RadioDepois.Caption:='O texto virá depois';
     Form2.RadioAntes.Caption:='O texto virá antes';
     Form2.GroupBox2.Caption:=' Ajuste do tempo: ';
     Form2.GroupBox1.Caption:=' Sobre o texto ';
     end;
  2: begin
     //----------------------------------------------------- Form3 (Stretch/Shrink)
     Form3.Label1.Caption:='Primeiro Diálogo:';
     Form3.Label2.Caption:='Último Diálogo:';
     Form3.btnCancelar.Caption:='Cancelar';
     end;
  3: begin
     //----------------------------------------------------- Form5 (FPS)
     Form5.Label1.Caption:='Frame Rate Atual:';
     Form5.Label2.Caption:='Frame Rate Desejado:';
     Form5.btnCancelar.Caption:='Cancelar';
     Form5.combo_fps_legenda.Hint:='Selecione qual o FPS original da legenda';
     Form5.combo_fps_video.Hint:='Selecione o FPS para o qual deseja converter';
     end;
  4: begin
     //----------------------------------------------------- Form6 (Localizar/Substituir)
     Form6_substituir.Label1.Caption:='L&ocalizar:';
     Form6_substituir.Label2.Caption:='Su&bstituir por:';
     Form6_substituir.btn_localizar.Caption:='&Localizar';
     Form6_substituir.btn_substituir.Caption:='&Substituir';
     Form6_substituir.btn_substituir_tudo.Caption:='Subs&tituir Tudo';
     Form6_substituir.btn_cancelar.Caption:='Fechar';
     Form6_substituir.CheckBox1.Caption:='Diferenciar &maiúsculas de minúsculas';
     Form6_substituir.CheckBox2.Caption:='Marcar &sentenças encontradas';
     Form6_substituir.CheckBox3.Caption:='Coincidir &palavra inteira';
     end;
  5: AboutBox.Caption:='Sobre o SRT Adjuster';
 10: Result:='Será utilizado apenas o primeiro arquivo.';
 11: Result:='O arquivo carregado não é um documento SRT.';
 12: Result:='O documento carregado não possui diálogos no padrão de uma legenda SRT.';
 14: Result:='Foi realizado ajuste em 1 legenda com sucesso!';
 15: Result:='Foram realizados ajustes em %d legendas com sucesso!';
 16: Result:='Não foi necessário realizar ajustes nas legendas encontradas neste diretório!';
 17: Result:='A legenda atual já existe.'+#13+'Deseja substituí-lo?                       ';
 18: Result:='Confirmar';
 19: Result:='Esta legenda possui 1 ocorrência.';
 20: Result:='Esta legenda possui %d ocorrências.';
 21: Result:='Esta legenda não possui nenhum tipo de ocorrência.';
 22: Result:='Sobreposições corrigidas com sucesso!';
 23: Result:='Deseja salvar as alterações realizadas para esta legenda antes de sair?';
 24: Result:='Tem certeza que deseja sobrescrever a legenda original?';
 25: Result:='Deseja agora abrir o vídeo?';
 26: Result:='Correção numérica realizada com sucesso!';
 27: Result:='O arquivo carregado não é um documento de legenda no formato SRT.';
 28: Result:='Alteração de cor realizada com sucesso!';
 29: Result:='Nenhum closed caption encontrado.';
 30: Result:='Os closed captions foram removidos com sucesso!';
 31: Result:='1 Limite de Linha';
 32: Result:='%d Limites de Linha';
 33: Result:='1 Sobreposição';
 34: Result:='%d Sobreposições';
 35: Result:='%d Closed Captions';
 36: Result:='Localizar';
 37: Result:='Substituir';
 38: Result:='Arquivos do dicionário Hunspell não encontrados.';
 39: Result:='Erro ao inicializar Hunspell';
 40: Result:='Certifique-se de que exista apenas um título de Série por diretório para que as legendas sejam ajustadas corretamente.';
 41: Result:='%d Linhas';
 42: Result:='%d Diálogos';
 43: Result:='1 Linha';
 44: Result:='1 Diálogo';
 45: Result:='Ajuste de Tempo';
 46: Result:='Ajuste de Duração';
 47: Result:='Aumentar a duração';
 48: Result:='Diminuir a duração';
 49: Result:=' Ajuste da duração: ';
 50: Result:=' Sobre o diálogo ';
 51: Result:='O texto virá depois';
 52: Result:='O texto virá antes';
 53: Result:=' Ajuste do tempo: ';
 54: Result:=' Sobre o texto ';
 55: Result:='Você está tentando fazer o texto aparecer cedo demais.'+#13+'Algumas linhas de texto (normalmente as primeiras) podem ter valores de tempo NEGATIVOS!'+#13#13+'Isto só pode ser feito APAGANDO estas linhas do arquivo de destino...';
 56: Result:='A duração que você definiu está negativando alguns diálogos.';
 57: Result:='Defina uma duração maior que a definida atualmente...';
 58: Result:='Ajuste de tempo realizado com sucesso, porém foi apagado 1 diálogo.';
 59: Result:='Ajuste de tempo realizado com sucesso, porém foram apagados %d diálogos.';
 60: Result:='Ajuste de tempo realizado com sucesso!';
 61: Result:='Ajuste de duração dos diálogos realizada com sucesso!';
 62: Result:='Neste campo você deverá informar o tempo inicial do PRIMEIRO diálogo da legenda.'+#13#13+'ATENÇÃO:'+#13+'Não confunda o diálogo com informações de créditos em cima de criação/sincronia da legenda.';
 63: Result:='Neste campo você deverá informar o tempo inicial do ÚLTIMO diálogo da legenda.'+#13#13+'ATENÇÃO:'+#13+'Não confunda o diálogo com informações de créditos em cima de criação/sincronia da legenda.';
 64: Result:='O valor de tempo informado em PRIMEIRO DIÁLOGO é inválido!'+#13+'Defina um valor inferior ao formato máximo de 24h.'+#13#13+'Error code:  #0301';
 65: Result:='O valor de tempo informado em ÚLTIMO DIÁLOGO é inválido!'+#13+'Defina um valor inferior ao formato máximo de 24h.'+#13#13+'Error code:  #0302';
 66: Result:='O valor de tempo informado em PRIMEIRO DIÁLOGO é inválido!'+#13+'Defina um valor de tempo INFERIOR ao do ÚLTIMO DIÁLOGO.'+#13#13+'Error code:  #0303';
 67: Result:='O valor de tempo informado em ÚLTIMO DIÁLOGO é inválido!'+#13+'Defina um valor de tempo SUPERIOR ao do PRIMEIRO DIÁLOGO.'+#13#13+'Error code:  #0304';
 68: Result:='Sincronia Gradativa - Stretch/Shrink';
 69: Result:='Sincronia gradativa realizada com sucesso!';
 70: Result:='Sincronia de Frame Rate - FPS';
 71: Result:='Sincronia de Frame Rate realizada com sucesso!';
 72: Result:='Neste campo você deverá informar a TAXA DE QUADROS do video que deseja sincronizar.'+#13#13+'Verifique as propriedades do arquivo de video para conseguir esta informação.';
 73: Result:='Neste campo você deverá informar para qual TAXA DE QUADROS que deseja converter, após informar anteriormente o Frame Rate Atual do arquivo de video.';
 74: Result:='marcação';
 75: Result:='marcações';
 76: Result:='substituição';
 77: Result:='substituições';
 78: Result:='Não foi possível encontrar "%s"';
 79: Result:='Foi realizada %d %s em toda a legenda.';
 80: Result:='Foram realizadas %d %s em toda a legenda.';
 81: Result:='&Localizar Próxima';
 82: Result:='&Substituir Próxima';
 83: Result:='&Localizar';
 84: Result:='&Substituir';
 85: Result:='Localizar e &Marcar';
 86: Result:='Versão %s'+#13+'JMBA Softwares 2004, 2026';
 87: Result:='Foram localizados %d arquivos de legenda e video de uma Série.'+#13#13+'Deseja ajustar as legendas?';
 88: Result:='Foi localizado uma legenda com repetição de temporada e episódio neste diretório.'+#13#13+'Verifique as legendas com %s antes de prosseguir.';
 89: Result:='A quantidade de EPISÓDIOS está superior ao de seus arquivos de legenda.'+#13+'Verifique antes de prosseguir.'+#13#13+'Episódios: %d arquivos'+#13+'Legendas: %d arquivos';
 90: Result:='A quantidade de LEGENDAS está superior ao de seus arquivos de video.'+#13+'Verifique antes de prosseguir.'+#13#13+'Episódios: %d arquivos'+#13+'Legendas: %d arquivos';
 91: Result:='Não foi possível localizar nenhum arquivo de legenda ou video de uma Série no formato padrão neste diretório.';
 92: Result:='Não foi possível aplicar a formatação de texto desejada.'+#13+'Remova a atual antes de adicionar outra ou verifique se selecionou corretamente o texto desejado.';
 93: Result:='Não foi possível aplicar a formatação de cores no texto desejado.'+#13+'Remova a atual antes de adicionar outra ou verifique se selecionou corretamente o texto desejado.';
 94: Result:='© 2026 JMBA Softwares. Todos os direitos reservados.';
    end;

  end
  else
  begin

    case id of
  0: begin
     //----------------------------------------------------- Form1 (principal)
     Form1.btnitalico.Hint:='Italic';
     Form1.btnunderline.Hint:='Underline';
     Form1.btnfonte.Hint:='Color';
     Form1.btnfundo.Hint:='Subtitle Background';
     Form1.btnabrir.Hint:='Open...';
     Form1.btnsalvar.Hint:='Save';
     Form1.btnsalvarcomo.Hint:='Save as...';
     Form1.btnprocurar.Hint:='Subtitle Processing';
     Form1.btnconsertar.Hint:='Dialogue Overlap Fix';
     Form1.btneditar.Hint:='Edit';
     Form1.btn_editAvancada.Hint:='Advanced Editing';
     Form1.btn_ortografia.Hint:='Spell Check';
     Form1.btntags.Hint:='Change Subtitle Color';
     Form1.btntempo.Hint:='Time Adjustment';
     Form1.btnstretch.Hint:='Gradual Sync - Stretch/Shrink';
     Form1.btnfraps.Hint:='Frame Rate Sync - FPS';
     Form1.btnclosecaption.Hint:='Remove Closed Captions';
     Form1.btnnumeros.Hint:='Numeric Index Correction';
     Form1.btnrenomear.Hint:='Multiple Subtitles Adjustment - Series';
     Form1.Menu_Arquivo.Caption:='&File';
     Form1.lstabrir.Caption:='Open...                  ';
     Form1.lsteditar.Caption:='Edit';
     Form1.lstsalvar.Caption:='Save';
     Form1.lstsalvarcomo.Caption:='Save as...';
     Form1.lstrecente.Caption:='Recent Subtitles';
     Form1.lstsair.Caption:='Exit';
     Form1.Menu_Ferramentas.Caption:='&Tools';
     Form1.lstlocalizar.Caption:='Find...';
     Form1.lstsubstituir.Caption:='Replace...';
     Form1.lstprocurar.Caption:='Subtitle Processing';
     Form1.lstconsertar.Caption:='Dialogue Overlap Fix';
     Form1.lsttempo.Caption:='Time Adjustment';
     Form1.lststretch.Caption:='Gradual Sync - Stretch/Shrink';
     Form1.lstfraps.Caption:='Frame Rate Sync - FPS';
     Form1.lstclosecaption.Caption:='&Remove Closed Captions';
     Form1.lstnumeros.Caption:='Numeric Index Correction';
     Form1.lstrenomear.Caption:='&Multiple Subtitles Adjustment - Series';
     Form1.Menu_Caracter.Caption:='F&ont';
     Form1.lst_editAvancada.Caption:='Advanced Editing       ';
     Form1.lstitalic.Caption:='Italic';
     Form1.lstunderline.Caption:='Underline';
     Form1.lstfonte.Caption:='Color';
     Form1.lsttags.Caption:='Change Subtitle &Color';
     Form1.lst_ortografia.Caption:='&Spell Check';
     Form1.Menu_Idioma.Caption:='&Language';
     Form1.Idioma_Auto.Caption:='Automatic';
     Form1.Idioma_Por.Caption:='Português';
     Form1.Idioma_Eng.Caption:='English';
     Form1.Menu_Sobre.Caption:='&Information';
     Form1.Sobre1.Caption:='&About...';
     Form1.Abrir1.Caption:='&Open...';
     Form1.Copiar1.Caption:='Copy';
     Form1.Selecionar1.Caption:='Select all';
     Form1.Localizar1.Caption:='Find...';
     Form1.SaveDialog1.Title:='Save as';
     Form1.OpenDialog1.Filter:='Subtitle Document (*.srt)|*.srt';
     Form1.SaveDialog1.Filter:='Subtitle Document (*.srt)|*.srt';
     //-----------------------------------------------------
     Form1.Idioma_Auto.Checked:=(Language_Global = 0);
     Form1.Idioma_Por.Checked :=(Language_Global = 1);
     Form1.Idioma_Eng.Checked :=(Language_Global = 2);
     end;
  1: begin
     //----------------------------------------------------- Form2 (Ajuste de Tempo)
     Form2.Label2.Caption:='Seconds:';
     Form2.Label1.Caption:='Minutes:';
     Form2.Label3.Caption:='Hours:';
     Form2.Label5.Caption:='Milliseconds:';
     Form2.btnCancelar.Caption:='Cancel';
     Form2.GroupBox3.Caption:=' Adjust ';
     Form2.RadioTempo.Caption:='Subtitle Time';
     Form2.RadioDuracao.Caption:='Dialogue Duration';
     Form2.RadioDepois.Caption:='The text will come later';
     Form2.RadioAntes.Caption:='The text will come earlier';
     Form2.GroupBox2.Caption:=' Time adjustment: ';
     Form2.GroupBox1.Caption:=' About the text ';
     end;
  2: begin
     //----------------------------------------------------- Form3 (Stretch/Shrink)
     Form3.Label1.Caption:='First Dialogue:';
     Form3.Label2.Caption:='Last Dialogue:';
     Form3.btnCancelar.Caption:='Cancel';
     end;
  3: begin
     //----------------------------------------------------- Form5 (FPS)
     Form5.Label1.Caption:='Current Frame Rate:';
     Form5.Label2.Caption:='Desired Frame Rate:';
     Form5.btnCancelar.Caption:='Cancel';
     Form5.combo_fps_legenda.Hint:='Select the original FPS of the subtitle';
     Form5.combo_fps_video.Hint:='Select the FPS you want to convert to';
     end;
  4: begin
     //----------------------------------------------------- Form6 (Localizar/Substituir)
     Form6_substituir.Label1.Caption:='F&ind what:';
     Form6_substituir.Label2.Caption:='Replace &with:';
     Form6_substituir.btn_localizar.Caption:='&Find';
     Form6_substituir.btn_substituir.Caption:='&Replace';
     Form6_substituir.btn_substituir_tudo.Caption:='Replace &All';
     Form6_substituir.btn_cancelar.Caption:='Close';
     Form6_substituir.CheckBox1.Caption:='Match &case';
     Form6_substituir.CheckBox2.Caption:='Mark found &sentences';
     Form6_substituir.CheckBox3.Caption:='Match &whole word';
     end;
  5: AboutBox.Caption:='About SRT Adjuster';
 10: Result:='Only the first file will be used.';
 11: Result:='The loaded file is not an SRT document.';
 12: Result:='The loaded document has no dialogues in the SRT subtitle format.';
 14: Result:='1 subtitle was adjusted successfully!';
 15: Result:='%d subtitles were adjusted successfully!';
 16: Result:='No adjustments were needed for the subtitles found in this folder!';
 17: Result:='The current subtitle already exists.'+#13+'Do you want to replace it?                       ';
 18: Result:='Confirm';
 19: Result:='This subtitle has 1 occurrence.';
 20: Result:='This subtitle has %d occurrences.';
 21: Result:='This subtitle has no occurrences of any kind.';
 22: Result:='Overlaps fixed successfully!';
 23: Result:='Do you want to save the changes made to this subtitle before exiting?';
 24: Result:='Are you sure you want to overwrite the original subtitle?';
 25: Result:='Do you want to open the video now?';
 26: Result:='Numeric index correction completed successfully!';
 27: Result:='The loaded file is not a subtitle document in SRT format.';
 28: Result:='Color change completed successfully!';
 29: Result:='No closed captions found.';
 30: Result:='Closed captions were removed successfully!';
 31: Result:='1 Line Limit';
 32: Result:='%d Line Limits';
 33: Result:='1 Overlap';
 34: Result:='%d Overlaps';
 35: Result:='%d Closed Captions';
 36: Result:='Find';
 37: Result:='Replace';
 38: Result:='Hunspell dictionary files not found.';
 39: Result:='Error initializing Hunspell';
 40: Result:='Make sure there is only one Series title per folder so the subtitles are adjusted correctly.';
 41: Result:='%d Lines';
 42: Result:='%d Dialogues';
 43: Result:='1 Line';
 44: Result:='1 Dialogue';
 45: Result:='Time Adjustment';
 46: Result:='Duration Adjustment';
 47: Result:='Increase the duration';
 48: Result:='Decrease the duration';
 49: Result:=' Duration adjustment: ';
 50: Result:=' About the dialogue ';
 51: Result:='The text will come later';
 52: Result:='The text will come earlier';
 53: Result:=' Time adjustment: ';
 54: Result:=' About the text ';
 55: Result:='You are trying to make the text appear too early.'+#13+'Some lines of text (usually the first ones) may have NEGATIVE time values!'+#13#13+'This can only be done by DELETING these lines from the target file...';
 56: Result:='The duration you set is making some dialogues negative.';
 57: Result:='Set a duration longer than the current one...';
 58: Result:='Time adjustment completed successfully, but 1 dialogue was deleted.';
 59: Result:='Time adjustment completed successfully, but %d dialogues were deleted.';
 60: Result:='Time adjustment completed successfully!';
 61: Result:='Dialogue duration adjustment completed successfully!';
 62: Result:='In this field, enter the start time of the FIRST dialogue of the subtitle.'+#13#13+'WARNING:'+#13+'Do not confuse the dialogue with credits information about the creation/sync of the subtitle.';
 63: Result:='In this field, enter the start time of the LAST dialogue of the subtitle.'+#13#13+'WARNING:'+#13+'Do not confuse the dialogue with credits information about the creation/sync of the subtitle.';
 64: Result:='The time value entered in FIRST DIALOGUE is invalid!'+#13+'Set a value below the 24h maximum format.'+#13#13+'Error code:  #0301';
 65: Result:='The time value entered in LAST DIALOGUE is invalid!'+#13+'Set a value below the 24h maximum format.'+#13#13+'Error code:  #0302';
 66: Result:='The time value entered in FIRST DIALOGUE is invalid!'+#13+'Set a time value EARLIER than the LAST DIALOGUE.'+#13#13+'Error code:  #0303';
 67: Result:='The time value entered in LAST DIALOGUE is invalid!'+#13+'Set a time value LATER than the FIRST DIALOGUE.'+#13#13+'Error code:  #0304';
 68: Result:='Gradual Sync - Stretch/Shrink';
 69: Result:='Gradual sync completed successfully!';
 70: Result:='Frame Rate Sync - FPS';
 71: Result:='Frame Rate sync completed successfully!';
 72: Result:='In this field, enter the FRAME RATE of the video you want to sync.'+#13#13+'Check the video file properties to get this information.';
 73: Result:='In this field, enter the FRAME RATE you want to convert to, after entering the current Frame Rate of the video file.';
 74: Result:='marking';
 75: Result:='markings';
 76: Result:='replacement';
 77: Result:='replacements';
 78: Result:='Could not find "%s"';
 79: Result:='%d %s made throughout the subtitle.';
 80: Result:='%d %s made throughout the subtitle.';
 81: Result:='&Find Next';
 82: Result:='&Replace Next';
 83: Result:='&Find';
 84: Result:='&Replace';
 85: Result:='Find and &Mark';
 86: Result:='Version %s'+#13+'JMBA Softwares 2004, 2026';
 87: Result:='%d subtitle and video files of a Series were found.'+#13#13+'Do you want to adjust the subtitles?';
 88: Result:='A subtitle with a repeated season and episode was found in this folder.'+#13#13+'Check the subtitles with %s before proceeding.';
 89: Result:='The number of EPISODES is greater than the number of subtitle files.'+#13+'Check before proceeding.'+#13#13+'Episodes: %d files'+#13+'Subtitles: %d files';
 90: Result:='The number of SUBTITLES is greater than the number of video files.'+#13+'Check before proceeding.'+#13#13+'Episodes: %d files'+#13+'Subtitles: %d files';
 91: Result:='No subtitle or video files of a Series in the standard format were found in this folder.';
 92: Result:='Could not apply the desired text formatting.'+#13+'Remove the current one before adding another, or check that you selected the desired text correctly.';
 93: Result:='Could not apply the color formatting to the desired text.'+#13+'Remove the current one before adding another, or check that you selected the desired text correctly.';
 94: Result:='© 2026 JMBA Softwares. All rights reserved.';
    end;

  end;
end;

//------------------------------------------------------------------------------
// Persistencia da escolha (mesmo .ini do programa)
//------------------------------------------------------------------------------
procedure Lang_Load;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    Language_Global := Ini.ReadInteger('SRT_Language', 'Language', 0);
  finally
    Ini.Free;
  end;
end;

procedure Lang_Save;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    Ini.WriteInteger('SRT_Language', 'Language', Language_Global);
  finally
    Ini.Free;
  end;
end;

//------------------------------------------------------------------------------
// Troca o idioma em tempo de execucao (Form1 e Form6 ficam sempre criados;
// Form2, Form3, Form5 e About pegam o idioma novo na proxima vez que abrirem)
//------------------------------------------------------------------------------
procedure Lang_Apply(NewLang: Integer);
begin
  Language_Global := NewLang;
  Lang_Save;
  Lang_SRT(0);
  if Assigned(Form6_substituir) then Lang_SRT(4);
end;

end.
