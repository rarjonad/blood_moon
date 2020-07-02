clear
nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/victory.wav >/dev/null 2>&1 &
echo ""
echo -e "\t\t\tEnhorabuena, has completado el juego"
echo -e "\t\t\t          A WINNER IS YOU!"
echo ""
echo ""
echo -e "\t\t     Estas son las estadísticas finales para \e[1;92m$PL_NAME\e[0m"
echo ""
echo -e "\t\t\t  ╔═══════════════════════════════╗"
echo -e "\t\t\t  ║ NIVEL ║ PROFIENCIA ║  ESENCIA ║"
echo -e "\t\t\t  ║════════════════════║══════════║"
echo -e "\t\t\t  ║   $PL_LVL   ║     +$PL_PROF     ║   $PL_EXP    ║"
echo -e "\t\t\t  ╚═══════════════════════════════╝"
echo -e "\t\t\t╔════════════════════════════════════╗"
echo -e "\t\t\t║ Vida: \e[1;32m$PL_HP/$PL_HP_MAX\e[0m ║ Armadura: $PL_ARMOR ║ AC: \e[1;100m$PL_C_AC\e[0m ║"
if [ $PL_CLASS = "Mago" ]
  then
    echo -e "\t\t\t║════════════════════════════════════║"
    echo -e "\t\t\t║ Maná: \e[1;34m$PL_MANA_CURRENT/$PL_MANA_MAX\e[0m Regeneración: \e[1;36m$PL_C_MANA_REGEN\e[0m\t     ║"
    echo -e "\t\t\t║ Spell DC: \e[1;36m$PL_C_SPELL_DC\e[0m\t\t\t     ║"
    echo -e "\t\t\t╚════════════════════════════════════╝"
  else
    echo -e "\t\t\t╚════════════════════════════════════╝"
fi
echo -e "\t\t\t       ╔═════════════════╗"
echo -e "\t\t\t       ║  STATS  ║  MOD  ║"
echo -e "\t\t\t       ║═════════════════║"
echo -e "\t\t\t       ║STR: $PL_STR\t ║   $PL_STR_MOD\t ║"
echo -e "\t\t\t       ║DEX: $PL_DEX\t ║   $PL_DEX_MOD\t ║"
echo -e "\t\t\t       ║CON: $PL_CON\t ║   $PL_CON_MOD\t ║"
echo -e "\t\t\t       ║INT: $PL_INT\t ║   $PL_INT_MOD\t ║"
echo -e "\t\t\t       ║WIS: $PL_WIS\t ║   $PL_WIS_MOD\t ║"
echo -e "\t\t\t       ║CHA: $PL_CHA\t ║   $PL_CHA_MOD\t ║"
echo -e "\t\t\t       ╚═════════════════╝"
echo ""
sed -i s/GAUNTLET=0/GAUNTLET=1/g g
echo -e "\t\t        Pulsa intro para volver al menú principal"
read -p ""