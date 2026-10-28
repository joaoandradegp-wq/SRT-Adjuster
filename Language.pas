unit Language;

interface

uses SysUtils, Windows, IniFiles, Forms;

var
  // 0 = Automatico (idioma do Windows) | 1 = Portugues | 2 = English
  // 3 = Espanol | 4 = Italiano | 5 = Frances
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
// Retorna o idioma efetivamente em uso (1=pt, 2=en, 3=es, 4=it, 5=fr).
// No modo Automatico segue o idioma do Windows; qualquer outro vira English.
//------------------------------------------------------------------------------
function ActiveLang: Integer;
var
  S: String;
begin
  if (Language_Global >= 1) and (Language_Global <= 5) then
  begin
    Result := Language_Global;
    Exit;
  end;

  S := GetLanguageWin;
  if S = 'pt' then Result := 1
  else if S = 'es' then Result := 3
  else if S = 'it' then Result := 4
  else if S = 'fr' then Result := 5
  else Result := 2;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// ids 0..5  = aplicam os textos em um Form (chamar no FormCreate de cada Form)
// ids 10... = mensagens (usar Format(Lang_SRT(n),[...]) quando tiver %d / %s)
//------------------------------------------------------------------------------
function Lang_SRT(id: Integer): String;
begin
  Result := '';

  case ActiveLang of
  1: begin
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
     Form1.lstrenomear.Caption:='Ajuste de &Múltiplas Legendas';
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
     Form1.Idioma_Esp.Caption:='Español';
     Form1.Idioma_Ita.Caption:='Italiano';
     Form1.Idioma_Fra.Caption:='Français';
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
     Form1.Idioma_Esp.Checked :=(Language_Global = 3);
     Form1.Idioma_Ita.Checked :=(Language_Global = 4);
     Form1.Idioma_Fra.Checked :=(Language_Global = 5);
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
 95: Result:='1 Closed Caption';
 96: Result:='%d Closed Captions';
    end;
  end;
  3: begin
    case id of
  0: begin
     //----------------------------------------------------- Form1 (principal)
     Form1.btnitalico.Hint:='Cursiva';
     Form1.btnunderline.Hint:='Subrayado';
     Form1.btnfonte.Hint:='Color';
     Form1.btnfundo.Hint:='Fondo del subtítulo';
     Form1.btnabrir.Hint:='Abrir...';
     Form1.btnsalvar.Hint:='Guardar';
     Form1.btnsalvarcomo.Hint:='Guardar como...';
     Form1.btnprocurar.Hint:='Procesamiento de subtítulos';
     Form1.btnconsertar.Hint:='Corrección de superposición de diálogos';
     Form1.btneditar.Hint:='Editar';
     Form1.btn_editAvancada.Hint:='Edición avanzada';
     Form1.btn_ortografia.Hint:='Verificar ortografía';
     Form1.btntags.Hint:='Cambiar color del subtítulo';
     Form1.btntempo.Hint:='Ajuste de tiempo';
     Form1.btnstretch.Hint:='Sincronización gradual - Stretch/Shrink';
     Form1.btnfraps.Hint:='Sincronización de Frame Rate - FPS';
     Form1.btnclosecaption.Hint:='Quitar Closed Captions';
     Form1.btnnumeros.Hint:='Corrección numérica de índice';
     Form1.btnrenomear.Hint:='Ajuste de múltiples subtítulos - Series';
     Form1.Menu_Arquivo.Caption:='&Archivo';
     Form1.lstabrir.Caption:='Abrir...                  ';
     Form1.lsteditar.Caption:='Editar';
     Form1.lstsalvar.Caption:='Guardar';
     Form1.lstsalvarcomo.Caption:='Guardar como...';
     Form1.lstrecente.Caption:='Últimos subtítulos';
     Form1.lstsair.Caption:='Salir';
     Form1.Menu_Ferramentas.Caption:='&Herramientas';
     Form1.lstlocalizar.Caption:='Buscar...';
     Form1.lstsubstituir.Caption:='Reemplazar...';
     Form1.lstprocurar.Caption:='Procesamiento de subtítulos';
     Form1.lstconsertar.Caption:='Corrección de superposición de diálogos';
     Form1.lsttempo.Caption:='Ajuste de tiempo';
     Form1.lststretch.Caption:='Sincronización gradual - Stretch/Shrink';
     Form1.lstfraps.Caption:='Sincronización de Frame Rate - FPS';
     Form1.lstclosecaption.Caption:='&Quitar Closed Captions';
     Form1.lstnumeros.Caption:='Corrección numérica de índice';
     Form1.lstrenomear.Caption:='Ajuste de &múltiples subtítulos';
     Form1.Menu_Caracter.Caption:='Fue&nte';
     Form1.lst_editAvancada.Caption:='Edición avanzada       ';
     Form1.lstitalic.Caption:='Cursiva';
     Form1.lstunderline.Caption:='Subrayado';
     Form1.lstfonte.Caption:='Color';
     Form1.lsttags.Caption:='Cambiar &color del subtítulo';
     Form1.lst_ortografia.Caption:='&Verificar ortografía';
     Form1.Menu_Idioma.Caption:='&Idioma';
     Form1.Idioma_Auto.Caption:='Automático';
     Form1.Idioma_Por.Caption:='Português';
     Form1.Idioma_Eng.Caption:='English';
     Form1.Idioma_Esp.Caption:='Español';
     Form1.Idioma_Ita.Caption:='Italiano';
     Form1.Idioma_Fra.Caption:='Français';
     Form1.Menu_Sobre.Caption:='&Información';
     Form1.Sobre1.Caption:='&Acerca de...';
     Form1.Abrir1.Caption:='&Abrir...';
     Form1.Copiar1.Caption:='Copiar';
     Form1.Selecionar1.Caption:='Seleccionar todo';
     Form1.Localizar1.Caption:='Buscar...';
     Form1.SaveDialog1.Title:='Guardar como';
     Form1.OpenDialog1.Filter:='Documento de subtítulos (*.srt)|*.srt';
     Form1.SaveDialog1.Filter:='Documento de subtítulos (*.srt)|*.srt';
     //-----------------------------------------------------
     Form1.Idioma_Auto.Checked:=(Language_Global = 0);
     Form1.Idioma_Por.Checked :=(Language_Global = 1);
     Form1.Idioma_Eng.Checked :=(Language_Global = 2);
     Form1.Idioma_Esp.Checked :=(Language_Global = 3);
     Form1.Idioma_Ita.Checked :=(Language_Global = 4);
     Form1.Idioma_Fra.Checked :=(Language_Global = 5);
     end;
  1: begin
     //----------------------------------------------------- Form2 (Ajuste de Tempo)
     Form2.Label2.Caption:='Segundos:';
     Form2.Label1.Caption:='Minutos:';
     Form2.Label3.Caption:='Horas:';
     Form2.Label5.Caption:='Milisegundos:';
     Form2.btnCancelar.Caption:='Cancelar';
     Form2.GroupBox3.Caption:=' Ajustar ';
     Form2.RadioTempo.Caption:='Tiempo del subtítulo';
     Form2.RadioDuracao.Caption:='Duración de los diálogos';
     Form2.RadioDepois.Caption:='El texto aparecerá después';
     Form2.RadioAntes.Caption:='El texto aparecerá antes';
     Form2.GroupBox2.Caption:=' Ajuste del tiempo: ';
     Form2.GroupBox1.Caption:=' Sobre el texto ';
     end;
  2: begin
     //----------------------------------------------------- Form3 (Stretch/Shrink)
     Form3.Label1.Caption:='Primer diálogo:';
     Form3.Label2.Caption:='Último diálogo:';
     Form3.btnCancelar.Caption:='Cancelar';
     end;
  3: begin
     //----------------------------------------------------- Form5 (FPS)
     Form5.Label1.Caption:='Frame Rate actual:';
     Form5.Label2.Caption:='Frame Rate deseado:';
     Form5.btnCancelar.Caption:='Cancelar';
     Form5.combo_fps_legenda.Hint:='Seleccione el FPS original del subtítulo';
     Form5.combo_fps_video.Hint:='Seleccione el FPS al que desea convertir';
     end;
  4: begin
     //----------------------------------------------------- Form6 (Localizar/Substituir)
     Form6_substituir.Label1.Caption:='Bus&car:';
     Form6_substituir.Label2.Caption:='Reempla&zar por:';
     Form6_substituir.btn_localizar.Caption:='&Buscar';
     Form6_substituir.btn_substituir.Caption:='&Reemplazar';
     Form6_substituir.btn_substituir_tudo.Caption:='Reemplazar &todo';
     Form6_substituir.btn_cancelar.Caption:='Cerrar';
     Form6_substituir.CheckBox1.Caption:='Distinguir &mayúsculas de minúsculas';
     Form6_substituir.CheckBox2.Caption:='Marcar &frases encontradas';
     Form6_substituir.CheckBox3.Caption:='Coincidir &palabra completa';
     end;
  5: AboutBox.Caption:='Acerca de SRT Adjuster';
 10: Result:='Solo se utilizará el primer archivo.';
 11: Result:='El archivo cargado no es un documento SRT.';
 12: Result:='El documento cargado no contiene diálogos con el formato de un subtítulo SRT.';
 14: Result:='¡Se ajustó 1 subtítulo con éxito!';
 15: Result:='¡Se ajustaron %d subtítulos con éxito!';
 16: Result:='¡No fue necesario realizar ajustes en los subtítulos encontrados en este directorio!';
 17: Result:='El subtítulo actual ya existe.'+#13+'¿Desea reemplazarlo?                       ';
 18: Result:='Confirmar';
 19: Result:='Este subtítulo tiene 1 ocurrencia.';
 20: Result:='Este subtítulo tiene %d ocurrencias.';
 21: Result:='Este subtítulo no tiene ningún tipo de ocurrencia.';
 22: Result:='¡Superposiciones corregidas con éxito!';
 23: Result:='¿Desea guardar los cambios realizados en este subtítulo antes de salir?';
 24: Result:='¿Está seguro de que desea sobrescribir el subtítulo original?';
 25: Result:='¿Desea abrir ahora el video?';
 26: Result:='¡Corrección numérica realizada con éxito!';
 27: Result:='El archivo cargado no es un documento de subtítulos en formato SRT.';
 28: Result:='¡Cambio de color realizado con éxito!';
 29: Result:='No se encontró ningún closed caption.';
 30: Result:='¡Los closed captions se eliminaron con éxito!';
 31: Result:='1 Límite de línea';
 32: Result:='%d Límites de línea';
 33: Result:='1 Superposición';
 34: Result:='%d Superposiciones';
 35: Result:='%d Closed Captions';
 36: Result:='Buscar';
 37: Result:='Reemplazar';
 38: Result:='No se encontraron los archivos del diccionario Hunspell.';
 39: Result:='Error al inicializar Hunspell';
 40: Result:='Asegúrese de que exista solo un título de serie por directorio para que los subtítulos se ajusten correctamente.';
 41: Result:='%d Líneas';
 42: Result:='%d Diálogos';
 43: Result:='1 Línea';
 44: Result:='1 Diálogo';
 45: Result:='Ajuste de tiempo';
 46: Result:='Ajuste de duración';
 47: Result:='Aumentar la duración';
 48: Result:='Disminuir la duración';
 49: Result:=' Ajuste de la duración: ';
 50: Result:=' Sobre el diálogo ';
 51: Result:='El texto aparecerá después';
 52: Result:='El texto aparecerá antes';
 53: Result:=' Ajuste del tiempo: ';
 54: Result:=' Sobre el texto ';
 55: Result:='Está intentando que el texto aparezca demasiado pronto.'+#13+'¡Algunas líneas de texto (normalmente las primeras) pueden tener valores de tiempo NEGATIVOS!'+#13#13+'Esto solo se puede hacer ELIMINANDO estas líneas del archivo de destino...';
 56: Result:='La duración que definió está haciendo negativos algunos diálogos.';
 57: Result:='Defina una duración mayor que la definida actualmente...';
 58: Result:='Ajuste de tiempo realizado con éxito, pero se eliminó 1 diálogo.';
 59: Result:='Ajuste de tiempo realizado con éxito, pero se eliminaron %d diálogos.';
 60: Result:='¡Ajuste de tiempo realizado con éxito!';
 61: Result:='¡Ajuste de la duración de los diálogos realizado con éxito!';
 62: Result:='En este campo debe indicar el tiempo inicial del PRIMER diálogo del subtítulo.'+#13#13+'ATENCIÓN:'+#13+'No confunda el diálogo con la información de créditos sobre la creación/sincronización del subtítulo.';
 63: Result:='En este campo debe indicar el tiempo inicial del ÚLTIMO diálogo del subtítulo.'+#13#13+'ATENCIÓN:'+#13+'No confunda el diálogo con la información de créditos sobre la creación/sincronización del subtítulo.';
 64: Result:='¡El valor de tiempo indicado en PRIMER DIÁLOGO no es válido!'+#13+'Defina un valor inferior al formato máximo de 24 h.'+#13#13+'Error code:  #0301';
 65: Result:='¡El valor de tiempo indicado en ÚLTIMO DIÁLOGO no es válido!'+#13+'Defina un valor inferior al formato máximo de 24 h.'+#13#13+'Error code:  #0302';
 66: Result:='¡El valor de tiempo indicado en PRIMER DIÁLOGO no es válido!'+#13+'Defina un valor de tiempo INFERIOR al del ÚLTIMO DIÁLOGO.'+#13#13+'Error code:  #0303';
 67: Result:='¡El valor de tiempo indicado en ÚLTIMO DIÁLOGO no es válido!'+#13+'Defina un valor de tiempo SUPERIOR al del PRIMER DIÁLOGO.'+#13#13+'Error code:  #0304';
 68: Result:='Sincronización gradual - Stretch/Shrink';
 69: Result:='¡Sincronización gradual realizada con éxito!';
 70: Result:='Sincronización de Frame Rate - FPS';
 71: Result:='¡Sincronización de Frame Rate realizada con éxito!';
 72: Result:='En este campo debe indicar la TASA DE FOTOGRAMAS del video que desea sincronizar.'+#13#13+'Consulte las propiedades del archivo de video para obtener esta información.';
 73: Result:='En este campo debe indicar a qué TASA DE FOTOGRAMAS desea convertir, después de indicar el Frame Rate actual del archivo de video.';
 74: Result:='marcación';
 75: Result:='marcaciones';
 76: Result:='sustitución';
 77: Result:='sustituciones';
 78: Result:='No se pudo encontrar "%s"';
 79: Result:='Se realizó %d %s en todo el subtítulo.';
 80: Result:='Se realizaron %d %s en todo el subtítulo.';
 81: Result:='&Buscar siguiente';
 82: Result:='&Reemplazar siguiente';
 83: Result:='&Buscar';
 84: Result:='&Reemplazar';
 85: Result:='Buscar y &marcar';
 86: Result:='Versión %s'+#13+'JMBA Softwares 2004, 2026';
 87: Result:='Se encontraron %d archivos de subtítulos y video de una serie.'+#13#13+'¿Desea ajustar los subtítulos?';
 88: Result:='Se encontró un subtítulo con temporada y episodio repetidos en este directorio.'+#13#13+'Revise los subtítulos con %s antes de continuar.';
 89: Result:='La cantidad de EPISODIOS es mayor que la de sus archivos de subtítulos.'+#13+'Revise antes de continuar.'+#13#13+'Episodios: %d archivos'+#13+'Subtítulos: %d archivos';
 90: Result:='La cantidad de SUBTÍTULOS es mayor que la de sus archivos de video.'+#13+'Revise antes de continuar.'+#13#13+'Episodios: %d archivos'+#13+'Subtítulos: %d archivos';
 91: Result:='No se encontró ningún archivo de subtítulos o video de una serie en el formato estándar en este directorio.';
 92: Result:='No se pudo aplicar el formato de texto deseado.'+#13+'Elimine el actual antes de agregar otro o verifique que haya seleccionado correctamente el texto deseado.';
 93: Result:='No se pudo aplicar el formato de color al texto deseado.'+#13+'Elimine el actual antes de agregar otro o verifique que haya seleccionado correctamente el texto deseado.';
 94: Result:='© 2026 JMBA Softwares. Todos los derechos reservados.';
 95: Result:='1 Closed Caption';
 96: Result:='%d Closed Captions';
    end;
  end;
  4: begin
    case id of
  0: begin
     //----------------------------------------------------- Form1 (principal)
     Form1.btnitalico.Hint:='Corsivo';
     Form1.btnunderline.Hint:='Sottolineato';
     Form1.btnfonte.Hint:='Colore';
     Form1.btnfundo.Hint:='Sfondo del sottotitolo';
     Form1.btnabrir.Hint:='Apri...';
     Form1.btnsalvar.Hint:='Salva';
     Form1.btnsalvarcomo.Hint:='Salva con nome...';
     Form1.btnprocurar.Hint:='Elaborazione sottotitoli';
     Form1.btnconsertar.Hint:='Correzione sovrapposizione dei dialoghi';
     Form1.btneditar.Hint:='Modifica';
     Form1.btn_editAvancada.Hint:='Modifica avanzata';
     Form1.btn_ortografia.Hint:='Controllo ortografico';
     Form1.btntags.Hint:='Cambia colore del sottotitolo';
     Form1.btntempo.Hint:='Regolazione del tempo';
     Form1.btnstretch.Hint:='Sincronizzazione graduale - Stretch/Shrink';
     Form1.btnfraps.Hint:='Sincronizzazione Frame Rate - FPS';
     Form1.btnclosecaption.Hint:='Rimuovi Closed Captions';
     Form1.btnnumeros.Hint:='Correzione numerica dell''indice';
     Form1.btnrenomear.Hint:='Regolazione di sottotitoli multipli';
     Form1.Menu_Arquivo.Caption:='&File';
     Form1.lstabrir.Caption:='Apri...                  ';
     Form1.lsteditar.Caption:='Modifica';
     Form1.lstsalvar.Caption:='Salva';
     Form1.lstsalvarcomo.Caption:='Salva con nome...';
     Form1.lstrecente.Caption:='Ultimi sottotitoli';
     Form1.lstsair.Caption:='Esci';
     Form1.Menu_Ferramentas.Caption:='&Strumenti';
     Form1.lstlocalizar.Caption:='Trova...';
     Form1.lstsubstituir.Caption:='Sostituisci...';
     Form1.lstprocurar.Caption:='Elaborazione sottotitoli';
     Form1.lstconsertar.Caption:='Correzione sovrapposizione dei dialoghi';
     Form1.lsttempo.Caption:='Regolazione del tempo';
     Form1.lststretch.Caption:='Sincronizzazione graduale - Stretch/Shrink';
     Form1.lstfraps.Caption:='Sincronizzazione Frame Rate - FPS';
     Form1.lstclosecaption.Caption:='&Rimuovi Closed Captions';
     Form1.lstnumeros.Caption:='Correzione numerica dell''indice';
     Form1.lstrenomear.Caption:='Regolazione di sottotitoli &multipli';
     Form1.Menu_Caracter.Caption:='C&arattere';
     Form1.lst_editAvancada.Caption:='Modifica avanzata       ';
     Form1.lstitalic.Caption:='Corsivo';
     Form1.lstunderline.Caption:='Sottolineato';
     Form1.lstfonte.Caption:='Colore';
     Form1.lsttags.Caption:='Cambia &colore del sottotitolo';
     Form1.lst_ortografia.Caption:='&Controllo ortografico';
     Form1.Menu_Idioma.Caption:='&Lingua';
     Form1.Idioma_Auto.Caption:='Automatico';
     Form1.Idioma_Por.Caption:='Português';
     Form1.Idioma_Eng.Caption:='English';
     Form1.Idioma_Esp.Caption:='Español';
     Form1.Idioma_Ita.Caption:='Italiano';
     Form1.Idioma_Fra.Caption:='Français';
     Form1.Menu_Sobre.Caption:='&Informazioni';
     Form1.Sobre1.Caption:='&Informazioni su...';
     Form1.Abrir1.Caption:='&Apri...';
     Form1.Copiar1.Caption:='Copia';
     Form1.Selecionar1.Caption:='Seleziona tutto';
     Form1.Localizar1.Caption:='Trova...';
     Form1.SaveDialog1.Title:='Salva con nome';
     Form1.OpenDialog1.Filter:='Documento di sottotitoli (*.srt)|*.srt';
     Form1.SaveDialog1.Filter:='Documento di sottotitoli (*.srt)|*.srt';
     //-----------------------------------------------------
     Form1.Idioma_Auto.Checked:=(Language_Global = 0);
     Form1.Idioma_Por.Checked :=(Language_Global = 1);
     Form1.Idioma_Eng.Checked :=(Language_Global = 2);
     Form1.Idioma_Esp.Checked :=(Language_Global = 3);
     Form1.Idioma_Ita.Checked :=(Language_Global = 4);
     Form1.Idioma_Fra.Checked :=(Language_Global = 5);
     end;
  1: begin
     //----------------------------------------------------- Form2 (Ajuste de Tempo)
     Form2.Label2.Caption:='Secondi:';
     Form2.Label1.Caption:='Minuti:';
     Form2.Label3.Caption:='Ore:';
     Form2.Label5.Caption:='Millisecondi:';
     Form2.btnCancelar.Caption:='Annulla';
     Form2.GroupBox3.Caption:=' Regola ';
     Form2.RadioTempo.Caption:='Tempo del sottotitolo';
     Form2.RadioDuracao.Caption:='Durata dei dialoghi';
     Form2.RadioDepois.Caption:='Il testo apparirà dopo';
     Form2.RadioAntes.Caption:='Il testo apparirà prima';
     Form2.GroupBox2.Caption:=' Regolazione del tempo: ';
     Form2.GroupBox1.Caption:=' Sul testo ';
     end;
  2: begin
     //----------------------------------------------------- Form3 (Stretch/Shrink)
     Form3.Label1.Caption:='Primo dialogo:';
     Form3.Label2.Caption:='Ultimo dialogo:';
     Form3.btnCancelar.Caption:='Annulla';
     end;
  3: begin
     //----------------------------------------------------- Form5 (FPS)
     Form5.Label1.Caption:='Frame Rate attuale:';
     Form5.Label2.Caption:='Frame Rate desiderato:';
     Form5.btnCancelar.Caption:='Annulla';
     Form5.combo_fps_legenda.Hint:='Seleziona gli FPS originali del sottotitolo';
     Form5.combo_fps_video.Hint:='Seleziona gli FPS di destinazione';
     end;
  4: begin
     //----------------------------------------------------- Form6 (Localizar/Substituir)
     Form6_substituir.Label1.Caption:='T&rova:';
     Form6_substituir.Label2.Caption:='Sostituisci &con:';
     Form6_substituir.btn_localizar.Caption:='&Trova';
     Form6_substituir.btn_substituir.Caption:='&Sostituisci';
     Form6_substituir.btn_substituir_tudo.Caption:='Sostituisci t&utto';
     Form6_substituir.btn_cancelar.Caption:='Chiudi';
     Form6_substituir.CheckBox1.Caption:='Distingui &maiuscole/minuscole';
     Form6_substituir.CheckBox2.Caption:='Evidenzia &frasi trovate';
     Form6_substituir.CheckBox3.Caption:='Solo parole &intere';
     end;
  5: AboutBox.Caption:='Informazioni su SRT Adjuster';
 10: Result:='Verrà utilizzato solo il primo file.';
 11: Result:='Il file caricato non è un documento SRT.';
 12: Result:='Il documento caricato non contiene dialoghi nel formato di un sottotitolo SRT.';
 14: Result:='1 sottotitolo è stato regolato con successo!';
 15: Result:='%d sottotitoli sono stati regolati con successo!';
 16: Result:='Non è stato necessario apportare modifiche ai sottotitoli trovati in questa cartella!';
 17: Result:='Il sottotitolo attuale esiste già.'+#13+'Vuoi sostituirlo?                       ';
 18: Result:='Conferma';
 19: Result:='Questo sottotitolo contiene 1 occorrenza.';
 20: Result:='Questo sottotitolo contiene %d occorrenze.';
 21: Result:='Questo sottotitolo non contiene alcun tipo di occorrenza.';
 22: Result:='Sovrapposizioni corrette con successo!';
 23: Result:='Vuoi salvare le modifiche apportate a questo sottotitolo prima di uscire?';
 24: Result:='Sei sicuro di voler sovrascrivere il sottotitolo originale?';
 25: Result:='Vuoi aprire ora il video?';
 26: Result:='Correzione numerica eseguita con successo!';
 27: Result:='Il file caricato non è un documento di sottotitoli in formato SRT.';
 28: Result:='Cambio di colore eseguito con successo!';
 29: Result:='Nessun closed caption trovato.';
 30: Result:='I closed captions sono stati rimossi con successo!';
 31: Result:='1 Limite di riga';
 32: Result:='%d Limiti di riga';
 33: Result:='1 Sovrapposizione';
 34: Result:='%d Sovrapposizioni';
 35: Result:='%d Closed Captions';
 36: Result:='Trova';
 37: Result:='Sostituisci';
 38: Result:='File del dizionario Hunspell non trovati.';
 39: Result:='Errore di inizializzazione di Hunspell';
 40: Result:='Assicurati che ci sia un solo titolo di serie per cartella in modo che i sottotitoli vengano regolati correttamente.';
 41: Result:='%d Righe';
 42: Result:='%d Dialoghi';
 43: Result:='1 Riga';
 44: Result:='1 Dialogo';
 45: Result:='Regolazione del tempo';
 46: Result:='Regolazione della durata';
 47: Result:='Aumenta la durata';
 48: Result:='Diminuisci la durata';
 49: Result:=' Regolazione della durata: ';
 50: Result:=' Sul dialogo ';
 51: Result:='Il testo apparirà dopo';
 52: Result:='Il testo apparirà prima';
 53: Result:=' Regolazione del tempo: ';
 54: Result:=' Sul testo ';
 55: Result:='Stai cercando di far apparire il testo troppo presto.'+#13+'Alcune righe di testo (di solito le prime) potrebbero avere valori di tempo NEGATIVI!'+#13#13+'Questo si può fare solo ELIMINANDO queste righe dal file di destinazione...';
 56: Result:='La durata impostata sta rendendo negativi alcuni dialoghi.';
 57: Result:='Imposta una durata maggiore di quella attuale...';
 58: Result:='Regolazione del tempo eseguita con successo, ma 1 dialogo è stato eliminato.';
 59: Result:='Regolazione del tempo eseguita con successo, ma %d dialoghi sono stati eliminati.';
 60: Result:='Regolazione del tempo eseguita con successo!';
 61: Result:='Regolazione della durata dei dialoghi eseguita con successo!';
 62: Result:='In questo campo devi indicare il tempo iniziale del PRIMO dialogo del sottotitolo.'+#13#13+'ATTENZIONE:'+#13+'Non confondere il dialogo con le informazioni sui crediti relative alla creazione/sincronizzazione del sottotitolo.';
 63: Result:='In questo campo devi indicare il tempo iniziale dell''ULTIMO dialogo del sottotitolo.'+#13#13+'ATTENZIONE:'+#13+'Non confondere il dialogo con le informazioni sui crediti relative alla creazione/sincronizzazione del sottotitolo.';
 64: Result:='Il valore di tempo indicato in PRIMO DIALOGO non è valido!'+#13+'Imposta un valore inferiore al formato massimo di 24 ore.'+#13#13+'Error code:  #0301';
 65: Result:='Il valore di tempo indicato in ULTIMO DIALOGO non è valido!'+#13+'Imposta un valore inferiore al formato massimo di 24 ore.'+#13#13+'Error code:  #0302';
 66: Result:='Il valore di tempo indicato in PRIMO DIALOGO non è valido!'+#13+'Imposta un valore di tempo INFERIORE a quello dell''ULTIMO DIALOGO.'+#13#13+'Error code:  #0303';
 67: Result:='Il valore di tempo indicato in ULTIMO DIALOGO non è valido!'+#13+'Imposta un valore di tempo SUPERIORE a quello del PRIMO DIALOGO.'+#13#13+'Error code:  #0304';
 68: Result:='Sincronizzazione graduale - Stretch/Shrink';
 69: Result:='Sincronizzazione graduale eseguita con successo!';
 70: Result:='Sincronizzazione Frame Rate - FPS';
 71: Result:='Sincronizzazione Frame Rate eseguita con successo!';
 72: Result:='In questo campo devi indicare il FRAME RATE del video che vuoi sincronizzare.'+#13#13+'Controlla le proprietà del file video per ottenere questa informazione.';
 73: Result:='In questo campo devi indicare il FRAME RATE in cui vuoi convertire, dopo aver indicato il Frame Rate attuale del file video.';
 74: Result:='evidenziazione';
 75: Result:='evidenziazioni';
 76: Result:='sostituzione';
 77: Result:='sostituzioni';
 78: Result:='Impossibile trovare "%s"';
 79: Result:='È stata eseguita %d %s in tutto il sottotitolo.';
 80: Result:='Sono state eseguite %d %s in tutto il sottotitolo.';
 81: Result:='&Trova successivo';
 82: Result:='&Sostituisci successivo';
 83: Result:='&Trova';
 84: Result:='&Sostituisci';
 85: Result:='Trova ed &evidenzia';
 86: Result:='Versione %s'+#13+'JMBA Softwares 2004, 2026';
 87: Result:='Sono stati trovati %d file di sottotitoli e video di una serie.'+#13#13+'Vuoi regolare i sottotitoli?';
 88: Result:='In questa cartella è stato trovato un sottotitolo con stagione ed episodio ripetuti.'+#13#13+'Controlla i sottotitoli con %s prima di procedere.';
 89: Result:='Il numero di EPISODI è superiore a quello dei relativi file di sottotitoli.'+#13+'Controlla prima di procedere.'+#13#13+'Episodi: %d file'+#13+'Sottotitoli: %d file';
 90: Result:='Il numero di SOTTOTITOLI è superiore a quello dei relativi file video.'+#13+'Controlla prima di procedere.'+#13#13+'Episodi: %d file'+#13+'Sottotitoli: %d file';
 91: Result:='Impossibile trovare in questa cartella alcun file di sottotitoli o video di una serie nel formato standard.';
 92: Result:='Impossibile applicare la formattazione del testo desiderata.'+#13+'Rimuovi quella attuale prima di aggiungerne un''altra oppure verifica di aver selezionato correttamente il testo desiderato.';
 93: Result:='Impossibile applicare la formattazione del colore al testo desiderato.'+#13+'Rimuovi quella attuale prima di aggiungerne un''altra oppure verifica di aver selezionato correttamente il testo desiderato.';
 94: Result:='© 2026 JMBA Softwares. Tutti i diritti riservati.';
 95: Result:='1 Closed Caption';
 96: Result:='%d Closed Captions';
    end;
  end;
  5: begin
    case id of
  0: begin
     //----------------------------------------------------- Form1 (principal)
     Form1.btnitalico.Hint:='Italique';
     Form1.btnunderline.Hint:='Souligné';
     Form1.btnfonte.Hint:='Couleur';
     Form1.btnfundo.Hint:='Arrière-plan du sous-titre';
     Form1.btnabrir.Hint:='Ouvrir...';
     Form1.btnsalvar.Hint:='Enregistrer';
     Form1.btnsalvarcomo.Hint:='Enregistrer sous...';
     Form1.btnprocurar.Hint:='Traitement des sous-titres';
     Form1.btnconsertar.Hint:='Correction du chevauchement des dialogues';
     Form1.btneditar.Hint:='Modifier';
     Form1.btn_editAvancada.Hint:='Édition avancée';
     Form1.btn_ortografia.Hint:='Vérifier l''orthographe';
     Form1.btntags.Hint:='Changer la couleur du sous-titre';
     Form1.btntempo.Hint:='Réglage du temps';
     Form1.btnstretch.Hint:='Synchronisation progressive - Stretch/Shrink';
     Form1.btnfraps.Hint:='Synchronisation du Frame Rate - FPS';
     Form1.btnclosecaption.Hint:='Supprimer les Closed Captions';
     Form1.btnnumeros.Hint:='Correction numérique de l''index';
     Form1.btnrenomear.Hint:='Réglage de plusieurs sous-titres - Séries';
     Form1.Menu_Arquivo.Caption:='&Fichier';
     Form1.lstabrir.Caption:='Ouvrir...                  ';
     Form1.lsteditar.Caption:='Modifier';
     Form1.lstsalvar.Caption:='Enregistrer';
     Form1.lstsalvarcomo.Caption:='Enregistrer sous...';
     Form1.lstrecente.Caption:='Derniers sous-titres';
     Form1.lstsair.Caption:='Quitter';
     Form1.Menu_Ferramentas.Caption:='&Outils';
     Form1.lstlocalizar.Caption:='Rechercher...';
     Form1.lstsubstituir.Caption:='Remplacer...';
     Form1.lstprocurar.Caption:='Traitement des sous-titres';
     Form1.lstconsertar.Caption:='Correction du chevauchement des dialogues';
     Form1.lsttempo.Caption:='Réglage du temps';
     Form1.lststretch.Caption:='Synchronisation progressive - Stretch/Shrink';
     Form1.lstfraps.Caption:='Synchronisation du Frame Rate - FPS';
     Form1.lstclosecaption.Caption:='&Supprimer les Closed Captions';
     Form1.lstnumeros.Caption:='Correction numérique de l''index';
     Form1.lstrenomear.Caption:='Réglage de &plusieurs sous-titres';
     Form1.Menu_Caracter.Caption:='&Police';
     Form1.lst_editAvancada.Caption:='Édition avancée       ';
     Form1.lstitalic.Caption:='Italique';
     Form1.lstunderline.Caption:='Souligné';
     Form1.lstfonte.Caption:='Couleur';
     Form1.lsttags.Caption:='Changer la &couleur du sous-titre';
     Form1.lst_ortografia.Caption:='&Vérifier l''orthographe';
     Form1.Menu_Idioma.Caption:='&Langue';
     Form1.Idioma_Auto.Caption:='Automatique';
     Form1.Idioma_Por.Caption:='Português';
     Form1.Idioma_Eng.Caption:='English';
     Form1.Idioma_Esp.Caption:='Español';
     Form1.Idioma_Ita.Caption:='Italiano';
     Form1.Idioma_Fra.Caption:='Français';
     Form1.Menu_Sobre.Caption:='&Informations';
     Form1.Sobre1.Caption:='À &propos...';
     Form1.Abrir1.Caption:='&Ouvrir...';
     Form1.Copiar1.Caption:='Copier';
     Form1.Selecionar1.Caption:='Tout sélectionner';
     Form1.Localizar1.Caption:='Rechercher...';
     Form1.SaveDialog1.Title:='Enregistrer sous';
     Form1.OpenDialog1.Filter:='Document de sous-titres (*.srt)|*.srt';
     Form1.SaveDialog1.Filter:='Document de sous-titres (*.srt)|*.srt';
     //-----------------------------------------------------
     Form1.Idioma_Auto.Checked:=(Language_Global = 0);
     Form1.Idioma_Por.Checked :=(Language_Global = 1);
     Form1.Idioma_Eng.Checked :=(Language_Global = 2);
     Form1.Idioma_Esp.Checked :=(Language_Global = 3);
     Form1.Idioma_Ita.Checked :=(Language_Global = 4);
     Form1.Idioma_Fra.Checked :=(Language_Global = 5);
     end;
  1: begin
     //----------------------------------------------------- Form2 (Ajuste de Tempo)
     Form2.Label2.Caption:='Secondes :';
     Form2.Label1.Caption:='Minutes :';
     Form2.Label3.Caption:='Heures :';
     Form2.Label5.Caption:='Millisecondes :';
     Form2.btnCancelar.Caption:='Annuler';
     Form2.GroupBox3.Caption:=' Ajuster ';
     Form2.RadioTempo.Caption:='Temps du sous-titre';
     Form2.RadioDuracao.Caption:='Durée des dialogues';
     Form2.RadioDepois.Caption:='Le texte viendra après';
     Form2.RadioAntes.Caption:='Le texte viendra avant';
     Form2.GroupBox2.Caption:=' Réglage du temps : ';
     Form2.GroupBox1.Caption:=' À propos du texte ';
     end;
  2: begin
     //----------------------------------------------------- Form3 (Stretch/Shrink)
     Form3.Label1.Caption:='Premier dialogue :';
     Form3.Label2.Caption:='Dernier dialogue :';
     Form3.btnCancelar.Caption:='Annuler';
     end;
  3: begin
     //----------------------------------------------------- Form5 (FPS)
     Form5.Label1.Caption:='Frame Rate actuel :';
     Form5.Label2.Caption:='Frame Rate souhaité :';
     Form5.btnCancelar.Caption:='Annuler';
     Form5.combo_fps_legenda.Hint:='Sélectionnez le FPS d''origine du sous-titre';
     Form5.combo_fps_video.Hint:='Sélectionnez le FPS vers lequel convertir';
     end;
  4: begin
     //----------------------------------------------------- Form6 (Localizar/Substituir)
     Form6_substituir.Label1.Caption:='Re&chercher :';
     Form6_substituir.Label2.Caption:='Remplacer &par :';
     Form6_substituir.btn_localizar.Caption:='&Rechercher';
     Form6_substituir.btn_substituir.Caption:='&Remplacer';
     Form6_substituir.btn_substituir_tudo.Caption:='Remplacer &tout';
     Form6_substituir.btn_cancelar.Caption:='Fermer';
     Form6_substituir.CheckBox1.Caption:='Respecter la &casse';
     Form6_substituir.CheckBox2.Caption:='Marquer les &phrases trouvées';
     Form6_substituir.CheckBox3.Caption:='Mot en&tier';
     end;
  5: AboutBox.Caption:='À propos de SRT Adjuster';
 10: Result:='Seul le premier fichier sera utilisé.';
 11: Result:='Le fichier chargé n''est pas un document SRT.';
 12: Result:='Le document chargé ne contient aucun dialogue au format d''un sous-titre SRT.';
 14: Result:='1 sous-titre a été réglé avec succès !';
 15: Result:='%d sous-titres ont été réglés avec succès !';
 16: Result:='Aucun réglage n''a été nécessaire pour les sous-titres trouvés dans ce dossier !';
 17: Result:='Le sous-titre actuel existe déjà.'+#13+'Voulez-vous le remplacer ?                       ';
 18: Result:='Confirmer';
 19: Result:='Ce sous-titre contient 1 occurrence.';
 20: Result:='Ce sous-titre contient %d occurrences.';
 21: Result:='Ce sous-titre ne contient aucune occurrence.';
 22: Result:='Chevauchements corrigés avec succès !';
 23: Result:='Voulez-vous enregistrer les modifications apportées à ce sous-titre avant de quitter ?';
 24: Result:='Êtes-vous sûr de vouloir écraser le sous-titre original ?';
 25: Result:='Voulez-vous ouvrir la vidéo maintenant ?';
 26: Result:='Correction numérique effectuée avec succès !';
 27: Result:='Le fichier chargé n''est pas un document de sous-titres au format SRT.';
 28: Result:='Changement de couleur effectué avec succès !';
 29: Result:='Aucun closed caption trouvé.';
 30: Result:='Les closed captions ont été supprimés avec succès !';
 31: Result:='1 Limite de ligne';
 32: Result:='%d Limites de ligne';
 33: Result:='1 Chevauchement';
 34: Result:='%d Chevauchements';
 35: Result:='%d Closed Captions';
 36: Result:='Rechercher';
 37: Result:='Remplacer';
 38: Result:='Fichiers du dictionnaire Hunspell introuvables.';
 39: Result:='Erreur d''initialisation de Hunspell';
 40: Result:='Assurez-vous qu''il n''y a qu''un seul titre de série par dossier afin que les sous-titres soient réglés correctement.';
 41: Result:='%d Lignes';
 42: Result:='%d Dialogues';
 43: Result:='1 Ligne';
 44: Result:='1 Dialogue';
 45: Result:='Réglage du temps';
 46: Result:='Réglage de la durée';
 47: Result:='Augmenter la durée';
 48: Result:='Diminuer la durée';
 49: Result:=' Réglage de la durée : ';
 50: Result:=' À propos du dialogue ';
 51: Result:='Le texte viendra après';
 52: Result:='Le texte viendra avant';
 53: Result:=' Réglage du temps : ';
 54: Result:=' À propos du texte ';
 55: Result:='Vous essayez de faire apparaître le texte trop tôt.'+#13+'Certaines lignes de texte (généralement les premières) peuvent avoir des valeurs de temps NÉGATIVES !'+#13#13+'Cela ne peut se faire qu''en SUPPRIMANT ces lignes du fichier de destination...';
 56: Result:='La durée que vous avez définie rend négatifs certains dialogues.';
 57: Result:='Définissez une durée supérieure à celle définie actuellement...';
 58: Result:='Réglage du temps effectué avec succès, mais 1 dialogue a été supprimé.';
 59: Result:='Réglage du temps effectué avec succès, mais %d dialogues ont été supprimés.';
 60: Result:='Réglage du temps effectué avec succès !';
 61: Result:='Réglage de la durée des dialogues effectué avec succès !';
 62: Result:='Dans ce champ, vous devez indiquer le temps de début du PREMIER dialogue du sous-titre.'+#13#13+'ATTENTION :'+#13+'Ne confondez pas le dialogue avec les informations de crédits relatives à la création/synchronisation du sous-titre.';
 63: Result:='Dans ce champ, vous devez indiquer le temps de début du DERNIER dialogue du sous-titre.'+#13#13+'ATTENTION :'+#13+'Ne confondez pas le dialogue avec les informations de crédits relatives à la création/synchronisation du sous-titre.';
 64: Result:='La valeur de temps indiquée dans PREMIER DIALOGUE n''est pas valide !'+#13+'Définissez une valeur inférieure au format maximal de 24 h.'+#13#13+'Error code:  #0301';
 65: Result:='La valeur de temps indiquée dans DERNIER DIALOGUE n''est pas valide !'+#13+'Définissez une valeur inférieure au format maximal de 24 h.'+#13#13+'Error code:  #0302';
 66: Result:='La valeur de temps indiquée dans PREMIER DIALOGUE n''est pas valide !'+#13+'Définissez une valeur de temps INFÉRIEURE à celle du DERNIER DIALOGUE.'+#13#13+'Error code:  #0303';
 67: Result:='La valeur de temps indiquée dans DERNIER DIALOGUE n''est pas valide !'+#13+'Définissez une valeur de temps SUPÉRIEURE à celle du PREMIER DIALOGUE.'+#13#13+'Error code:  #0304';
 68: Result:='Synchronisation progressive - Stretch/Shrink';
 69: Result:='Synchronisation progressive effectuée avec succès !';
 70: Result:='Synchronisation du Frame Rate - FPS';
 71: Result:='Synchronisation du Frame Rate effectuée avec succès !';
 72: Result:='Dans ce champ, vous devez indiquer le FRAME RATE de la vidéo que vous souhaitez synchroniser.'+#13#13+'Consultez les propriétés du fichier vidéo pour obtenir cette information.';
 73: Result:='Dans ce champ, vous devez indiquer le FRAME RATE vers lequel vous souhaitez convertir, après avoir indiqué le Frame Rate actuel du fichier vidéo.';
 74: Result:='marquage';
 75: Result:='marquages';
 76: Result:='remplacement';
 77: Result:='remplacements';
 78: Result:='Impossible de trouver "%s"';
 79: Result:='%d %s effectué dans tout le sous-titre.';
 80: Result:='%d %s effectués dans tout le sous-titre.';
 81: Result:='&Rechercher le suivant';
 82: Result:='&Remplacer le suivant';
 83: Result:='&Rechercher';
 84: Result:='&Remplacer';
 85: Result:='Rechercher et &marquer';
 86: Result:='Version %s'+#13+'JMBA Softwares 2004, 2026';
 87: Result:='%d fichiers de sous-titres et de vidéo d''une série ont été trouvés.'+#13#13+'Voulez-vous régler les sous-titres ?';
 88: Result:='Un sous-titre avec une saison et un épisode en double a été trouvé dans ce dossier.'+#13#13+'Vérifiez les sous-titres avec %s avant de continuer.';
 89: Result:='Le nombre d''ÉPISODES est supérieur à celui de leurs fichiers de sous-titres.'+#13+'Vérifiez avant de continuer.'+#13#13+'Épisodes : %d fichiers'+#13+'Sous-titres : %d fichiers';
 90: Result:='Le nombre de SOUS-TITRES est supérieur à celui de leurs fichiers vidéo.'+#13+'Vérifiez avant de continuer.'+#13#13+'Épisodes : %d fichiers'+#13+'Sous-titres : %d fichiers';
 91: Result:='Aucun fichier de sous-titres ou de vidéo d''une série au format standard n''a été trouvé dans ce dossier.';
 92: Result:='Impossible d''appliquer la mise en forme de texte souhaitée.'+#13+'Supprimez l''actuelle avant d''en ajouter une autre ou vérifiez que vous avez correctement sélectionné le texte souhaité.';
 93: Result:='Impossible d''appliquer la mise en couleur au texte souhaité.'+#13+'Supprimez l''actuelle avant d''en ajouter une autre ou vérifiez que vous avez correctement sélectionné le texte souhaité.';
 94: Result:='© 2026 JMBA Softwares. Tous droits réservés.';
 95: Result:='1 Closed Caption';
 96: Result:='%d Closed Captions';
    end;
  end;
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
     Form1.lstrenomear.Caption:='&Multiple Subtitles Adjustment';
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
     Form1.Idioma_Esp.Caption:='Español';
     Form1.Idioma_Ita.Caption:='Italiano';
     Form1.Idioma_Fra.Caption:='Français';
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
     Form1.Idioma_Esp.Checked :=(Language_Global = 3);
     Form1.Idioma_Ita.Checked :=(Language_Global = 4);
     Form1.Idioma_Fra.Checked :=(Language_Global = 5);
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
 95: Result:='1 Closed Caption';
 96: Result:='%d Closed Captions';
    end;
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
