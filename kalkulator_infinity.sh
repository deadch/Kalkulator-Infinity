#!/data/data/com.termux/files/usr/bin/bash

# ============================================================
# INFINITY ∞ — TRANSCENDENCE SYSTEM+
# Scientific / Educational / System CLI
# Version : v17.1-stable
# Author  : deadch
# ============================================================

VERSION="v17.1-stable"

# ===================== CONFIG ===============================
PRECISION=120
DX="1e-9"
STEPS=8000
LOGFILE="$HOME/.infinity.log"

# ===================== COLORS ===============================
W="\033[97m"; R="\033[31m"; G="\033[32m"
Y="\033[33m"; B="\033[34m"; C="\033[36m"
M="\033[35m"; Z="\033[0m"

LINE="${C}────────────────────────────────────────────────────────────${Z}"

# ===================== CORE =================================
log(){ echo "[$(date +%F_%T)] $1" >> "$LOGFILE"; }

pause(){ echo; read -p ">> ENTER"; }

calc(){
  echo "scale=$PRECISION;$1" | bc -l 2>/dev/null || echo "Erro matemático"
}

header(){
  clear
  echo -e "${W}INFINITY ∞${Z} ${M}TRANSCENDENCE+${Z}"
  echo -e "${Y}Versão:${Z} $VERSION | ${Y}Precisão:${Z} $PRECISION dígitos"
  echo -e "$LINE"
}

# ============================================================
# MENU PRINCIPAL
# ============================================================
main_menu(){
while true; do
  header
  echo "(1) Matemática Avançada"
  echo "(2) Física Fundamental & Moderna"
  echo "(3) Infinity Mode ∞ (Limites Computacionais)"
  echo "(4) Universo & Cosmologia"
  echo "(5) Tesla Mode ⚡"
  echo "(6) Conspirações (Análise Científica)"
  echo "(7) Modo Professor ∞"
  echo "(8) Utilidades Científicas"
  echo "(9) Configurações"
  echo "(10) Manual Técnico"
  echo
  echo "(0) Sair"
  read -p ">> " op
  case $op in
    1) math_menu ;;
    2) physics_menu ;;
    3) infinity_menu ;;
    4) universe_menu ;;
    5) tesla_menu ;;
    6) conspiracy_menu ;;
    7) professor_menu ;;
    8) utils_menu ;;
    9) settings ;;
    10) manual ;;
    0) exit ;;
  esac
done
}

# ============================================================
# UNIVERSO & COSMOLOGIA
# ============================================================
universe_menu(){
while true; do
  header
  echo "(1) Big Bang"
  echo "(2) Energia Escura"
  echo "(3) Matéria Escura"
  echo "(4) Multiverso"
  echo "(5) Limites da Cosmologia"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1)
echo "O modelo do Big Bang descreve a evolução inicial do universo a partir de um estado extremamente quente e denso. Ele não descreve uma explosão em um ponto do espaço, mas sim a expansão do próprio espaço-tempo. As principais evidências observacionais incluem a radiação cósmica de fundo em micro-ondas (CMB), o desvio para o vermelho das galáxias proporcional à distância (Lei de Hubble-Lemaître) e as proporções observadas de elementos leves como hidrogênio, hélio e lítio. O modelo explica a evolução do universo desde frações de segundo após o início da expansão, mas não descreve a causa última ou condição inicial absoluta."
;;
    2)
echo "Energia escura é o termo utilizado para descrever o fenômeno responsável pela aceleração observada da expansão do universo. Sua existência é inferida por observações de supernovas do tipo Ia, oscilações acústicas bariônicas e anisotropias da radiação cósmica de fundo. As interpretações atuais incluem a constante cosmológica associada ao vácuo quântico ou campos dinâmicos ainda não detectados. Não se trata de uma força convencional e sua natureza permanece desconhecida."
;;
    3)
echo "Matéria escura é um tipo de matéria que não interage significativamente com a radiação eletromagnética, tornando-se invisível aos telescópios tradicionais. Sua presença é inferida por efeitos gravitacionais, como curvas de rotação galácticas planas, lentes gravitacionais e a formação de grandes estruturas cósmicas. Diversos candidatos teóricos existem, como WIMPs e axions, mas nenhuma detecção direta foi confirmada até o momento."
;;
    4)
echo "O conceito de multiverso surge como consequência matemática de alguns modelos inflacionários e de certas interpretações da mecânica quântica. Ele propõe a existência de múltiplos universos com propriedades físicas possivelmente distintas. Atualmente, o multiverso não gera previsões observacionais testáveis, permanecendo no domínio teórico e filosófico."
;;
    5)
echo "A cosmologia moderna enfrenta limites fundamentais em escalas extremas. Singularidades como o Big Bang e o interior de buracos negros indicam a quebra da relatividade geral. Uma teoria consistente e experimentalmente verificada de gravidade quântica ainda não existe. Além disso, horizontes cosmológicos limitam a quantidade de informação observável no universo."
;;
    0) break ;;
  esac
  pause
done
}

# ============================================================
# TESLA MODE ⚡
# ============================================================
tesla_menu(){
while true; do
  header
  echo "(1) Nikola Tesla (Contexto Histórico)"
  echo "(2) Corrente Alternada"
  echo "(3) Campos e Ressonância"
  echo "(4) Energia Sem Fio"
  echo "(5) Limitações das Ideias de Tesla"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1)
echo "Nikola Tesla foi um engenheiro e inventor com contribuições fundamentais para sistemas de corrente alternada, motores elétricos, radiofrequência e engenharia eletromagnética. Muitos conteúdos populares atribuem a ele frases e ideias místicas que não possuem base documental ou técnica."
;;
    2)
echo "A corrente alternada permite a transformação eficiente de tensão por meio de transformadores, reduzindo perdas por efeito Joule durante a transmissão de energia elétrica. Esse princípio tornou possível a construção de redes elétricas de larga escala, sendo a base da infraestrutura elétrica moderna."
;;
    3)
echo "Ressonância é um fenômeno físico no qual um sistema responde com maior amplitude quando excitado em sua frequência natural. Esse efeito é amplamente utilizado em engenharia, comunicações e sistemas mecânicos. A ressonância não gera energia; ela apenas maximiza a transferência de energia dentro de sistemas já energizados."
;;
    4)
echo "A transmissão de energia sem fio é fisicamente possível por acoplamento indutivo, capacitivo ou ondas eletromagnéticas. No entanto, perdas crescem rapidamente com a distância devido à dispersão e absorção. Por isso, não é viável para distribuição energética global em larga escala."
;;
    5)
echo "Algumas propostas de Tesla extrapolaram os limites da física conhecida e nunca foram experimentalmente validadas, como transmissão ilimitada de energia ou dispositivos de energia infinita. Essas ideias entram em conflito direto com a conservação de energia e as leis da termodinâmica."
;;
    0) break ;;
  esac
  pause
done
}

# ============================================================
# CONSPIRAÇÕES (ANÁLISE CIENTÍFICA)
# ============================================================
conspiracy_menu(){
while true; do
  header
  echo "(1) Psicologia das Conspirações"
  echo "(2) Terra Plana"
  echo "(3) Lua é Falsa?"
  echo "(4) NASA Esconde Tudo?"
  echo "(5) Como Identificar Pseudociência"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1)
echo "Teorias da conspiração emergem de vieses cognitivos como viés de confirmação, percepção ilusória de padrões e necessidade psicológica de controle. Ambientes de alta incerteza favorecem explicações simplificadas e narrativas de agentes ocultos."
;;
    2)
echo "O modelo da Terra plana é refutado por múltiplas linhas independentes de evidência, incluindo gravitação newtoniana, navegação por satélite, observações astronômicas, imagens orbitais e trajetórias balísticas."
;;
    3)
echo "As missões Apollo instalaram retrorefletores na superfície lunar, utilizados até hoje para medições de distância Terra-Lua por laser. Esses experimentos confirmam presença humana física no solo lunar de forma independente."
;;
    4)
echo "A ciência espacial é descentralizada. Dados são produzidos e analisados por universidades, empresas privadas e agências de diversos países. Qualquer tentativa de ocultação global seria logisticamente inviável."
;;
    5)
echo "Pseudociência evita hipóteses falsificáveis, rejeita revisão por pares e não produz previsões quantitativas testáveis. A ciência progride aceitando erro, crítica e correção contínua."
;;
    0) break ;;
  esac
  pause
done
}

# ============================================================
# MODO PROFESSOR ∞
# ============================================================
professor_menu(){
while true; do
  header
  echo "(1) Como a Ciência Funciona"
  echo "(2) Modelos Científicos"
  echo "(3) Caos e Complexidade"
  echo "(4) Consciência"
  echo "(5) Limites do Conhecimento"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1)
echo "A ciência opera por meio de hipóteses testáveis, experimentação controlada, análise estatística e revisão independente. Nenhuma teoria é definitiva; todas permanecem abertas à refutação."
;;
    2)
echo "Modelos científicos são representações matemáticas ou conceituais da realidade. Eles funcionam dentro de domínios específicos e falham quando extrapolados além desses limites."
;;
    3)
echo "Sistemas caóticos seguem leis determinísticas, mas exibem imprevisibilidade de longo prazo devido à extrema sensibilidade às condições iniciais. Isso não implica aleatoriedade."
;;
    4)
echo "A consciência é estudada como um fenômeno emergente da atividade neural distribuída. Até o momento, não há evidência experimental de explicações sobrenaturais mensuráveis."
;;
    5)
echo "Existem limites fundamentais impostos pela natureza, como a velocidade da luz, o princípio da incerteza e restrições energéticas. O progresso científico ocorre dentro desses limites."
;;
    0) break ;;
  esac
  pause
done
}

# ============================================================
manual(){
header
cat <<EOF
INFINITY ∞ TRANSCENDENCE+

Ambiente científico e educacional em linha de comando.
Integra matemática numérica, física clássica e moderna,
engenharia conceitual, cosmologia observacional
e análise crítica de pseudociência.

Este sistema não fornece verdades absolutas.
Ele fornece ferramentas para cálculo,
exploração conceitual e desenvolvimento
do pensamento científico crítico,
respeitando os limites físicos e computacionais reais.
EOF
pause
}

main_menu
