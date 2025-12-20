#!/data/data/com.termux/files/usr/bin/bash

# ==================================================
# INFINITY ∞ — Ultra System & Math Observatory
# Author : deadch
# Version: v7.0-ultra
# ==================================================

VERSION="v7.0-ultra"
PRECISION=50
DX=0.00000001
INTEGRAL_STEPS=1200

# ===== CORES =====
W="\033[97m"
R="\033[31m"
G="\033[32m"
Y="\033[33m"
B="\033[34m"
C="\033[36m"
Z="\033[0m"

LINE="${C}────────────────────────────────────────────${Z}"

pause(){ echo; read -p ">> ENTER para continuar"; }

header(){
  clear
  echo -e "${W}INFINITY ∞${Z}  ${C}Ultra Observation System${Z}"
  echo -e "${Y}Version:${Z} $VERSION   ${R}by:${Z} deadch"
  echo -e "$LINE"
}

safe_calc(){
  echo "scale=$PRECISION;$1" | bc -l 2>/dev/null || echo "Erro"
}

# ==================================================
# MENU PRINCIPAL
# ==================================================
main_menu(){
  header
  echo -e "${G}(1)${Z} Matemática Avançada"
  echo -e "${G}(2)${Z} Infinity Mode ∞"
  echo -e "${G}(3)${Z} Manual Técnico"
  echo
  echo -e "${R}(0)${Z} Sair"
  echo -e "$LINE"
  read -p ">> " op
  case $op in
    1) math_menu ;;
    2) infinity_menu ;;
    3) manual ;;
    0) clear; exit ;;
  esac
}

# ==================================================
# MATEMÁTICA AVANÇADA
# ==================================================
math_menu(){
while true; do
  header
  echo -e "${C}MATEMÁTICA AVANÇADA${Z}"
  echo
  echo -e "${G}(1)${Z} Avaliação Científica"
  echo -e "${G}(2)${Z} Funções Matemáticas"
  echo -e "${G}(3)${Z} Estatística Completa"
  echo -e "${G}(4)${Z} Derivada Numérica"
  echo -e "${G}(5)${Z} Integral Numérica"
  echo -e "${G}(6)${Z} Configurar Precisão"
  echo
  echo -e "${R}(0)${Z} Voltar"
  echo -e "$LINE"
  read -p ">> " op

  case $op in
    1)
      read -p "Expressão >> " e
      echo -e "${Y}Resultado:${Z}"
      safe_calc "$e"
      ;;
    2)
      read -p "Ex: s(1), c(1), l(10), sqrt(2) >> " e
      echo -e "${Y}Resultado:${Z}"
      safe_calc "$e"
      ;;
    3)
      read -p "Valores (1 2 3 ...) >> " v
      awk '{
        for(i=1;i<=NF;i++){a[i]=$i; s+=$i}
        n=NF; m=s/n
        for(i=1;i<=NF;i++)v+=(a[i]-m)^2
        asort(a)
        q1=a[int(n*0.25)]
        q2=a[int(n*0.50)]
        q3=a[int(n*0.75)]
        printf "Média: %.10f\nMediana: %.10f\nQ1: %.10f\nQ3: %.10f\nVariância: %.10f\nDesvio: %.10f\nMin: %.4f\nMax: %.4f\n",
        m,q2,q1,q3,v/n,sqrt(v/n),a[1],a[n]
      }' <<< "$v"
      ;;
    4)
      read -p "f(x) >> " f
      read -p "x >> " x
      r=$(safe_calc "((${f//x/$x})-(${f//x/($x-$DX)}))/$DX")
      echo -e "${Y}Derivada ≈${Z} $r"
      ;;
    5)
      read -p "f(x) >> " f
      read -p "a >> " a
      read -p "b >> " b
      dx=$(safe_calc "($b-$a)/$INTEGRAL_STEPS")
      sum=0
      for ((i=0;i<INTEGRAL_STEPS;i++)); do
        xi=$(safe_calc "$a+$i*$dx")
        sum=$(safe_calc "$sum+(${f//x/$xi})*$dx")
      done
      echo -e "${Y}Integral ≈${Z} $sum"
      ;;
    6)
      read -p "Nova precisão >> " PRECISION
      ;;
    0) break ;;
  esac
  pause
done
}

# ==================================================
# INFINITY MODE
# ==================================================
infinity_menu(){
while true; do
  header
  echo -e "${C}INFINITY MODE ∞${Z}"
  echo
  echo -e "${G}(1)${Z} Identidade & Kernel"
  echo -e "${G}(2)${Z} Processos Ativos"
  echo -e "${G}(3)${Z} CPU & Memória"
  echo -e "${G}(4)${Z} Armazenamento"
  echo -e "${G}(5)${Z} Rede"
  echo -e "${G}(6)${Z} Snapshot Completo"
  echo -e "${G}(7)${Z} Monitoramento Contínuo"
  echo
  echo -e "${R}(0)${Z} Voltar"
  echo -e "$LINE"
  read -p ">> " op

  case $op in
    1) whoami; uname -a; uptime ;;
    2) ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -20 ;;
    3) lscpu | head -10; echo; free -h ;;
    4) df -h ;;
    5)
      ip a
      echo -e "${Y}IP Público:${Z} $(curl -s ifconfig.me)"
      ;;
    6)
      echo -e "${C}[SISTEMA]${Z}"
      uname -a; uptime
      echo -e "${C}[CPU / MEM]${Z}"
      free -h
      echo -e "${C}[DISCO]${Z}"
      df -h
      echo -e "${C}[REDE]${Z}"
      ip a
      echo -e "${Y}IP Público:${Z} $(curl -s ifconfig.me)"
      ;;
    7)
      while true; do
        clear
        echo -e "${C}LIVE MONITOR — CTRL+C para sair${Z}"
        date
        uptime
        free -h | head -2
        sleep 2
      done
      ;;
    0) break ;;
  esac
  pause
done
}

# ==================================================
# MANUAL
# ==================================================
manual(){
  header
  echo -e "${C}MANUAL TÉCNICO${Z}"
  echo
  echo "Ferramenta de observação matemática e sistêmica."
  echo "Projetada para análise, estudo e monitoramento."
  echo
  echo "• Navegação por menus numéricos"
  echo "• Precisão matemática configurável"
  echo "• Leitura completa do sistema"
  echo "• Nenhuma alteração é aplicada ao ambiente"
  pause
}

# ==================================================
# LOOP PRINCIPAL
# ==================================================
while true; do
  main_menu
done
