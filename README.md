<p align="center">
<img width="360" src="https://github.com/user-attachments/assets/e5d7c358-865c-4c4a-9824-5b93ebb752f6" />
</p>

<p align="center">
SRT Adjuster é uma ferramenta para editar, ajustar e sincronizar legendas SRT de forma simples e intuitiva. Reúne recursos de diversos editores em uma interface amigável com edição estilo Bloco de Notas, permitindo correções automáticas, ajustes de tempo e duração, pesquisa avançada, aplicação de efeitos, sincronização gradativa, conversão de FPS, renomeação em massa e correção automática da numeração dos diálogos. Disponível em português, inglês, espanhol, italiano e francês. Não requer dependências externas.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Ativo-success">
  <img src="https://img.shields.io/badge/Plataforma-Windows-blue">
  <img src="https://img.shields.io/badge/Tipo-Editor%20de%20Legenda-orange">
  <img src="https://img.shields.io/badge/Languages-PT--BR%20%7C%20EN%20%7C%20ES%20%7C%20IT%20%7C%20FR-purple">
</p>

---

## ✨ Funcionalidades

<br>
<table style="border: none; border-collapse: collapse;">
<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

#### ⚡ CORREÇÕES AUTOMÁTICAS

Identifica sobreposições de diálogo e limites excedentes de linha (diálogos com mais de duas linhas), listando cada ocorrência para que você clique e vá direto ao ponto na legenda.

As sobreposições são corrigidas automaticamente, com o texto original e o corrigido na mesma tela para comparação antes de salvar.
<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

#### ⏱️ AJUSTE DE TEMPO OU DURAÇÃO

Ajusta o tempo ou a duração dos diálogos em toda a legenda por horas, minutos, segundos e milissegundos.
<br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

#### ✏️ EDIÇÃO AVANÇADA

Realiza um highlight de toda a estrutura da legenda para melhor visualização, além de permitir a inserção de efeitos de itálico/sublinhado e cores no diálogo que desejar (utilizado para criar créditos de criação). Também é possível alterar o tamanho da fonte e alternar o fundo do editor entre claro e escuro.

Pesquisa/Substituição/Marcação: Foi implementado um novo método de pesquisa e identificação a partir dos critérios que o usuário desejar.
<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🗂️ RENOMEAR MÚLTIPLAS LEGENDAS

Caso o release das legendas seja diferente ao dos vídeos, poderá ser realizado o ajuste automático em todos os arquivos de legenda para que assim seja possível a visualização correta das mesmas em seu player padrão, evitando assim o desgaste em renomear arquivo por arquivo de toda uma temporada.
<br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🔄 SINCRONIA GRADATIVA

Em caso de perda de sincronia gradativa do vídeo, será necessário informar o tempo correto de início e fim do áudio (na maioria dos casos, dos diálogos) para o ajuste automático.
<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🎞️ FRAME RATE - FPS

Necessita informar o FPS (frame por segundo) atual da legenda (normalmente informado no site de onde foi feito o download) e logo após a desejada (localizado nas propriedades do vídeo).
<br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🔢 CORREÇÃO NUMÉRICA DE ÍNDICE

Em caso de se adicionar ou subtrair diálogos manualmente, é possível corrigir automaticamente a numeração de cada diálogo em ordem crescente.
<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 📝 VERIFICAÇÃO ORTOGRÁFICA

Utilização da biblioteca hunspell.dll, verifica erros ortográficos nos diálogos e demonstra em tela para facilitar a identificação e correção. O dicionário acompanha o idioma escolhido no programa: PT-BR, EN-US, ES, IT ou FR.
<br><br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🎨 ALTERAR COR DA LEGENDA

Caso a legenda, originalmente branca, está atrapalhando a visualização dos diálogos, agora você poderá alterar para a cor que desejar. Seja ela amarela ou qualquer outra.
<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🧹 REMOÇÃO DE CLOSED CAPTION

Identifica os diálogos com Closed Captions (CC) e remove automaticamente descrições de sons, músicas e identificações de falas, deixando a legenda mais limpa e focada apenas nos diálogos. Diálogos que ficam vazios após a remoção são descartados.

Essa funcionalidade é especialmente útil, pois na maioria dos casos não existe uma versão da legenda sem Closed Caption disponível, tornando o ajuste manual trabalhoso e demorado.
<br><br>
</td>
</tr>

<tr>
<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 🌍 INTERFACE MULTIIDIOMA

Português, inglês, espanhol, italiano e francês. No modo Automático o programa segue o idioma do Windows (e usa inglês quando o idioma não é um dos suportados), e a escolha feita no menu Idioma é lembrada na próxima abertura. A troca é aplicada na hora, incluindo mensagens, contadores e o dicionário da verificação ortográfica.
<br><br>
</td>

<td width="50%" valign="top" style="border: none; padding: 15px;">

#### 📂 PRATICIDADE NO DIA A DIA

- Arraste e solte um arquivo .srt na janela para abri-lo
- Lista das últimas legendas abertas
- Abertura direta ao associar a extensão .srt ao programa
- Detecção automática da codificação (ANSI ou UTF-8) ao abrir; o arquivo é salvo em UTF-8
- Ao salvar, oferece abrir o vídeo correspondente, quando encontrado na mesma pasta
- Interface ajustada à escala de DPI do Windows
<br>
</td>
</tr>

</table>

---

## 📸 Preview

<p align="center">
  <img width="500" alt="image" src="https://github.com/user-attachments/assets/67080672-63e1-4229-a5bf-e41b17e190b6" />
</p>

---

<p align="center">
Feito para facilitar o ajuste de legendas baixadas da internet. 🎬
</p>
