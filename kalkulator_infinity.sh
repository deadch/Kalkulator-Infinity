#!/data/data/com.termux/files/usr/bin/bash

# ==========================================================
# INFINITY ∞ — Sistema de Análise Computacional
# Versão: v1.3-stable
# Autor: deadch
# ==========================================================

VERSION="v1.3-stable"
SCALE=40

# ===== CORES =====
R="\e[31m"; G="\e[32m"; Y="\e[33m"
B="\e[34m"; M="\e[35m"; C="\e[36m"
W="\e[97m"; Z="\e[0m"

# ===== UTIL =====
pause(){ echo; read -p "ENTER para continuar..."; }

require(){
  command -v "$1" >/dev/null 2>&1 || {
    echo -e "${R}Dependência ausente:${Z} $1"
    exit 1
  }
}

init(){
  clear
  require bc
  require curl
  require ip
}

# ===== BANNER =====
banner(){
clear
echo -e "${W}██╗███╗   ██╗███████╗██╗███╗   ██╗██╗████████╗██╗   ██╗"
echo -e "${W}██║████╗  ██║██╔════╝██║████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝"
echo -e "${W}██║██╔██╗ ██║█████╗  ██║██╔██╗ ██║██║   ██║    ╚████╔╝ "
echo -e "${R}██║██║╚██╗██║██╔══╝  ██║██║╚██╗██║██║   ██║     ╚██╔╝  "
echo -e "${R}██║██║ ╚████║██║     ██║██║ ╚████║██║   ██║      ██║   "
echo -e "${R}╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝   ${Z}"
echo -e "${Y}${VERSION}${Z}  ${G}by: deadch${Z}"
echo -e "${C}Infinity ∞ — Sistema de Análise Computacional${Z}"
echo "------------------------------------------------------------"
}

# ================= CALCULADORA =================
calc_menu(){
clear
echo -e "${C}INFINITY :: CALCULADORA AVANÇADA${Z}"
echo "
(1) Básica
(2) Científica (alta precisão)
(3) Potências & Raízes
(4) Logaritmos & Trigonometria
(5) Fatorial
(6) Estatística Completa
(7) Conversões Numéricas
(8) Progressões
(9) Constantes Universais
(0) Voltar
"
read -p ">> " c

case $c in
1) read -p "Expressão >> " e; echo "Resultado: $(echo "$e" | sed 's/x/*/g' | bc)";;
2) read -p "Expressão >> " e; echo "Resultado: $(echo "scale=$SCALE;$e" | bc -l)";;
3) read -p "Ex: 2^10 | sqrt(2) >> " e; echo "Resultado: $(echo "$e" | bc -l)";;
4) read -p "Ex: l(10) s(1) c(1) >> " e; echo "Resultado: $(echo "$e" | bc -l)";;
5) read -p "n! >> " n; echo "Resultado: $(echo "define f(x){if(x<=1)return 1;return x*f(x-1)};f($n)" | bc)";;
6)
  read -p "Valores >> " v
  echo "Média: $(echo "$v" | awk '{s=0;for(i=1;i<=NF;i++)s+=$i;print s/NF}')"
  echo "Mínimo: $(echo "$v" | tr ' ' '\n' | sort -n | head -1)"
  echo "Máximo: $(echo "$v" | tr ' ' '\n' | sort -n | tail -1)"
;;
7)
  read -p "Número decimal >> " n
  echo "Binário: $(echo "obase=2;$n" | bc)"
  echo "Hex: $(echo "obase=16;$n" | bc)"
;;
8)
  read -p "n termos >> " n
  echo "Soma 1..n = $((n*(n+1)/2))"
;;
9)
  echo "π = $(echo "scale=25;4*a(1)" | bc -l)"
  echo "e = $(echo "scale=25;e(1)" | bc -l)"
  echo "φ = $(echo "scale=25;(1+sqrt(5))/2" | bc -l)"
  echo "c = 299792458 m/s"
;;
0) return;;
esac
pause
calc_menu
}

# ================= INFINITY MODE ULTRA =================
infinity_mode(){
clear
echo -e "${R}INFINITY MODE ∞ — OBSERVAÇÃO TOTAL${Z}"
echo "
(1) Sistema
(2) Kernel & Build
(3) Uptime & Load
(4) Limites
(5) CPU
(6) Memória
(7) Armazenamento
(8) Dispositivos
(9) Processos
(10) Threads
(11) Top CPU/Memória
(12) Interfaces de Rede
(13) IP Público
(14) Conexões
(15) Portas
(16) Rotas & DNS
(17) ARP
(18) Ambiente
(19) Entropia
(20) Mapa de Memória
(21) IO do Sistema
(22) Logs
(23) Snapshot Geral
(0) Voltar
"
read -p ">> " h

case $h in
1) uname -a;;
2) cat /proc/version; getprop ro.build.version.release;;
3) uptime; cat /proc/loadavg;;
4) ulimit -a;;
5) cat /proc/cpuinfo;;
6) cat /proc/meminfo;;
7) df -h;;
8) ls /dev | head -40;;
9) ps -ef;;
10) ps -T;;
11)
  ps -eo pid,comm,%cpu --sort=-%cpu | head
  echo
  ps -eo pid,comm,%mem --sort=-%mem | head
;;
12) ip a;;
13) curl -s ifconfig.me;;
14) ss -tunap;;
15) ss -tuln;;
16) ip route; getprop net.dns1; getprop net.dns2;;
17) ip neigh;;
18) env;;
19) cat /proc/sys/kernel/random/entropy_avail;;
20) cat /proc/self/maps | head -40;;
21) cat /proc/diskstats;;
22) logcat -d | head -100;;
23)
  echo "Usuário: $(whoami)"
  echo "Sistema: $(uname -o)"
  echo "Kernel: $(uname -r)"
  echo "Uptime: $(uptime -p)"
  echo "Carga: $(cat /proc/loadavg)"
  echo "IP Público: $(curl -s ifconfig.me)"
;;
0) return;;
esac
pause
infinity_mode
}

# ================= MANUAL =================
manual(){
clear
echo -e "${M}INFINITY :: MANUAL TÉCNICO${Z}"
echo "
Infinity é um sistema de observação computacional.

Não altera estados.
Não executa ações.
Não interfere em processos.

Todos os dados refletem o estado real
do sistema no momento da consulta.

A matemática resolve.
O painel revela.
A interpretação é externa.

Infinity observa.
Nada além disso.
"
pause
}

# ================= MAIN =================
init
while true; do
banner
echo "
(1) Calculadora Avançada
(2) Infinity Mode ∞
(3) Manual Técnico
(0) Sair
"
read -p ">> " op
case $op in
1) calc_menu;;
2) infinity_mode;;
3) manual;;
0) clear; exit;;
esac
done
