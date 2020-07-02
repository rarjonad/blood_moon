clear
echo ""
GAMEOVER_SND=$[RANDOM%3+1]
nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/gameover/aglimpseofhell_$GAMEOVER_SND.wav >/dev/null 2>&1 &
echo ""
echo ""
echo ""
echo -e '\t\t\t\e[1;91m    ▄████  ▄▄▄       ███▄ ▄███▓▓█████ '
echo -e '\t\t\t   ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀ '
echo -e '\t\t\t  ▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███   '
echo -e '\t\t\t  ░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄ '
echo -e '\t\t\t  ░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒'
echo -e '\t\t\t   ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░'
echo -e '\t\t\t    ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░'
echo -e '\t\t\t  ░ ░   ░   ░   ▒   ░      ░      ░   '
echo -e '\t\t\t        ░       ░  ░       ░      ░  ░'
echo -e '\t\t\t                                      '
echo -e '\t\t\t   ▒█████   ██▒   █▓▓█████  ██▀███    '
echo -e '\t\t\t  ▒██▒  ██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒  '
echo -e '\t\t\t  ▒██░  ██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒  '
echo -e '\t\t\t  ▒██   ██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄    '
echo -e '\t\t\t  ░ ████▓▒░   ▒▀█░  ░▒████▒░██▓ ▒██▒  '
echo -e '\t\t\t  ░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░░ ▒▓ ░▒▓░  '
echo -e '\t\t\t    ░ ▒ ▒░    ░ ░░   ░ ░  ░  ░▒ ░ ▒░  '
echo -e '\t\t\t  ░ ░ ░ ▒       ░░     ░     ░░   ░   '
echo -e '\t\t\t      ░ ░        ░     ░  ░   ░       '
echo -e '\t\t\t                ░                    \e[0m'
echo ""
echo ""
echo ""
echo -e "\t\t\tPulsa intro para volver al menú principal"
read -p ""