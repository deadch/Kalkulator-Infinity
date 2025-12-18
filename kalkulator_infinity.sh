#!/data/data/com.termux/files/usr/bin/bash

VERSION="v1.2-INFINITY"

R="\e[31m"; W="\e[97m"; G="\e[32m"; C="\e[36m"
Y="\e[33m"; M="\e[35m"; B="\e[34m"; Z="\e[0m"

pause(){
echo ""
read -p "ENTER para continuar..."
}

banner(){
clear
echo -e "${W}██╗███╗   ██╗███████╗██╗███╗   ██╗██╗████████╗██╗   ██╗"
echo -e "${W}██║████╗  ██║██╔════╝██║████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝"
echo -e "${W}██║██╔██╗ ██║█████╗  ██║██╔██╗ ██║██║   ██║    ╚████╔╝ "
echo -e "${R}██║██║╚██╗██║██╔══╝  ██║██║╚██╗██║██║   ██║     ╚██╔╝  "
echo -e "${R}██║██║ ╚████║██║     ██║██║ ╚████║██║   ██║      ██║   "
echo -e "${R}╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝   ${Z}"
echo -e "${Y}${VERSION}${Z}"
echo -e "${G}by: deadch${Z}"
echo -e "${C}Infinity ∞ — Sistema de Análise Computacional${Z}"
echo "------------------------------------------------------------"
}

calc_menu(){
clear
echo -e "${C}INFINITY :: CALCULADORA AVANÇADA${Z}"
echo "
(1) Básica
(2) Científica
(3) Potências / Log / Raízes
(4) Trigonometria
(5) Constantes Universais
(0) Voltar
"
read -p ">> " c
case $c in
1) read -p "Expressão >> " e; echo "Resultado: $(echo "$e" | sed 's/x/*/g' | bc)"; pause;;
2) read -p "Expressão >> " e; echo "Resultado: $(echo "$e" | bc -l)"; pause;;
3) read -p "Expressão >> " e; echo "Resultado: $(echo "$e" | bc -l)"; pause;;
4) read -p "Expressão >> " e; echo "Resultado: $(echo "$e" | bc -l)"; pause;;
5)
echo "π = $(echo "4*a(1)" | bc -l)"
echo "e = $(echo "e(1)" | bc -l)"
pause;;
0) return;;
esac
calc_menu
}

infinity_mode(){
clear
echo -e "${R}INFINITY MODE ∞ — EXTREME PANEL${Z}"
echo "
(1) Identidade do Sistema
(2) Kernel & Build
(3) Usuário & Sessão
(4) CPU Detalhada
(5) Memória Profunda
(6) Processos Ativos
(7) Armazenamento
(8) Interfaces de Rede
(9) IP Público
(10) Rotas & DNS
(11) Conexões Ativas
(12) Portas Abertas
(13) Variáveis de Ambiente
(14) Android Build
(15) Sensores
(16) Entropia do Sistema
(17) Dispositivos
(18) Logs Recentes
(19) Uptime
(20) Tabela ARP
(21) Socket RAW
(22) Limites do Kernel
(23) Entropia Máxima
(24) Mapa de Memória
(0) Voltar
"
read -p ">> " h
case $h in
1) uname -a;;
2) cat /proc/version;;
3) whoami; id;;
4) cat /proc/cpuinfo;;
5) cat /proc/meminfo;;
6) ps -ef;;
7) df -h;;
8) ip a;;
9) curl -s ifconfig.me;;
10) getprop net.dns1; getprop net.dns2; ip route;;
11) ss -tunap;;
12) ss -tuln;;
13) env;;
14) getprop ro.build.version.release;;
15) dumpsys sensorservice | head;;
16) cat /proc/sys/kernel/random/entropy_avail;;
17) ls /dev | head;;
18) logcat -d | head -n 80;;
19) uptime;;
20) ip neigh;;
21) ss -raw;;
22) ulimit -a;;
23) cat /proc/sys/kernel/random/poolsize;;
24) cat /proc/self/maps | head;;
0) return;;
esac
pause
infinity_mode
}

manual(){
clear
echo -e "${M}INFINITY :: MANUAL${Z}"
echo "
Este sistema observa.
Cada módulo revela um estado.
Nada aqui explica consequências.

A calculadora interpreta.
O painel expõe.
O operador decide.

Nada é oculto.
Nada é filtrado.
Apenas exibido.
"
pause
}

while true; do
banner
echo "
(1) Calculadora Avançada
(2) Infinity Mode ∞
(3) Manual
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
