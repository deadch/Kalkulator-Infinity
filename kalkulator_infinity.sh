#!/data/data/com.termux/files/usr/bin/bash
# ==========================================================
# INFINITY ∞ — Sistema de Análise Computacional
# Versão: v1.5-stable
# Autor: deadch
# ==========================================================

VERSION="v1.5-stable"
SCALE=40
H=0.00001

# ===== CORES =====
R="\e[31m"; G="\e[32m"; Y="\e[33m"
B="\e[34m"; M="\e[35m"; C="\e[36m"
W="\e[97m"; Z="\e[0m"

pause(){ echo; read -p "ENTER para continuar..."; }

require(){
  command -v "$1" >/dev/null 2>&1 || {
    echo -e "${R}Dependência ausente:${Z} $1"
    exit 1
  }
}

init(){
  clear
  for c in bc awk curl ip free df ps uptime ss; do require $c; done
}

# ===== BANNER =====
banner(){
clear
cat <<EOF
${W}██╗███╗   ██╗███████╗██╗███╗   ██╗██╗████████╗██╗   ██╗
██║████╗  ██║██╔════╝██║████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝
██║██╔██╗ ██║█████╗  ██║██╔██╗ ██║██║   ██║    ╚████╔╝ 
██║██║╚██╗██║██╔══╝  ██║██║╚██╗██║██║   ██║     ╚██╔╝  
██║██║ ╚████║██║     ██║██║ ╚████║██║   ██║      ██║   
╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝   
${Y}${VERSION}${Z}  ${G}by: deadch${Z}
${C}Infinity ∞ — Sistema de Análise Computacional${Z}
------------------------------------------------------------
EOF
}

# ================= MATEMÁTICA =================
calc_menu(){
while true; do
clear
echo -e "${C}INFINITY :: MATEMÁTICA AVANÇADA${Z}"
cat <<EOF
(1) Básica / Científica
(2) Potências, Raízes, Logs, Trig
(3) Fatorial
(4) Estatística Completa
(5) Conversões Numéricas
(6) PA / PG
(7) Derivada Numérica
(8) Integral Numérica
(9) Matrizes 2x2
(10) Constantes
(11) Ajustar Precisão
(0) Voltar
EOF
read -p ">> " c

case $c in
1)
  read -p "Expressão >> " e
  echo "Resultado: $(echo "scale=$SCALE;$e" | sed 's/x/*/g' | bc -l)"
;;
2)
  read -p "Ex: sqrt(2), l(10), s(1) >> " e
  echo "Resultado: $(echo "scale=$SCALE;$e" | bc -l)"
;;
3)
  read -p "n! >> " n
  echo "Resultado: $(echo "define f(x){if(x<=1)return 1;x*f(x-1)};f($n)" | bc)"
;;
4)
  read -p "Valores (1 2 3 ...) >> " v
  echo "Média: $(echo "$v" | awk '{for(i=1;i<=NF;i++)s+=$i;print s/NF}')"
  echo "Mediana: $(echo "$v" | tr ' ' '\n' | sort -n | awk '{a[NR]=$1} END{print (NR%2)?a[(NR+1)/2]:(a[NR/2]+a[NR/2+1])/2}')"
  echo "Desvio Padrão: $(echo "$v" | awk '{for(i=1;i<=NF;i++){s+=$i;a[i]=$i}m=s/NF;for(i=1;i<=NF;i++)v+=(a[i]-m)^2;print sqrt(v/NF)}')"
;;
5)
  read -p "Decimal >> " n
  echo "Binário: $(echo "obase=2;$n" | bc)"
  echo "Hex: $(echo "obase=16;$n" | bc)"
;;
6)
  read -p "PA ou PG (pa/pg) >> " t
  read -p "a1 >> " a
  read -p "r >> " r
  read -p "n >> " n
  [[ $t == "pa" ]] && echo "Soma PA: $((n*(2*a+(n-1)*r)/2))" \
    || echo "Soma PG: $(echo "scale=$SCALE;$a*(1-$r^$n)/(1-$r)" | bc -l)"
;;
7)
  read -p "f(x) >> " f
  read -p "x >> " x
  echo "Derivada ≈ $(echo "scale=$SCALE;( (${f//x/$x})-(${f//x/($x-$H)}) )/$H" | bc -l)"
;;
8)
  read -p "f(x) >> " f
  read -p "a >> " a
  read -p "b >> " b
  n=500
  dx=$(echo "scale=$SCALE;($b-$a)/$n" | bc -l)
  sum=0
  for ((i=0;i<n;i++)); do
    xi=$(echo "scale=$SCALE;$a+$i*$dx" | bc -l)
    sum=$(echo "scale=$SCALE;$sum+(${f//x/$xi})*$dx" | bc -l)
  done
  echo "Integral ≈ $sum"
;;
9)
  echo "Matriz A (a b c d):"; read a b c d
  echo "Matriz B (e f g h):"; read e f g h
  echo "Soma:"
  echo "$((a+e)) $((b+f))"
  echo "$((c+g)) $((d+h))"
  echo "Multiplicação:"
  echo "$((a*e+b*g)) $((a*f+b*h))"
  echo "$((c*e+d*g)) $((c*f+d*h))"
;;
10)
  echo "π=$(echo "scale=25;4*a(1)" | bc -l)"
  echo "e=$(echo "scale=25;e(1)" | bc -l)"
  echo "φ=$(echo "scale=25;(1+sqrt(5))/2" | bc -l)"
;;
11)
  read -p "Novo scale >> " SCALE
;;
0) break;;
esac
pause
done
}

# ================= INFINITY MODE EXTREMO =================
infinity_mode(){
while true; do
clear
echo -e "${R}INFINITY MODE ∞ — OBSERVAÇÃO TOTAL DO SISTEMA${Z}"
cat <<EOF
(1) Identidade & Estado
(2) Kernel & Arquitetura
(3) CPU Profunda
(4) Memória Detalhada
(5) Armazenamento & IO
(6) Processos Ativos
(7) Load & Threads
(8) Rede Completa
(9) Conexões & Portas
(10) Rotas & DNS
(11) Ambiente & Limites
(12) Entropia
(13) Dispositivos
(14) Snapshot Técnico
(0) Voltar
EOF
read -p ">> " h

case $h in
1) whoami; hostname; uptime -p;;
2) uname -a; cat /proc/version;;
3) cat /proc/cpuinfo;;
4) free -h; cat /proc/meminfo;;
5) df -h; cat /proc/diskstats | head;;
6) ps -eo pid,ppid,comm,%cpu,%mem --sort=-%cpu | head;;
7) cat /proc/loadavg; ps -eLf | wc -l;;
8) ip a;;
9) ss -tunap;;
10) ip route; getprop net.dns1; getprop net.dns2;;
11) env; ulimit -a;;
12) cat /proc/sys/kernel/random/entropy_avail;;
13) ls /dev | head;;
14)
  uname -a
  uptime
  free -h
  df -h
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head
  echo "IP Público: $(curl -s ifconfig.me)"
;;
0) break;;
esac
pause
done
}

# ================= MANUAL EXTREMO =================
manual(){
clear
cat <<EOF
${M}INFINITY :: MANUAL TÉCNICO DE OPERAÇÃO${Z}

Infinity é um sistema de observação computacional.

Não executa ações corretivas.
Não modifica estados internos.
Não interfere em processos.
Não toma decisões.

Todos os dados apresentados
refletem o estado bruto do sistema
no instante da consulta.

────────────────────────────────

MÓDULO MATEMÁTICO
Resolve expressões, séries,
estatísticas e aproximações numéricas.
Nenhuma interpretação é aplicada.

────────────────────────────────

INFINITY MODE
Exibe arquitetura, processos,
uso de recursos, rede, entropia,
dispositivos e limites operacionais.

Nada é filtrado.
Nada é suavizado.
Nada é omitido.

────────────────────────────────

RESPONSABILIDADE
A leitura pertence ao operador.
A decisão é externa ao sistema.

Infinity observa.
Nada além disso.
EOF
pause
}

# ================= MAIN =================
init
while true; do
banner
echo "
(1) Matemática Avançada
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
