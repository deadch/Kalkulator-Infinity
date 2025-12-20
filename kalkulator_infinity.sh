#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
# INFINITY ∞ — ABYSS CONTROL SYSTEM
# Author : deadch
# Version: v11.0-abyss
# ==================================================

VERSION="v11.0-abyss"

# ===== CONFIG =====
PRECISION=100
DX=0.000000001
STEPS=5000
LOG="$HOME/infinity.log"

# ===== CORES =====
W="\033[97m"; R="\033[31m"; G="\033[32m"
Y="\033[33m"; B="\033[34m"; C="\033[36m"
M="\033[35m"; Z="\033[0m"

LINE="${C}──────────────────────────────────────────────${Z}"

pause(){ echo; read -p ">> ENTER"; }

safe_calc(){
  echo "scale=$PRECISION;$1" | bc -l 2>/dev/null || echo "Erro"
}

header(){
  clear
  echo -e "${W}INFINITY ∞${Z} ${M}ABYSS${Z}"
  echo -e "${Y}Version:${Z} $VERSION   ${Y}Precision:${Z} $PRECISION"
  echo -e "$LINE"
}

# ==================================================
# MENU PRINCIPAL
# ==================================================
main_menu(){
while true; do
  header
  echo -e "${G}(1)${Z} Matemática"
  echo -e "${G}(2)${Z} Física & Simulações"
  echo -e "${G}(3)${Z} Infinity Mode ∞ (Sistema)"
  echo -e "${G}(4)${Z} Configurações"
  echo -e "${G}(5)${Z} Manual"
  echo
  echo -e "${R}(0)${Z} Sair"
  read -p ">> " op

  case $op in
    1) math_menu ;;
    2) physics_menu ;;
    3) infinity_menu ;;
    4) settings ;;
    5) manual ;;
    0) exit ;;
  esac
done
}

# ==================================================
# MATEMÁTICA (BÁSICO → EXTREMO)
# ==================================================
math_menu(){
while true; do
  header
  echo -e "${C}MATEMÁTICA${Z}"
  echo
  echo "(1) Básica ( + - * / ^ )"
  echo "(2) Científica (sin cos log sqrt)"
  echo "(3) Equações & Avaliação"
  echo "(4) Derivadas Numéricas"
  echo "(5) Integrais Numéricas"
  echo "(6) Estatística"
  echo "(7) Séries & Limites"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1)
      read -p "Conta >> " e
      safe_calc "$e"
      ;;
    2)
      read -p "Função >> " e
      safe_calc "$e"
      ;;
    3)
      read -p "f(x) >> " f
      read -p "x >> " x
      safe_calc "${f//x/$x}"
      ;;
    4)
      read -p "f(x) >> " f
      read -p "x >> " x
      safe_calc "((${f//x/($x+$DX)})-(${f//x/($x-$DX)}))/(2*$DX)"
      ;;
    5)
      read -p "f(x) >> " f
      read -p "a >> " a
      read -p "b >> " b
      h=$(safe_calc "($b-$a)/$STEPS")
      sum=0
      for ((i=0;i<STEPS;i++)); do
        x1=$(safe_calc "$a+$i*$h")
        x2=$(safe_calc "$x1+$h")
        f1=$(safe_calc "${f//x/$x1}")
        f2=$(safe_calc "${f//x/$x2}")
        sum=$(safe_calc "$sum+(($f1+$f2)/2)*$h")
      done
      echo "Integral ≈ $sum"
      ;;
    6)
      read -p "Valores >> " v
      awk '{
        for(i=1;i<=NF;i++){a[i]=$i; s+=$i}
        n=NF; m=s/n
        for(i=1;i<=NF;i++)v+=(a[i]-m)^2
        asort(a)
        printf "Média: %.6f\nMediana: %.6f\nVariância: %.6f\nDesvio: %.6f\n",
        m,a[int(n/2)],v/n,sqrt(v/n)
      }' <<< "$v"
      ;;
    7)
      read -p "Termo a_n (n) >> " f
      read -p "n >> " n
      sum=0
      for ((i=1;i<=n;i++)); do
        sum=$(safe_calc "$sum+(${f//n/$i})")
      done
      echo "Série ≈ $sum"
      ;;
    0) break ;;
  esac
  pause
done
}

# ==================================================
# FÍSICA
# ==================================================
physics_menu(){
while true; do
  header
  echo -e "${C}FÍSICA & SIMULAÇÕES${Z}"
  echo
  echo "(1) Movimento Uniforme"
  echo "(2) MUV"
  echo "(3) Queda Livre"
  echo "(4) Energia"
  echo "(5) Órbita Circular"
  echo "(6) Velocidade de Escape"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1)
      read -p "v >> " v
      read -p "t >> " t
      safe_calc "$v*$t"
      ;;
    2)
      read -p "v0 >> " v0
      read -p "a >> " a
      read -p "t >> " t
      safe_calc "$v0*$t+($a*$t^2)/2"
      ;;
    3)
      read -p "h >> " h
      g=9.80665
      safe_calc "sqrt(2*$h/$g)"
      ;;
    4)
      read -p "m >> " m
      read -p "v >> " v
      safe_calc "($m*$v^2)/2"
      ;;
    5)
      read -p "Raio (km) >> " r
      mu=398600.4418
      safe_calc "sqrt($mu/$r)"
      ;;
    6)
      read -p "Raio (km) >> " r
      mu=398600.4418
      safe_calc "sqrt(2*$mu/$r)"
      ;;
    0) break ;;
  esac
  pause
done
}

# ==================================================
# INFINITY MODE — NO LIMITE DO BASH
# ==================================================
infinity_menu(){
while true; do
  header
  echo -e "${C}INFINITY MODE ∞${Z}"
  echo
  echo "(1) Identidade & Kernel"
  echo "(2) Processos Detalhados"
  echo "(3) CPU / MEM / LOAD"
  echo "(4) Disco (com inodes)"
  echo "(5) Rede Completa"
  echo "(6) Portas Abertas"
  echo "(7) Sensores / Temperatura"
  echo "(8) Snapshot TOTAL"
  echo "(9) Monitor ao Vivo"
  echo
  echo "(0) Voltar"
  read -p ">> " op

  case $op in
    1) whoami; uname -a; uptime ;;
    2) ps aux --sort=-%cpu | head -30 ;;
    3) lscpu; echo; free -h; uptime ;;
    4) df -h; echo; df -i ;;
    5) ip a; ip route; echo "IP Público: $(curl -s ifconfig.me)" ;;
    6) ss -tulnp ;;
    7) sensors 2>/dev/null || echo "Sensores indisponíveis" ;;
    8)
      uname -a
      uptime
      free -h
      df -h
      df -i
      ip a
      ss -tulnp
      ;;
    9)
      trap "break" INT
      while true; do
        clear
        date
        uptime
        free -h | head -2
        ps aux --sort=-%cpu | head -5
        sleep 2
      done
      trap - INT
      ;;
    0) break ;;
  esac
  pause
done
}

# ==================================================
# CONFIG
# ==================================================
settings(){
  header
  read -p "Nova precisão >> " PRECISION
}

# ==================================================
# MANUAL
# ==================================================
manual(){
  header
  echo "Ferramenta matemática e de observação de sistema."
  echo
  echo "• Matemática básica até numérica avançada"
  echo "• Física clássica e orbital"
  echo "• Diagnóstico profundo do sistema"
  echo "• Monitoramento em tempo real"
  pause
}

# ==================================================
# START
# ==================================================
main_menu
