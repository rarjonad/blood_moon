#!/bin/bash
### Definicion de funciones ###
## Chargen ##
function CHARGEN_NAME {
clear
VAR=0
while [ "$VAR" -ne 1 ]; do
	clear
	echo ""
	echo "Elige el nombre de su personaje"
	echo ""
	read -p 'NOMBRE: ' PL_NAME
	clear
	echo ""
	echo -e "El nombre de su personaje es [ \e[1;92m"$PL_NAME"\e[0m ]."
	echo ""
	echo "¿Estás de acuerdo? Pulsa [S] para continuar o cualquier otra tecla para introducirlo de nuevo."
	echo ""
	read -p '> ' VAR
	if [ "$VAR" = "S" ] || [ "$VAR" = "s" ]; then
		VAR=1
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
	else
		VAR=0
	fi
done
}

function CHARGEN_RACE {
clear
VAR=0
while [ "$VAR" -ne 1 ]; do
	clear
	echo
	echo -e "Elige una raza para \e[1;92m$PL_NAME\e[0m."
	echo
	echo -e "╔══════════════════════════════════════════════════════════════════════════╗"
	echo -e "║     ║    HUMANO    ║     ELFO     ║     ENANO    ║                       ║"
	echo -e "║══════════════════════════════════════════════════════════════════════════║"
	echo -e "║ STR │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ ▄▄▄ ▄▄▄ \e[39m │ Fuerza                ║"
	echo -e "║ DEX │ \e[92m▄▄▄ ▄▄▄ ▄▄▄ \e[39m │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ Dexteridad            ║"
	echo -e "║ CON │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ ▄▄▄ ▄▄▄ \e[39m │ Constitución          ║"
	echo -e "║ INT │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ ▄▄▄ ▄▄▄ \e[39m │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ Inteligencia          ║"
	echo -e "║ WIS │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ ▄▄▄ ▄▄▄ \e[39m │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ Wisdom                ║"
	echo -e "║ CHA │ \e[92m▄▄▄ ▄▄▄ ▄▄▄ \e[39m │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ \e[92m▄▄▄ \e[39m▄▄▄ ▄▄▄  │ Carisma               ║"
	echo -e "╚══════════════════════════════════════════════════════════════════════════╝"
	echo
	echo "   1 ) Humano"
	echo "   2 ) Elfo"
	echo "   3 ) Enano"
	echo
	read -p 'Raza: ' PL_RACE
	clear
	echo
	if [ "$PL_RACE" = "1" ]; then
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
		echo -e "La raza elegida para $PL_NAME es [ \e[1;96mHUMANO\e[0m ]."
		PL_RACE="Humano"
		STR_RACE_MOD=0
		DEX_RACE_MOD=2
		CON_RACE_MOD=0
		INT_RACE_MOD=0
		WIS_RACE_MOD=0
		CHA_RACE_MOD=2
	fi
	if [ "$PL_RACE" = "2" ]; then
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
		echo -e "La raza elegida para $PL_NAME es [ \e[1;96mELFO\e[0m ]."
		PL_RACE="Elfo"
		STR_RACE_MOD=0
		DEX_RACE_MOD=0
		CON_RACE_MOD=0
		INT_RACE_MOD=2
		WIS_RACE_MOD=2
		CHA_RACE_MOD=0
	fi
	if [ "$PL_RACE" = "3" ]; then
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
		echo -e "La raza elegida para $PL_NAME es [ \e[1;96mENANO\e[0m ]."
		PL_RACE="Enano"
		STR_RACE_MOD=2
		DEX_RACE_MOD=0
		CON_RACE_MOD=2
		INT_RACE_MOD=0
		WIS_RACE_MOD=0
		CHA_RACE_MOD=0
	fi
	if [ "$PL_RACE" != "Humano" ]; then
		if [ "$PL_RACE" != "Elfo" ]; then
			if [ "$PL_RACE" != "Enano" ]; then
				echo
				echo "Escoge, por favor, una raza de las indicadas:  [1] [2] [3]"
				echo
				read -p "Pulsa una tecla para volver a intentarlo..." PAUSE
				VAR=0
			else
				VAR=1
			fi
		else
			VAR=1
		fi
	else
		VAR=1
	fi
	if [ "$VAR" = 1 ]; then
		# RAZA ELEGIDA CORRECTAMENTE
		echo
		echo "¿Estás de acuerdo? Pulse [S] para continuar o cualquier otra tecla para introducirlo de nuevo."
		echo
		read -p '> ' VAR
		if [ "$VAR" = "S" ] || [ "$VAR" = "s" ]; then
      nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
			VAR=1
		else
			VAR=0
		fi
	else
		# VOLVER A INTRODUCIR RAZA
		echo
	fi
done
}

function CHARGEN_CLASS {
clear
VAR=0
while [ "$VAR" -ne 1 ]; do
	clear
	echo
	echo -e "Elige una clase para \e[1;92m$PL_NAME\e[0m."
	echo
	echo -e "╔══════════════════════════════════════════════════════════════════════════╗"
	echo -e "║     ║   GUERRERO   ║    PÍCARO    ║     MAGO     ║                       ║"
	echo -e "║══════════════════════════════════════════════════════════════════════════║"
	echo -e "║ WPN │   MARTILLO   │     DAGA     │     MAGIA    │  ARMA DEL PERSONAJE   ║"
	echo -e "║ DICE│ \e[92m▌\e[39m▌▌▌▌▌▌▌▌▌▌▌ │ \e[92m▌▌▌\e[39m▌▌▌▌▌▌▌▌▌ │ \e[92m▌▌\e[39m▌▌▌▌▌▌▌▌▌▌ │   GOLPES DEL ARMA     ║"
	echo -e "║┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄║"
	echo -e "║ WPN │              │              │              │                       ║"
	echo -e "║ DMG │ \e[92m▌▌▌▌▌▌▌▌▌▌▌▌\e[39m │ \e[92m▌▌▌▌\e[39m▌▌▌▌▌▌▌▌ │ \e[92m▌▌▌▌▌▌\e[39m▌▌▌▌▌▌ │    DAÑO DEL ARMA      ║"
	echo -e "╚══════════════════════════════════════════════════════════════════════════╝"
	echo
	echo "   1 ) Guerrero"
	echo "   2 ) Pícaro"
	echo "   3 ) Mago"
	echo
	read -p 'Clase: ' PL_CLASS
	clear
	echo
	if [ "$PL_CLASS" = "1" ]; then
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
		echo -e "La clase elegida es [ \e[1;96mGUERRERO\e[0m ]."
		PL_CLASS="Guerrero"
		PL_WPN="mace"
    PL_HP_DICE=12
    PL_ARMOR=5
    PL_WPN_DICE=1
    PL_WPN_DMG=12
		fi
	if [ "$PL_CLASS" = "2" ]; then
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
		echo -e "La clase elegida es [ \e[1;96mPÍCARO\e[0m ]."
		PL_CLASS="Picaro"
		PL_WPN="dagger"
    PL_HP_DICE=8
    PL_ARMOR=3
    PL_WPN_DICE=3
    PL_WPN_DMG=4
	fi
	if [ "$PL_CLASS" = "3" ]; then
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
		echo -e "La clase elegida es [ \e[1;96mMAGO\e[0m ]."
    PL_CLASS="Mago"
		PL_WPN="magic"
    PL_HP_DICE=6
    PL_ARMOR=0
    PL_WPN_DICE=2
    PL_WPN_DMG=6
    PL_MANA_CURRENT=100
    PL_MANA_MAX=100
	fi
	if [ "$PL_CLASS" != "Guerrero" ]; then
		if [ "$PL_CLASS" != "Picaro" ]; then
			if [ "$PL_CLASS" != "Mago" ]; then
				echo
				echo "Escoge, por favor, una clase de las indicadas:  [1] [2] [3]"
				echo
				read -p "Pulsa una tecla para volver a intentarlo..." PAUSE
				VAR=0
			else
				VAR=1
			fi
		else
			VAR=1
		fi
	else
		VAR=1
	fi
	if [ "$VAR" = 1 ]; then
		# CLASE ELEGIDA CORRECTAMENTE
		echo
		echo "¿Estás de acuerdo? Pulse [S] para continuar o cualquier otra tecla para introducirlo de nuevo."
		echo
		read -p '> ' VAR
		if [ "$VAR" = "S" ] || [ "$VAR" = "s" ]; then
      nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
			VAR=1
		else
			VAR=0
		fi
	else
		# VOLVER A INTRODUCIR CLASE
		echo
	fi
done
}

function CHARGEN_STATS {
STAT_GENERATION=1
while [ $STAT_GENERATION -eq 1 ]
  do
    clear
    for i in {0..3}; do
      STAT_GEN0[i]=$[RANDOM%6+1]
    done
    for i in {0..3}; do
      STAT_GEN1[i]=$[RANDOM%6+1]
    done
    for i in {0..3}; do
      STAT_GEN2[i]=$[RANDOM%6+1]
    done
    for i in {0..3}; do
      STAT_GEN3[i]=$[RANDOM%6+1]
    done
    for i in {0..3}; do
      STAT_GEN4[i]=$[RANDOM%6+1]
    done
    for i in {0..3}; do
      STAT_GEN5[i]=$[RANDOM%6+1]
    done
    STAT_GEN0_SORTED=($(echo ${STAT_GEN0[@]} | tr " " "\n" | sort -n))
    STAT_GEN1_SORTED=($(echo ${STAT_GEN1[@]} | tr " " "\n" | sort -n))
    STAT_GEN2_SORTED=($(echo ${STAT_GEN2[@]} | tr " " "\n" | sort -n))
    STAT_GEN3_SORTED=($(echo ${STAT_GEN3[@]} | tr " " "\n" | sort -n))
    STAT_GEN4_SORTED=($(echo ${STAT_GEN4[@]} | tr " " "\n" | sort -n))
    STAT_GEN5_SORTED=($(echo ${STAT_GEN5[@]} | tr " " "\n" | sort -n))
    STAT_GEN_STR=$((${STAT_GEN0_SORTED[1]} + ${STAT_GEN0_SORTED[2]} + ${STAT_GEN0_SORTED[3]} ))
    STAT_GEN_DEX=$((${STAT_GEN1_SORTED[1]} + ${STAT_GEN1_SORTED[2]} + ${STAT_GEN1_SORTED[3]} ))
    STAT_GEN_CON=$((${STAT_GEN2_SORTED[1]} + ${STAT_GEN2_SORTED[2]} + ${STAT_GEN2_SORTED[3]} ))
    STAT_GEN_INT=$((${STAT_GEN3_SORTED[1]} + ${STAT_GEN3_SORTED[2]} + ${STAT_GEN3_SORTED[3]} ))
    STAT_GEN_WIS=$((${STAT_GEN4_SORTED[1]} + ${STAT_GEN4_SORTED[2]} + ${STAT_GEN4_SORTED[3]} ))
    STAT_GEN_CHA=$((${STAT_GEN5_SORTED[1]} + ${STAT_GEN5_SORTED[2]} + ${STAT_GEN5_SORTED[3]} ))
    echo ""
    echo "Generando atributos aleatorios..."
    echo ""
    if [[ $VERBOSE = "v" ]]
      then
        echo "       Dice  │  Sorted │ Result"
        echo "STR: ${STAT_GEN0[@]} │ ${STAT_GEN0_SORTED[@]} │  $STAT_GEN_STR"
        echo "DEX: ${STAT_GEN1[@]} │ ${STAT_GEN1_SORTED[@]} │  $STAT_GEN_DEX"
        echo "CON: ${STAT_GEN2[@]} │ ${STAT_GEN2_SORTED[@]} │  $STAT_GEN_CON"
        echo "INT: ${STAT_GEN3[@]} │ ${STAT_GEN3_SORTED[@]} │  $STAT_GEN_INT"
        echo "WIS: ${STAT_GEN4[@]} │ ${STAT_GEN4_SORTED[@]} │  $STAT_GEN_WIS"
        echo "CHA: ${STAT_GEN5[@]} │ ${STAT_GEN5_SORTED[@]} │  $STAT_GEN_CHA"
        echo "Resultado total:"
        echo ""
    fi
    echo -e "\tFuerza    \t$STAT_GEN_STR \t│Bonus por raza: $STR_RACE_MOD"
    echo -e "\tDexteridad \t$STAT_GEN_DEX \t│Bonus por raza: $DEX_RACE_MOD"
    echo -e "\tConstitución \t$STAT_GEN_CON \t│Bonus por raza: $CON_RACE_MOD"
    echo -e "\tInteligencia \t$STAT_GEN_INT \t│Bonus por raza: $INT_RACE_MOD"
    echo -e "\tSabiduría \t$STAT_GEN_WIS \t│Bonus por raza: $WIS_RACE_MOD"
    echo -e "\tCarisma \t$STAT_GEN_CHA \t│Bonus por raza: $CHA_RACE_MOD"
    echo ""
    echo "¿Estás conforme con los resultados? [S] para aceptar, cualquier otra letra para recalcular"
    read -p "> " STAT_CONFIRM
    if [ "$STAT_CONFIRM" = "s" ] || [ "$STAT_CONFIRM" = "S" ]
      then
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
        STAT_GENERATION=0
    fi
  done
## testeo ##
# PL_CLASS="Mago"
# PL_BASE_AC=10
# PL_HP_MAX=26
# PL_HP=1
# PL_STR=18
# PL_DEX=14
# PL_CON=16
# PL_INT=12
# PL_WIS=14
# PL_CHA=10
# PL_ARMOR=3
# PL_WPN_DICE=2
# PL_WPN_DMG=8
# PL_MANA_CURRENT=81
# PL_MANA_MAX=100
## testeo ##
#### Establecer estadisticas finales ###
PL_BASE_AC=10
PL_STR=$(($STAT_GEN_STR + $STR_RACE_MOD))
PL_DEX=$(($STAT_GEN_DEX + $DEX_RACE_MOD))
PL_CON=$(($STAT_GEN_CON + $CON_RACE_MOD))
PL_INT=$(($STAT_GEN_INT + $INT_RACE_MOD))
PL_WIS=$(($STAT_GEN_WIS + $WIS_RACE_MOD))
PL_CHA=$(($STAT_GEN_CHA + $CHA_RACE_MOD))
PL_PROF=$((($PL_LVL / 4) + 2 ))
PL_MODIFIERS_REFRESH
PL_HP_MAX=$((($PL_HP_DICE + $PL_CON_MOD) * $PL_LVL))
PL_HP=$PL_HP_MAX
PL_WPN_UPGRADE_BONUS=0
PL_EXP=0
PL_C_STATUS="OK"
}

## Funciones lógicas ##
# Encapsula el combate entero en un while #
function BATTLE {
COMBAT_END_FLAG=0
FLEE_FLAG=0
PL_C_STATUS="OK"
PL_C_DEBUFF_COUNT=0
PL_C_STAT_ASSIGN
PL_C_STAT_REFRESH
if [ $PL_CLASS = "Mago" ]
  then
    if [ $PL_MANA_CURRENT -lt $PL_MANA_MAX ]
      then
        PL_MANA_CURRENT=$(($PL_MANA_CURRENT + ($PL_MANA_MAX / 4)))
          if [ $PL_MANA_CURRENT -gt $PL_MANA_MAX ]
            then
              PL_MANA_CURRENT=$PL_MANA_MAX
          fi
    fi
fi
TURN=1
NPC_FETCH
### Determinar primer turno ###
PL_C_INI_DICE=$[RANDOM%20+1]
if [[ $VERBOSE = "v" ]]
  then
  echo -e "Resultado INI \e[1;92m$PL_NAME\e[0m: $PL_C_INI_DICE (Modificador por sumar $PL_INI_MOD)"
fi
PL_C_INI=$(($PL_C_INI_DICE + $PL_INI_MOD))
NPC_C_INI=$(($NPC_C_DEX_MOD + $[RANDOM%20+1]))
if [[ $VERBOSE = "v" ]]
  then
  echo -e "Resultado INI \e[1;92m$PL_NAME\e[0m: $PL_C_INI VS \e[1;91m$NPC_NAME\e[0m: $NPC_C_INI"
  read -p "         Pulsa Enter             "
fi
read -p "         Pulsa Enter             "
echo ""
while [ $PL_C_INI -eq $NPC_C_INI ]
  do
    echo "Empate en las iniciativas, volviendo a calcular..."
    echo ""
    PL_C_INI_DICE=$[RANDOM%20+1]
    PL_C_INI=$(($PL_C_INI_DICE + $PL_INI_MOD))
    NPC_C_INI=$(($NPC_C_DEX_MOD + $[RANDOM%20+1]))
    echo -e "La tirada de Iniciativa de \e[1;92m$PL_NAME\e[0m es $PL_C_INI_DICE"
    echo -e "El modificador de Iniciativa de \e[1;92m$PL_NAME\e[0m es $PL_INI_MOD"
    echo -e "La iniciativa total de \e[1;92m$PL_NAME\e[0m es $PL_C_INI"
    echo ""
    echo -e "La iniciativa de \e[1;91m$NPC_NAME\e[0m es $NPC_C_INI"
    echo ""
    read -p "         Pulsa Enter             "
    echo ""
  done
clear
echo "Comienza el combate"
if [ $PL_C_INI -gt $NPC_C_INI ]
  then
    COMBAT_FIRST="PL"
    echo -e "Empieza \e[1;92m$PL_NAME\e[0m"
    echo ""
    read -p "         Pulsa Enter             "
    echo ""
elif [ $NPC_C_INI -gt $PL_C_INI ]
  then
    COMBAT_FIRST="NPC"
    echo -e "Empieza \e[1;91m$NPC_NAME\e[0m"
    echo ""
    read -p "         Pulsa Enter             "
    echo ""
  else
    echo "Stop breaking things"
    exit
fi 
### Loop While Combate ###
while [ $NPC_C_HP -gt 0 ] && [ $PL_HP -gt 0 ] && [ $FLEE_FLAG -eq 0 ];
  do 
    if [ $COMBAT_FIRST = "PL" ]
      then
        if [ $PL_C_STATUS = "Envenenado" ]
          then
            PL_POISONED_STATUS
        fi
        if [ $COMBAT_END_FLAG -eq 0 ]
          then
            PL_TURN
            COMBAT_CHECK
        fi
        if [ $COMBAT_END_FLAG -eq 0 ] 
          then
            COMBAT_SCREEN
            NPC_TURN
            COMBAT_CHECK
            let "TURN+=1"
        fi
    elif [ $COMBAT_FIRST = "NPC" ]
      then
        COMBAT_SCREEN
        NPC_TURN
        COMBAT_CHECK
        if [ $COMBAT_END_FLAG -eq 0 ] 
          then
            if [ $PL_C_STATUS = "Envenenado" ]
              then
                PL_POISONED_STATUS
            fi
            if [ $COMBAT_END_FLAG -eq 0 ]
              then
                PL_TURN
                COMBAT_CHECK
                let "TURN+=1"
            fi
        fi
    else
      echo "Fallo al establecer turno inicial"
      exit
    fi
  done
if [[ $VERBOSE = "v" ]]
  then
    echo "Combate finalizado"
    echo "COMBAT SIMULATION V1.1"
    echo "We check the player HP"
fi
if [ $PL_HP -gt 0 ] && [ $FINAL_BOSS -eq 0 ]
  then
  PL_UPGRADES
fi
if [ $PL_HP -le 0 ]
  then
    GAME_OVER=1
fi
}

function COMBAT_CHECK {
if [ $PL_HP -le 0 ] || [ $NPC_C_HP -le 0 ]
  then
  COMBAT_END_FLAG=1
  COMBAT_SCREEN
  if [ $PL_HP -le 0 ]
    then
      nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/pl_death.wav >/dev/null 2>&1 &
      echo -e " \e[1;92m$PL_NAME\e[0m ha sido derrotado"
      read -p "         Pulsa Enter             "
      GAME_OVER=1
  elif [ $NPC_C_HP -le 0 ]
    then
      if [ "$NPC_NAME" = "Esqueleto" ]
        then
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_death_skel.wav >/dev/null 2>&1 &
      elif [ "$NPC_NAME" = "Goblin" ] || [ "$NPC_NAME" = "Jefe Goblin" ]
        then
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_death_goblin.wav >/dev/null 2>&1 &
      elif [ "$NPC_NAME" = "Cultista" ]
        then
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_death_cultist.wav >/dev/null 2>&1 &
      elif [ "$NPC_NAME" = "Armadura Animada" ]
        then
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_death_armor.wav >/dev/null 2>&1 &
      elif [ "$NPC_NAME" = "Orco" ] || [ "$NPC_NAME" = "Worg" ]
        then
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_death_orc.wav >/dev/null 2>&1 &
        else
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_death.wav >/dev/null 2>&1 &
      fi
      echo -e "Has derrotado al \e[1;91m$NPC_NAME\e[0m"
      PL_EXP=$(($PL_EXP + $NPC_EXP))
      read -p "         Pulsa Enter             "
  fi
fi
}

# Obtiene un NPC aleatorio entre los introducidos en la lista #
function NPC_FETCH {
if [ $FINAL_BOSS -eq 1 ]
  then
    RANDOM_NPC_ID=$[RANDOM%5]
    RANDOM_NPC_SOURCE="./npc/boss"
  else
    RANDOM_NPC_ID=$[RANDOM%5]
    RANDOM_NPC_SOURCE="./npc/mob"
fi
echo "Random NPC: $RANDOM_NPC_ID"
echo "Generando combate..."
NPC_NAME=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 2)
NPC_C_BASE_AC=10
NPC_HP_DICE=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 3)
NPC_HP_DICE_VALUE=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 4)
NPC_C_ARMOR=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 5)
NPC_C_STR=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 6)
NPC_C_DEX=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 7)
NPC_C_CON=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 8)
NPC_C_INT=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 9)
NPC_C_WIS=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 10)
NPC_C_CHA=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 11)
NPC_WPN_DICE=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 12)
NPC_WPN_DMG=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 13)
NPC_MOD_STAT=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 14)
NPC_PROF=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 15)
NPC_HEALER=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 16)
NPC_HEAL_DICE=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 17)
NPC_HEAL_QUANT=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 18)
NPC_CASTER=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 19)
NPC_C_DEBUFF_LIMIT=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 20)
NPC_POISON=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 21)
NPC_EXP=$(cat $RANDOM_NPC_SOURCE | grep ^$RANDOM_NPC_ID | cut -d , -f 22)
NPC_C_HP=0
NPC_MAX_POISON=0
NPC_C_POISONS_USED=0
NPC_C_POISON_DC=0
NPC_MAX_SPELLS=0
NPC_C_SPELLS_USED=0
NPC_C_SPELL_DC=0
NPC_MAX_HEALS=0
NPC_C_HEALS_USED=0
NPC_C_STAT_REFRESH
if [ $NPC_HEALER -eq 1 ]
  then
    NPC_MAX_HEALS=$(($NPC_C_WIS_MOD + 1 ))
    if [ $NPC_MAX_HEALS -lt 1 ]
      then
        NPC_MAX_HEALS=1
    fi
fi
if [ $NPC_CASTER -eq 1 ]
  then
    NPC_MAX_SPELLS=$(($NPC_C_INT_MOD + 1 ))
    NPC_C_SPELL_DC=$(( 8 + $NPC_PROF + $NPC_C_INT_MOD))
    if [ $NPC_MAX_SPELLS -lt 1 ]
      then
        NPC_MAX_SPELLS=1
    fi
fi
if [ $NPC_POISON -eq 1 ]
  then
    NPC_MAX_POISON=$(($NPC_C_DEX_MOD + 1 ))
    NPC_C_POISON_DC=$(( 8 + $NPC_PROF + $NPC_C_DEX_MOD))
    if [ $NPC_MAX_POISON -lt 1 ]
      then
        NPC_MAX_POISON=1
    fi
fi
for (( h = 1 ; h <= $NPC_HP_DICE ; h++ ))
      do
        NPC_C_HP_CALC=$[RANDOM%$NPC_HP_DICE_VALUE+1]
        NPC_C_HP=$(($NPC_C_HP + $NPC_C_HP_CALC))
        if [[ $VERBOSE = "v" ]]
          then
            echo "dado número $h"
            echo "Resultado: $NPC_C_HP_CALC"
            echo "vida acumulada: $NPC_C_HP"
            echo ""
        fi
      done
    NPC_C_HP=$(($NPC_C_HP + $NPC_C_CON_MOD))
    if [[ $VERBOSE = "v" ]]
      then
      echo "Modificador vida: $NPC_C_CON_MOD"
      echo "vida total: $NPC_C_HP"
    fi
    NPC_C_HP_MAX=$NPC_C_HP
if [[ $VERBOSE = "v" ]]
  then
    echo "El NPC seleccionado es: $NPC_NAME"
    echo "Generando vida aleatoria de NPC..."
    echo "HP: $NPC_HP_DICE d $NPC_HP_DICE_VALUE AC: $NPC_C_ARMOR "
    echo "$NPC_NAME | HP: $NPC_C_HP/$NPC_C_HP_MAX AC: $NPC_C_AC | EXP: $NPC_EXP"
    echo " STAT | VALUE | MODIFIER"
    echo "  STR |  $NPC_C_STR  | $NPC_C_STR_MOD" 
    echo "  DEX |  $NPC_C_DEX  | $NPC_C_DEX_MOD" 
    echo "  CON |  $NPC_C_CON  | $NPC_C_CON_MOD" 
    echo "  INT |  $NPC_C_INT  | $NPC_C_INT_MOD" 
    echo "  WIS |  $NPC_C_WIS  | $NPC_C_WIS_MOD" 
    echo "  CHA |  $NPC_C_CHA  | $NPC_C_CHA_MOD" 
    echo ""
    echo "Daño $NPC_NAME: $NPC_WPN_DICE d $NPC_WPN_DMG"
    echo "NPC_MOD_STAT: $NPC_MOD_STAT"
    echo "NPC_PROF: $NPC_PROF"
    echo "NPC_HEALER: $NPC_HEALER"
    echo "NPC_CASTER: $NPC_CASTER"
    echo "NPC_POISON: $NPC_POISON"
    echo "Hit bonus: $NPC_HIT_BONUS"
    echo "Damage bonus: $NPC_DMG_BONUS"
    if [ $NPC_HEALER -eq 1 ]
      then
        echo "$NPC_NAME es healer | Máx heals: $NPC_MAX_HEALS"
      else
        echo "$NPC_NAME no es healer"
    fi
    if [ $NPC_CASTER -eq 1 ]
      then
        echo "$NPC_NAME es caster | Máx spells: $NPC_MAX_SPELLS | DC: $NPC_C_SPELL_DC | Limite debuffos: $NPC_C_DEBUFF_LIMIT"
      else
        echo "$NPC_NAME no es caster"
    fi
    if [ $NPC_POISON -eq 1 ]
      then
        echo "$NPC_NAME tiene veneno | Máx poisons: $NPC_MAX_POISON | DC: $NPC_C_POISON_DC"
      else
        echo "$NPC_NAME no tiene veneno"
    fi
    read -p "         Pulsa Enter             "
    echo ""
fi
}
# Actualiza modificadores, hit bonus y DMG Mod.
function NPC_C_STAT_REFRESH {
NPC_C_STR_MOD=$((($NPC_C_STR - 10) / 2))
NPC_C_DEX_MOD=$((($NPC_C_DEX - 10) / 2))
NPC_C_CON_MOD=$((($NPC_C_CON - 10) / 2))
NPC_C_INT_MOD=$((($NPC_C_INT - 10) / 2))
NPC_C_WIS_MOD=$((($NPC_C_WIS - 10) / 2))
NPC_C_CHA_MOD=$((($NPC_C_CHA - 10) / 2))
NPC_C_AC=$(($NPC_C_BASE_AC + $NPC_C_DEX_MOD + $NPC_C_ARMOR))
if [ $NPC_CASTER -eq 1 ]
  then
    NPC_C_SPELL_DC=$(( 8 + $NPC_PROF + $NPC_C_INT_MOD))
fi
if [ $NPC_MOD_STAT = "STR" ]
  then
  if [[ $VERBOSE = "v" ]]
    then
      echo "El stat para modificar ataques es Fuerza: $NPC_MOD_STAT"
  fi
    NPC_HIT_BONUS=$(($NPC_C_STR_MOD + $NPC_PROF))
    NPC_DMG_BONUS=$NPC_C_STR_MOD
  else
    if [[ $VERBOSE = "v" ]]
      then
    echo "El stat para modificar ataques es Dexteridad: $NPC_MOD_STAT"
    fi
    NPC_HIT_BONUS=$(($NPC_C_DEX_MOD + $NPC_PROF))
    NPC_DMG_BONUS=$NPC_C_DEX_MOD
fi 
}

# Dibuja el 'HUD' durante los combates #
function COMBAT_SCREEN {
  clear
  echo -e "\e[1;92m$PL_NAME\e[0m │ AC: \e[1;100m$PL_C_AC\e[0m │ Estado: \e[1;93m$PL_C_STATUS\e[0m ║ \e[1;91m$NPC_NAME\e[0m │ HP: $NPC_C_HP/$NPC_C_HP_MAX │ AC: $NPC_C_AC"
    if [ $(( $PL_HP )) -eq 0 ];then
        echo -e " HP  ▌▌▌▌▌▌▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
      else
        if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 10 ];then
          echo -e " HP  \e[32m▌\e[39m▌▌▌▌▌▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
        else
          if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 20 ];then
            echo -e " HP  \e[32m▌▌\e[39m▌▌▌▌▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
          else
            if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 30 ];then
              echo -e " HP  \e[32m▌▌▌\e[39m▌▌▌▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
            else
              if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 40 ];then
                echo -e " HP  \e[32m▌▌▌▌\e[39m▌▌▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
              else
                if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 50 ];then
                  echo -e " HP  \e[32m▌▌▌▌▌\e[39m▌▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
                else
                  if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 60 ];then
                    echo -e " HP  \e[32m▌▌▌▌▌▌\e[39m▌▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
                  else
                    if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 70 ];then
                      echo -e " HP  \e[32m▌▌▌▌▌▌▌\e[39m▌▌▌  "$PL_HP"/"$PL_HP_MAX"."
                    else
                      if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 80 ];then
                        echo -e " HP  \e[32m▌▌▌▌▌▌▌▌\e[39m▌▌  "$PL_HP"/"$PL_HP_MAX"."
                      else
                        if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 90 ];then
                          echo -e " HP  \e[32m▌▌▌▌▌▌▌▌▌\e[39m▌  "$PL_HP"/"$PL_HP_MAX"."
                        else
                          if [ $(( $PL_HP * 100 / $PL_HP_MAX )) -le 100 ];then
                            echo -e " HP  \e[32m▌▌▌▌▌▌▌▌▌▌\e[39m  "$PL_HP"/"$PL_HP_MAX"."
                          else
                            echo "[UNEXPECTED ERROR. ABOVE 100%]"
                          fi
                        fi
                      fi
                    fi
                  fi
                fi
              fi
            fi
          fi
        fi
      fi
  if [ $PL_CLASS = "Mago" ]
    then
      if [ $(( $PL_MANA_CURRENT )) -eq 0 ];then
        echo -e "MANA ▌▌▌▌▌▌▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
      else
        if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 10 ];then
          echo -e "MANA \e[34m▌\e[39m▌▌▌▌▌▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
        else
          if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 20 ];then
            echo -e "MANA \e[34m▌▌\e[39m▌▌▌▌▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
          else
            if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 30 ];then
              echo -e "MANA \e[34m▌▌▌\e[39m▌▌▌▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
            else
              if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 40 ];then
                echo -e "MANA \e[34m▌▌▌▌\e[39m▌▌▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
              else
                if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 50 ];then
                  echo -e "MANA \e[34m▌▌▌▌▌\e[39m▌▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
                else
                  if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 60 ];then
                    echo -e "MANA \e[34m▌▌▌▌▌▌\e[39m▌▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
                  else
                    if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 70 ];then
                      echo -e "MANA \e[34m▌▌▌▌▌▌▌\e[39m▌▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
                    else
                      if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 80 ];then
                        echo -e "MANA \e[34m▌▌▌▌▌▌▌▌\e[39m▌▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
                      else
                        if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 90 ];then
                          echo -e "MANA \e[34m▌▌▌▌▌▌▌▌▌\e[39m▌  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
                        else
                          if [ $(( $PL_MANA_CURRENT * 100 / $PL_MANA_MAX )) -le 100 ];then
                            echo -e "MANA \e[34m▌▌▌▌▌▌▌▌▌▌\e[39m  "$PL_MANA_CURRENT"/"$PL_MANA_MAX"."
                          else
                            echo "[UNEXPECTED ERROR. ABOVE 100%]"
                          fi
                        fi
                      fi
                    fi
                  fi
                fi
              fi
            fi
          fi
        fi
      fi
  fi
  if [[ $VERBOSE = "v" ]]
    then
     echo "Debuffs: $PL_C_DEBUFF_COUNT"
  fi
  # if [ $PL_CLASS = "Mago" ]
    # then
      # echo -e "\e[1;92m$PL_NAME\e[0m | HP: $PL_HP/$PL_HP_MAX | MP: $PL_MP/$PL_MP_MAX | AC: $PL_C_AC || \e[1;91m$NPC_NAME\e[0m | HP: $NPC_C_HP/$NPC_C_HP_MAX | AC: $NPC_C_AC"
    # else
      # echo -e "\e[1;92m$PL_NAME\e[0m | HP: $PL_HP/$PL_HP_MAX | AC: $PL_C_AC || \e[1;91m$NPC_NAME\e[0m | HP: $NPC_C_HP/$NPC_C_HP_MAX | AC: $NPC_C_AC"
  # fi
  echo "STR:$PL_C_STR($PL_C_STR_MOD) DEX:$PL_C_DEX($PL_C_DEX_MOD) CON:$PL_C_CON($PL_C_CON_MOD)"
  echo "INT:$PL_C_INT($PL_C_INT_MOD) WIS:$PL_C_WIS($PL_C_WIS_MOD) CHA:$PL_C_CHA($PL_C_CHA_MOD)"
  echo "Turno: $TURN"
  if [ $NPC_C_HP -gt 0 ]
    then
      cat "./img/$NPC_NAME"
  fi
}

## Funciones NPC ##
function NPC_TURN {
if [ $NPC_HEALER -eq 1 ] && [ $NPC_C_HEALS_USED -lt $NPC_MAX_HEALS ] && [ $NPC_C_HP -le $(($NPC_C_HP_MAX / 3)) ]
  then
    NPC_HEAL_SND=$[RANDOM%3+1]
    nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_alterself_$NPC_HEAL_SND.wav >/dev/null 2>&1 &
    echo -e "\e[1;91m$NPC_NAME\e[0m decide curarse"
    read -p "         Pulsa Enter             "
    let "NPC_C_HEALS_USED+=1"
    if [[ $VERBOSE = "v" ]]; then
      echo "Hechizos usados: $NPC_C_HEALS_USED | Hechizos máximos $NPC_MAX_HEALS"
    fi
    for ((NPC_HEAL_DICE_COUNT = 1 ; NPC_HEAL_DICE_COUNT <= $NPC_HEAL_DICE ; NPC_HEAL_DICE_COUNT++ ))
      do
        NPC_HEAL_DICE_RESULT=$[RANDOM%$NPC_HEAL_QUANT+1]
        NPC_HEAL_TOTAL=$(($NPC_HEAL_TOTAL + $NPC_HEAL_DICE_RESULT))
        if [[ $VERBOSE = "v" ]]
          then
            echo "dado número: $NPC_HEAL_DICE_COUNT"
            echo "Resultado: $NPC_HEAL_DICE_RESULT"
            echo "Curación acumulada: $NPC_HEAL_TOTAL"
            echo ""
        fi
      done
    echo "Cura: $NPC_HEAL_TOTAL"
    NPC_C_HP=$(($NPC_C_HP + $NPC_HEAL_TOTAL))
    if [ $NPC_C_HP -gt $NPC_C_HP_MAX ]
      then
        NPC_C_HP=$NPC_C_HP_MAX
        #echo "Vida actual: $NPC_C_HP es mayor que Vida máxima: $NPC_C_HP_MAX"
        echo "$NPC_C_HP/$NPC_C_HP_MAX"
      else
        echo "$NPC_C_HP/$NPC_C_HP_MAX"
    fi
    NPC_HEAL_TOTAL=0
  elif [ $NPC_CASTER -eq 1 ] && [ $NPC_C_SPELLS_USED -lt $NPC_MAX_SPELLS ] && [ $PL_C_DEBUFF_COUNT -lt $NPC_C_DEBUFF_LIMIT ]
    then
      let "NPC_C_SPELLS_USED+=1"
      echo -e "\e[1;91m$NPC_NAME\e[0m usará un hechizo"
      PL_DICE=$(($[RANDOM%20+1] + $PL_C_WIS_MOD))
      if [[ $VERBOSE = "v" ]]
        then
          echo "Hechizos usados: $NPC_C_SPELLS_USED | Hechizos máximos $NPC_MAX_SPELLS"
          echo "STR:$PL_C_STR DEX:$PL_C_DEX INT:$PL_C_INT"
          echo "MOD:$PL_C_STR_MOD MOD:$PL_C_DEX_MOD MOD:$PL_C_INT_MOD"
          echo ""
          echo "S_Throw:$PL_DICE vs Dificultad: $NPC_C_SPELL_DC"
      fi
      if [ $PL_DICE -lt $NPC_C_SPELL_DC ]
        then
          let "PL_C_DEBUFF_COUNT+=1"
          if [ $PL_C_MOD -lt 3 ]
            then
              if [ $PL_C_AC -gt 14 ]
                then
                  NPC_REND_SND=$[RANDOM%4+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_alter_$NPC_REND_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;91m$NPC_NAME\e[0m castea: \e[1;100mRend\e[0m"
                  echo -e "La AC \e[1;92m$PL_NAME\e[0m se reduce en 1"
                  PL_C_ARMOR=$(($PL_C_ARMOR - 1))
                  PL_C_STAT_REFRESH
                else
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_protection.wav >/dev/null 2>&1 &
                  echo -e "\e[1;91m$NPC_NAME\e[0m castea: Mage Armour"
                  echo -e "\e[1;91m$NPC_NAME\e[0m aumenta su AC en 1"
                  NPC_C_AC=$(($NPC_C_AC + 1))
              fi    
            else
              NPC_DEBUFF_SND=$[RANDOM%4+1]
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_arcane_$NPC_DEBUFF_SND.wav >/dev/null 2>&1 &
              if [ $PL_CLASS = "Guerrero" ]
                then
                  echo -e "\e[1;91m$NPC_NAME\e[0m castea: Wither"
                  echo -e "La Fuerza de \e[1;92m$PL_NAME\e[0m se reduce en 2"
                  PL_C_STR=$(($PL_C_STR - 2))
              elif [ $PL_CLASS = "Picaro" ]
                then
                  echo -e "\e[1;91m$NPC_NAME\e[0m castea: Slow"
                  echo -e "La Dexteridad de \e[1;92m$PL_NAME\e[0m se reduce en 2"
                  PL_C_DEX=$(($PL_C_DEX - 2))
              else
                echo -e "\e[1;91m$NPC_NAME\e[0m castea: Diminish"
                echo -e "La Inteligencia de \e[1;92m$PL_NAME\e[0m se reduce en 2"
                  PL_C_INT=$(($PL_C_INT - 2))
              fi
            PL_C_STAT_REFRESH
            echo "STR:$PL_C_STR DEX:$PL_C_DEX INT:$PL_C_INT"
            echo "MOD:$PL_C_STR_MOD DEX:$PL_C_DEX_MOD INT:$PL_C_INT_MOD"
          fi
        else
          echo "El Hechizo falla"
      fi
  elif [ $NPC_POISON -eq 1 ] && [ $PL_C_STATUS = "OK" ] && [ $NPC_C_POISONS_USED -lt $NPC_MAX_POISON ]
    then
      let "NPC_C_POISONS_USED+=1"
      nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_poison.wav >/dev/null 2>&1 &
      echo -e "\e[1;91m$NPC_NAME\e[0m usará veneno"
      NPC_POISON_CHECK
  else
    echo -e "\e[1;91m$NPC_NAME\e[0m atacará"
    NPC_ATTACK
    #PL_HP=$(($PL_HP - 2))
fi
if [ $PL_HP -gt 0 ]
  then
    echo -e "Finaliza el turno de \e[1;91m$NPC_NAME\e[0m"
    read -p "         Pulsa Enter             "
fi
}
# Comprueba si el ataque del NPC acierta o no #
function NPC_ATTACK {
  NPC_DICE=$[RANDOM%20+1]
  if [[ $VERBOSE = "v" ]]
    then
      echo "Resultado Tirada NPC: $NPC_DICE"
  fi
  if [ $NPC_DICE -eq 20 ]
    then
      nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_hit.wav >/dev/null 2>&1 &
      echo -e "\e[1;91m$NPC_NAME\e[0m consigue un golpe crítico"
      read -p "         Pulsa Enter             "
      echo ""
      NPC_DAMAGE
    else
      NPC_DICE_TOTAL=$(($NPC_DICE + $NPC_HIT_BONUS))
      if [[ $VERBOSE = "v" ]]
        then
          echo "Resultado Tirada Más bonus NPC: $NPC_DICE_TOTAL"
      fi
      if [ $NPC_DICE_TOTAL -ge $PL_C_AC ]
        then
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_hit.wav >/dev/null 2>&1 &
          echo -e "El ataque de \e[1;91m$NPC_NAME\e[0m acierta"
          NPC_DAMAGE
        else
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/npc/npc_miss.wav >/dev/null 2>&1 &
          echo -e "El ataque de \e[1;91m$NPC_NAME\e[0m falla"
      fi
  fi
}
# Calcula el daño realizado por un NPC #
function NPC_DAMAGE {
  NPC_DMG_DICE=0
  NPC_DMG_TOTAL=0
  for ((n = 1 ; n <= $NPC_WPN_DICE ; n++ ))
    do
      NPC_DMG_DICE=$[RANDOM%$NPC_WPN_DMG+1]
      NPC_DMG_TOTAL=$(($NPC_DMG_TOTAL + $NPC_DMG_DICE))
      if [[ $VERBOSE = "v" ]]
        then
          echo "dado número: $n"
          echo "Resultado: $NPC_DMG_DICE"
          echo "Daño acumulado: $NPC_DMG_TOTAL"
          echo ""
      fi
    done 
  if [[ $VERBOSE = "v" ]]
    then 
      echo "Resultado dados de daño: $NPC_DMG_TOTAL"
  fi
  NPC_DMG_TOTAL=$(($NPC_DMG_TOTAL + $NPC_DMG_BONUS))
  if [[ $VERBOSE = "v" ]]
    then 
      echo "Modificador de daño: $NPC_DMG_BONUS"
  fi
  if [ $NPC_DICE -eq 20 ]
    then
      NPC_DMG_TOTAL=$(($NPC_DMG_TOTAL * 2))
      echo "¡Daño doble por crítico!: $NPC_DMG_TOTAL"
    else 
      if [[ $VERBOSE = "v" ]]
        then 
          echo "Daño total: $NPC_DMG_TOTAL"
      fi
  fi
  echo -e "\e[1;92m$PL_NAME\e[0m sufre \e[1;91m$NPC_DMG_TOTAL\e[0m puntos de daño"
  PL_HP=$(($PL_HP - $NPC_DMG_TOTAL))
  read -p "         Pulsa Enter             "
}
# Comprueba si el jugador resiste veneno #
function NPC_POISON_CHECK {
  PL_DICE=$(($[RANDOM%20+1] + $PL_C_CON_MOD))
  if [[ $VERBOSE = "v" ]]
    then
      echo "S_Throw:$PL_DICE vs Dificultad:$NPC_C_POISON_DC"
  fi
  if [ $PL_DICE -ge $NPC_C_POISON_DC ]
    then
      if [ $PL_C_STATUS = "Envenenado" ]
        then
          echo -e "\e[1;92m$PL_NAME\e[0m ya no está envenenado"
        else
          echo -e "\e[1;92m$PL_NAME\e[0m resiste el veneno"
      fi
      PL_C_STATUS="OK"
    else
      if [ $PL_C_STATUS = "Envenenado" ]
        then
          echo -e "\e[1;92m$PL_NAME\e[0m sigue envenenado"
        else
          echo -e "\e[1;92m$PL_NAME\e[0m está envenenado"
      fi
      PL_C_STATUS="Envenenado"
  fi
  read -p "         Pulsa Enter             "
}

## Funciones jugador ##
# Asigna los stats del personaje a los stas de combate #
function PL_C_STAT_ASSIGN {
#PL_C_HP=$PL_HP
PL_C_STR=$PL_STR
PL_C_DEX=$PL_DEX
PL_C_CON=$PL_CON
PL_C_INT=$PL_INT
PL_C_WIS=$PL_WIS
PL_C_CHA=$PL_CHA
PL_C_HIT=$PL_HIT
PL_C_MOD=$PL_MOD
PL_C_DMG_BONUS=$PL_DMG_BONUS
PL_C_ARMOR=$PL_ARMOR
#PL_C_AC=$(( $PL_BASE_AC + $PL_ARMOR + $PL_DEX_MOD ))
}
# Recalcula los modificadores de combate tras alterar un stat #
function PL_C_STAT_REFRESH {
  PL_C_STR_MOD=$((($PL_C_STR - 10) / 2))
  PL_C_DEX_MOD=$((($PL_C_DEX - 10) / 2))
  PL_C_CON_MOD=$((($PL_C_CON - 10) / 2))
  PL_C_INT_MOD=$((($PL_C_INT - 10) / 2))
  PL_C_WIS_MOD=$((($PL_C_WIS - 10) / 2))
  PL_C_CHA_MOD=$((($PL_C_CHA - 10) / 2))
  PL_C_AC=$(( $PL_BASE_AC + $PL_C_ARMOR + $PL_C_DEX_MOD ))
  if [ $PL_CLASS = "Guerrero" ]
    then
      PL_C_MOD=$PL_C_STR_MOD
  elif [ $PL_CLASS = "Picaro" ]
    then
      PL_C_MOD=$PL_C_DEX_MOD
  elif [ $PL_CLASS = "Mago" ]
    then
      PL_C_MOD=$PL_C_INT_MOD
  else
    echo "Tu clase no está definida correctamente. Saliendo"
    exit
  fi
### Establecer modificador a HIT DIE ###
PL_C_HIT=$(( $PL_C_MOD + $PL_PROF ))
### Establecer modificador de DAÑO ###
PL_C_DMG_BONUS=$PL_C_MOD
PL_C_SPELL_DC=$((8 + $PL_PROF + $PL_C_INT_MOD))
PL_C_MANA_REGEN=$(($PL_C_WIS_MOD + 1))
if [ $PL_C_MANA_REGEN -le 0 ]
  then
    PL_C_MANA_REGEN=1
fi
}
# Recalcula los modificadores permanentes tras mejoras de pl_upgrade #
function PL_MODIFIERS_REFRESH {
  PL_STR_MOD=$((($PL_STR - 10) / 2))
  PL_DEX_MOD=$((($PL_DEX - 10) / 2))
  PL_CON_MOD=$((($PL_CON - 10) / 2))
  PL_INT_MOD=$((($PL_INT - 10) / 2))
  PL_WIS_MOD=$((($PL_WIS - 10) / 2))
  PL_CHA_MOD=$((($PL_CHA - 10) / 2))
   # Determinar modificador de HIT/DMG 
  if [ $PL_CLASS = "Guerrero" ]
    then
      PL_MOD=$PL_STR_MOD
  elif [ $PL_CLASS = "Picaro" ]
    then
      PL_MOD=$PL_DEX_MOD
  elif [ $PL_CLASS = "Mago" ]
    then
      PL_MOD=$PL_INT_MOD
  else
    echo "Tu clase no está definida correctamente. Saliendo"
    exit
  fi
  #echo "$PL_MOD porque eres un $PL_CLASS"
  ### Establecer modificador a HIT DIE ###
  PL_HIT=$(($PL_MOD + $PL_PROF))
  ### Establecer modificador de DAÑO ###
  PL_DMG_BONUS=$PL_MOD
  ### Establecer INICIATIVA ###
  if [ $PL_CLASS = "Picaro" ]
    then
      PL_INI_MOD=$(($PL_DEX_MOD + 3))
    else
      PL_INI_MOD=$PL_DEX_MOD
  fi
}
# Encapsula el turno del jugador #
# Si el jugador está envenenado le daña y vuelve a comprobar si consigue quitarse el veneno #
function PL_POISONED_STATUS {
    COMBAT_SCREEN
    PL_POISON_DAMAGE=$[RANDOM%8+1]
    PL_HP=$(($PL_HP - $PL_POISON_DAMAGE))
    echo -e "\e[1;92m$PL_NAME\e[0m está envenenado y sufre \e[1;32m$PL_POISON_DAMAGE\e[0m puntos de daño"
    read -p "         Pulsa Enter             "
    COMBAT_SCREEN
    if [ $PL_HP -le 0 ]
      then
        echo -e "\e[1;92m$PL_NAME\e[0m ha sido derrotado"
        echo ""
        read -p "         Pulsa Enter             "
        COMBAT_END_FLAG=1
      else
        NPC_POISON_CHECK
    fi
}

# menu principal turno del jugador #
function PL_TURN {
  if [ $PL_CLASS = "Mago" ]
    then
      if [ $PL_MANA_CURRENT -lt $PL_MANA_MAX ]
        then
          COMBAT_SCREEN
          PL_MANA_CURRENT=$(($PL_MANA_CURRENT + $PL_C_MANA_REGEN))
          echo -e "\e[1;92m$PL_NAME\e[0m regenera $PL_C_MANA_REGEN puntos de maná"
          read -p "         Pulsa Enter             "
          if [ $PL_MANA_CURRENT -gt $PL_MANA_MAX ]
            then
              PL_MANA_CURRENT=$PL_MANA_MAX
          fi
      fi
  fi
  PL_TURN_MENU=1
  while [ $PL_TURN_MENU -eq 1 ]
    do
      clear
      COMBAT_SCREEN
      PL_TURN_MENU_CHOICE=""
      #El tipo de ataque por defectoe es 1, solo cambia con clase guerrero
      PL_ATTACK_TYPE=1
      if [ $PL_CLASS = "Guerrero" ]
        then
          echo "  P) Ataque Pesado (-2 HIT, +2 DMG)"
          echo "  A) Ataque Normal"
          echo "  L) Ataque Ligero (+2 HIT, -2 DMG)"
        else
          echo "  A) Atacar"
      fi
      if [ $FINAL_BOSS -eq 0 ]
        then 
          echo "  H) Huir"
        else
          echo -e "  \e[9mH) Huir\e[0m"
      fi
      if [ $PL_CLASS = "Mago" ]
        then
          echo "  M) Magia"
      fi
      echo ""
      read -p "Escoge una acción: " PL_TURN_MENU_CHOICE
      case $PL_TURN_MENU_CHOICE in
        [aA])
          PL_TURN_MENU=0
          PL_ATTACK
          ;;
        [hH])
          if [ $FINAL_BOSS -eq 0 ]
            then
              PL_TURN_MENU=0
              PL_FLEE
            else
              echo "No hay donde huir..."
              read -p "         Pulsa Enter             "
          fi
          ;;
        [mM])
          if [ $PL_CLASS = "Mago" ]
            then
              PL_MAGIC
            else
              echo "Introduce una opción válida"
              read -p "         Pulsa Enter             "
          fi
          ;;
        [pP])
          if [ $PL_CLASS = "Guerrero" ]
            then
              PL_TURN_MENU=0
              PL_ATTACK_TYPE=2
              PL_ATTACK
            else
              echo "Introduce una opción válida"
              read -p "         Pulsa Enter             "
          fi
          ;;
        [lL])
          if [ $PL_CLASS = "Guerrero" ]
            then
              PL_TURN_MENU=0
              PL_ATTACK_TYPE=0
              PL_ATTACK
            else
              echo "Introduce una opción válida"
              read -p "         Pulsa Enter             "
          fi
          ;;
        *)
          echo "Introduce una opción válida"
          read -p "         Pulsa Enter             "
          ;;
      esac
    done
  echo -e "Termina el turno de \e[1;92m$PL_NAME\e[0m"
  read -p "         Pulsa Enter             "
}
# Comprueba si la vida del jugador supera 100% y la pone al máximo si eso ocurre #
function PL_HP_OVERFLOW_CHECK {
  if [ $PL_HP -gt $PL_HP_MAX ]
    then PL_HP=$PL_HP_MAX
  fi
}
# Encapsula el menu de mejoras #
function PL_UPGRADES {
  PL_UPGRADE_MENU=1
  while [ $PL_UPGRADE_MENU -eq 1 ]; do
    PL_UPGRADES_COST_UPDATE
    PL_UPGRADE_CHOICE=""
    clear
    echo "Todas las mejoras cuestan esencia. Esencia disponible: $PL_EXP"
    echo "Mejoras disponibles:"
    echo ""
    echo ""
    echo -e " 1) Mejoras de Atributos   ║"
    echo -e " 2) Mejoras de Arma\t   ║"
    echo -e " 3) Mejorar Armadura +1\t   ║ Coste: $PL_UPGRADE_COST_AC_DISCOUNT\t║ (Valor actual: $PL_ARMOR)"
    echo -e " 4) Curarse al 100%\t   ║ Coste: $PL_UPGRADE_COST_HEAL_100_DISCOUNT\t║ (Vida actual: $PL_HP/$PL_HP_MAX)"
    echo -e " 5) Curar específico\t   ║ Coste Varía║ (Vida actual: $PL_HP/$PL_HP_MAX)"
    echo -e " 6) Mejorar vida máxima +3 ║ Coste: $PL_UPGRADE_COST_HP_MAX_DISCOUNT\t║ (Vida máxima actual: $PL_HP_MAX)"
    if [ $PL_CLASS = "Mago" ]; then
      echo -e " 7) Mejorar maná máximo +5 ║ Coste: $PL_UPGRADE_COST_MP_MAX_DISCOUNT\t║ (Valor actual: $PL_MANA_MAX)"
    fi
    echo ""
    echo " 0) Finalizar Mejoras"
    echo ""
    echo "$PL_UPGRADE_MENU_ERROR"
    PL_UPGRADE_MENU_ERROR=""
    read -p "Elige una opción: " PL_UPGRADE_CHOICE
    case $PL_UPGRADE_CHOICE in
      1)
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
        PL_UPGRADES_STATS
        ;;
      2)
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
        PL_UPGRADES_WPN
        ;;
      3)
        if [ $PL_EXP -ge $PL_UPGRADE_COST_AC_DISCOUNT ]
          then
            nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
            PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_AC_DISCOUNT))
            PL_ARMOR=$((PL_ARMOR + 1))
            echo ""
            echo "Tu armadura ha aumentado en +1. ($PL_ARMOR)"
            echo ""
            read -p "         Pulsa Enter             "
          else
            echo ""
            echo "No tienes suficiente esencia"
            read -p "         Pulsa Enter             "
        fi
        ;;
      4)
        if [ $PL_HP -lt $PL_HP_MAX ]
          then
            if [ $PL_EXP -ge $PL_UPGRADE_COST_HEAL_100_DISCOUNT ]
              then
                nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_heal.wav >/dev/null 2>&1 &
                PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_HEAL_100_DISCOUNT))
                PL_HP=$PL_HP_MAX
                echo ""
                echo "Tu vida ha aumentado al máximo. $PL_HP/$PL_HP_MAX"
                echo ""
                read -p "         Pulsa Enter             "
              else
                echo ""
                echo "No tienes suficiente esencia"
                read -p "         Pulsa Enter             "
            fi
          else
            echo "Ya tienes la vida la máximo"
            read -p "         Pulsa Enter             "
        fi
        ;;        
      5)
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_confirm.wav >/dev/null 2>&1 &
        PL_UPGRADES_HEAL  
        ;;        
      6)
        if [ $PL_EXP -ge $PL_UPGRADE_COST_HP_MAX_DISCOUNT ]
          then
            nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_max_hp.wav >/dev/null 2>&1 &
            PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_HP_MAX_DISCOUNT))
            PL_HP_MAX=$(($PL_HP_MAX + 3))
            echo ""
            echo "Tu vida máxima ha aumentado en 3. $PL_HP_MAX"
            echo ""
            read -p "         Pulsa Enter             "
          else
            echo ""
            echo "No tienes suficiente esencia"
            read -p "         Pulsa Enter             "
        fi        
        ;;
      7)
        if [ $PL_CLASS = "Mago" ]
          then
            if [ $PL_EXP -ge $PL_UPGRADE_COST_MP_MAX_DISCOUNT ]
              then
                nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
                PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_MP_MAX_DISCOUNT))
                PL_MANA_MAX=$(($PL_MANA_MAX + 5))
                echo ""
                echo "Tu maná máximo ha aumentado en 5. $PL_MANA_MAX"
                read -p "         Pulsa Enter             "
              else
                echo "No tienes suficiente esencia"
                read -p "         Pulsa Enter             "
            fi
          else
          PL_UPGRADE_MENU_ERROR="Introduce un número válido"
        fi
        ;;
      0)
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
        PL_UPGRADE_MENU=0
        ;;
      *)
        PL_UPGRADE_MENU_ERROR="Introduce un número válido"
        ;;
    esac
   done
}
# Fija el precio inicial de las mejoras #
function PL_UPGRADES_SET_COST {
PL_UPGRADE_COST_ANY_STAT=200
PL_UPGRADE_COST_WPN_DICE=350
PL_UPGRADE_COST_WPN_QUANT=80
PL_UPGRADE_COST_WPN_BONUS=150
PL_UPGRADE_COST_AC=350
#PL_UPGRADE_COST_HEAL_100=$((($PL_HP_MAX - $PL_HP) * 10))
PL_UPGRADE_COST_HP_SPECIFIC=10
PL_UPGRADE_COST_HP_MAX=200
PL_UPGRADE_COST_MP_MAX=150
}
# Cálculo de costes para mejoras #
function PL_UPGRADES_COST_UPDATE {
PL_UPGRADE_COST_ANY_STAT_DISCOUNT=$(( $PL_UPGRADE_COST_ANY_STAT - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_ANY_STAT_DISCOUNT -lt $(($PL_UPGRADE_COST_ANY_STAT / 5)) ]
  then
    PL_UPGRADE_COST_ANY_STAT_DISCOUNT=$(($PL_UPGRADE_COST_ANY_STAT / 5))
fi

PL_UPGRADE_COST_WPN_DICE_DISCOUNT=$(( $PL_UPGRADE_COST_WPN_DICE - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_WPN_DICE_DISCOUNT -lt $(($PL_UPGRADE_COST_WPN_DICE / 5)) ]
  then
    PL_UPGRADE_COST_WPN_DICE_DISCOUNT=$(($PL_UPGRADE_COST_WPN_DICE / 5))
fi

PL_UPGRADE_COST_WPN_QUANT_DISCOUNT=$(( $PL_UPGRADE_COST_WPN_QUANT - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_WPN_QUANT_DISCOUNT -lt $(($PL_UPGRADE_COST_WPN_QUANT / 5)) ]
  then
    PL_UPGRADE_COST_WPN_QUANT_DISCOUNT=$(($PL_UPGRADE_COST_WPN_QUANT / 5))
fi

PL_UPGRADE_COST_WPN_BONUS_DISCOUNT=$(( $PL_UPGRADE_COST_WPN_BONUS - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_WPN_BONUS_DISCOUNT -lt $(($PL_UPGRADE_COST_WPN_BONUS / 5)) ]
  then
    PL_UPGRADE_COST_WPN_BONUS_DISCOUNT=$(($PL_UPGRADE_COST_WPN_BONUS / 5))
fi

PL_UPGRADE_COST_AC_DISCOUNT=$(( $PL_UPGRADE_COST_AC - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_AC_DISCOUNT -lt $(($PL_UPGRADE_COST_AC / 5)) ]
  then
    PL_UPGRADE_COST_AC_DISCOUNT=$(($PL_UPGRADE_COST_AC / 5))
fi
PL_UPGRADE_COST_HEAL_100=$((($PL_HP_MAX - $PL_HP) * 10))
PL_UPGRADE_COST_HEAL_100_DISCOUNT=$(($PL_UPGRADE_COST_HEAL_100 - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_HEAL_100_DISCOUNT -lt $(($PL_UPGRADE_COST_HEAL_100 / 5)) ]
  then
    PL_UPGRADE_COST_HEAL_100_DISCOUNT=$(($PL_UPGRADE_COST_HEAL_100 / 5))
fi
PL_UPGRADE_COST_HP_SPECIFIC_DISCOUNT=$(( $PL_UPGRADE_COST_HP_SPECIFIC - ($PL_CHA_MOD * 2)))
if [ $PL_UPGRADE_COST_HP_SPECIFIC_DISCOUNT -lt $(($PL_UPGRADE_COST_HP_SPECIFIC / 5)) ]
  then
    PL_UPGRADE_COST_HP_SPECIFIC_DISCOUNT=$(($PL_UPGRADE_COST_HP_SPECIFIC / 5))
fi

PL_UPGRADE_COST_HP_MAX_DISCOUNT=$(( $PL_UPGRADE_COST_HP_MAX - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_HP_MAX_DISCOUNT -lt $(($PL_UPGRADE_COST_HP_MAX / 5)) ]
  then
    PL_UPGRADE_COST_HP_MAX_DISCOUNT=$(($PL_UPGRADE_COST_HP_MAX / 5))
fi

PL_UPGRADE_COST_MP_MAX_DISCOUNT=$(( $PL_UPGRADE_COST_MP_MAX - ($PL_CHA_MOD * 35)))
if [ $PL_UPGRADE_COST_MP_MAX_DISCOUNT -lt $(($PL_UPGRADE_COST_MP_MAX / 5)) ]
  then
    PL_UPGRADE_COST_MP_MAX_DISCOUNT=$(($PL_UPGRADE_COST_MP_MAX / 5))
fi

}

# Menú de mejoras de los stats #
function PL_UPGRADES_STATS {
  PL_UPGRADE_CHOICE=""
  PL_UPGRADE_MENU_STAT=1
    while [ $PL_UPGRADE_MENU_STAT -eq 1 ]; do
      PL_UPGRADES_COST_UPDATE
      clear
      echo "Mejora de atributos. Esencia disponible: $PL_EXP"
      echo ""
      echo ""
      echo -e "1) Mejorar Fuerza       ║ Coste: $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ║ Valor Actual: $PL_STR\t│ $PL_STR_MOD"
      echo -e "2) Mejorar Dexteridad   ║ Coste: $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ║ Valor Actual: $PL_DEX\t│ $PL_DEX_MOD"
      echo -e "3) Mejorar Constitución ║ Coste: $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ║ Valor Actual: $PL_CON\t│ $PL_CON_MOD"
      echo -e "4) Mejorar Inteligencia ║ Coste: $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ║ Valor Actual: $PL_INT\t│ $PL_INT_MOD"
      echo -e "5) Mejorar Sabiduría    ║ Coste: $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ║ Valor Actual: $PL_WIS\t│ $PL_WIS_MOD"
      echo -e "6) Mejorar Carisma      ║ Coste: $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ║ Valor Actual: $PL_CHA\t│ $PL_CHA_MOD"
      echo ""
      echo "0) Volver al menu general de mejoras"
      echo ""
      read -p "Elige una opción: " PL_UPGRADE_CHOICE
      case $PL_UPGRADE_CHOICE in
        1)
          if [ $PL_EXP -ge $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ]
            then
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
              PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_ANY_STAT_DISCOUNT))
              PL_STR=$((PL_STR + 2))
              PL_MODIFIERS_REFRESH
              echo ""
              echo "Tu fuerza ha aumentado en +2. $PL_STR"
              echo ""
              read -p "         Pulsa Enter             "
            else
              echo ""
              echo "No tienes suficiente esencia"
              read -p "         Pulsa Enter             "
          fi
          ;;
        2)
          if [ $PL_EXP -ge $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ]
            then
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
              PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_ANY_STAT_DISCOUNT))
              PL_DEX=$((PL_DEX + 2))
              PL_MODIFIERS_REFRESH
              echo ""
              echo "Tu dexteridad ha aumentado en +2. $PL_DEX"
              echo ""
              read -p "         Pulsa Enter             "
            else
              echo ""
              echo "No tienes suficiente esencia"
              read -p "         Pulsa Enter             "
          fi
          ;;
        3)
          if [ $PL_EXP -ge $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ]
            then
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
              PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_ANY_STAT_DISCOUNT))
              PL_CON=$((PL_CON + 2))
              PL_MODIFIERS_REFRESH
              echo ""
              echo "Tu constitución ha aumentado en +2. $PL_CON"
              echo ""
              read -p "         Pulsa Enter             "
            else
              echo ""
              echo "No tienes suficiente esencia"
              read -p "         Pulsa Enter             "
          fi
          ;;
        4)
          if [ $PL_EXP -ge $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ]
            then
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
              PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_ANY_STAT_DISCOUNT))
              PL_INT=$((PL_INT + 2))
              PL_MODIFIERS_REFRESH
              echo ""
              echo "Tu inteligencia ha aumentado en +2. $PL_INT"
              echo ""
              read -p "         Pulsa Enter             "
          else
              echo ""
              echo "No tienes suficiente esencia"
              read -p "         Pulsa Enter             "
          fi
          ;;
        5)
          if [ $PL_EXP -ge $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ]
            then
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
              PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_ANY_STAT_DISCOUNT))
              PL_WIS=$((PL_WIS + 2))
              PL_MODIFIERS_REFRESH
              echo ""
              echo "Tu sabiduría ha aumentado en +2. $PL_WIS"
              echo ""
              read -p "         Pulsa Enter             "
            else
              echo ""
              echo "No tienes suficiente esencia"
              read -p "         Pulsa Enter             "
          fi
          ;;
        6)
          if [ $PL_EXP -ge $PL_UPGRADE_COST_ANY_STAT_DISCOUNT ]
            then
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
              PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_ANY_STAT_DISCOUNT))
              PL_CHA=$((PL_CHA + 2))
              PL_MODIFIERS_REFRESH
              echo ""
              echo "Tu carisma ha aumentado en +2. $PL_CHA"
              echo ""
              read -p "         Pulsa Enter             "
            else
              echo ""
              echo "No tienes suficiente esencia"
              read -p "         Pulsa Enter             "
          fi
          ;;
        0)
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
          PL_UPGRADE_MENU_STAT=0
          ;;
        *)
          read -p "         Introduce un numero válido             "
          ;;
      esac
    done
}
# Menu de mejroas de armas #
function PL_UPGRADES_WPN {
  PL_UPGRADE_CHOICE=""
  PL_UPGRADE_MENU_WPN=1
  while [ $PL_UPGRADE_MENU_WPN -eq 1 ]; do
    PL_UPGRADES_COST_UPDATE
    clear
    echo "Mejora de arma. Esencia disponible: $PL_EXP"
    echo ""
    echo ""
    echo -e "1) Mejorar cantidad de tiradas\t║ Coste: $PL_UPGRADE_COST_WPN_DICE_DISCOUNT\t║ (Valor actual: $PL_WPN_DICE)"
    echo -e "2) Mejorar rango de daño\t║ Coste: $PL_UPGRADE_COST_WPN_QUANT_DISCOUNT\t║ (Valor actual: $PL_WPN_DMG)"
    echo -e "3) Añadir +1 a hit y daño\t║ Coste: $PL_UPGRADE_COST_WPN_BONUS_DISCOUNT\t║ (Valor actual: $PL_WPN_UPGRADE_BONUS)"
    echo ""
    echo -e "0) Volver al menú general de mejoras"
    echo ""
    read -p "Elige una opción: " PL_UPGRADE_CHOICE
    case $PL_UPGRADE_CHOICE in
      1)
        if [ $PL_EXP -ge $PL_UPGRADE_COST_WPN_DICE_DISCOUNT ]
          then
            nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
            PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_WPN_DICE_DISCOUNT))
            PL_WPN_DICE=$(($PL_WPN_DICE + 1))
            echo ""
            echo "Tu numero de tiradas ha aumentado en +1. $PL_WPN_DICE"
            echo ""
            read -p "         Pulsa Enter             "
          else
            echo ""
            echo "No tienes suficiente esencia"
            read -p "         Pulsa Enter             "
        fi
        ;;
      2)
        if [ $PL_EXP -ge $PL_UPGRADE_COST_WPN_QUANT_DISCOUNT ]
          then
            nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
            PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_WPN_QUANT_DISCOUNT))
            PL_WPN_DMG=$(($PL_WPN_DMG + 1))
            echo ""
            echo "Tu rango de daño ha aumentado en +1. $PL_WPN_DMG"
            echo ""
            read -p "         Pulsa Enter             "
          else
            echo ""
            echo "No tienes suficiente esencia"
            read -p "         Pulsa Enter             "
        fi
        ;;
      3)
        if [ $PL_EXP -ge $PL_UPGRADE_COST_WPN_BONUS_DISCOUNT ]
          then
            nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_generic.wav >/dev/null 2>&1 &
            PL_EXP=$(($PL_EXP - $PL_UPGRADE_COST_WPN_BONUS_DISCOUNT))
            PL_WPN_UPGRADE_BONUS=$(($PL_WPN_UPGRADE_BONUS + 1))
            echo ""
            echo "Tu bonus de arma ha aumentado en +1. $PL_WPN_UPGRADE_BONUS"
            echo ""
            read -p "         Pulsa Enter             "
           else
            echo ""
            echo "No tienes suficiente esencia"
            read -p "         Pulsa Enter             "
        fi
        ;;
      0)
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
        PL_UPGRADE_MENU_WPN=0
        ;;
      *)
        read -p "         Introduce un número válido             "
        ;;
    esac
  done
}
# Menu de curación específica #
function PL_UPGRADES_HEAL {
  PL_UPGRADE_CHOICE=""
  PL_UPGRADE_MENU_HEAL=1
  if [ $PL_HP -eq $PL_HP_MAX ]
    then
      PL_UPGRADE_MENU_HEAL=0
      echo "Ya tienes la vida la máximo"
      read -p "         Pulsa Enter             "
  fi
  while [ $PL_UPGRADE_MENU_HEAL -eq 1 ]; do
    PL_UPGRADES_COST_UPDATE
    clear
    echo "Esencia disponible: $PL_EXP | Vida actual: $PL_HP/$PL_HP_MAX"
    echo "Esta opción te permite curarte una cantidad de vida específica"
    echo ""
    echo " 1) Curarse cantidad específica (El coste de 1 punto de HP son $PL_UPGRADE_COST_HP_SPECIFIC_DISCOUNT de esencia)"
    echo " 0) Volver al menú anterior"
    read -p "Elige una opción: " PL_UPGRADE_MENU_HEAL_OPTION
    case $PL_UPGRADE_MENU_HEAL_OPTION in
      1)
        read -p "¿Cuanta vida deseas curarte? " PL_UPGRADES_HEAL_QUANTITY
        if [[ "$PL_UPGRADES_HEAL_QUANTITY" = "" ]]
          then
            echo "Introduce un número"
            read -p "         Pulsa Enter             "
          else
            PL_UPGRADES_HEAL_COST=$(($PL_UPGRADES_HEAL_QUANTITY * $PL_UPGRADE_COST_HP_SPECIFIC_DISCOUNT))
            echo "$PL_UPGRADES_HEAL_QUANTITY costarán $PL_UPGRADES_HEAL_COST"
            if [ $PL_EXP -lt $PL_UPGRADES_HEAL_COST ]
              then
                echo "No tienes suficiente esencia"
                read -p "         Pulsa Enter             "
              else
                PL_EXP=$(($PL_EXP - $PL_UPGRADES_HEAL_COST ))
                PL_HP=$(($PL_HP + $PL_UPGRADES_HEAL_QUANTITY))
                PL_HP_OVERFLOW_CHECK
                nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/upgrade/upgrade_heal.wav >/dev/null 2>&1 &
                echo "Te curas $PL_UPGRADES_HEAL_QUANTITY puntos de vida!"
                PL_UPGRADE_MENU_HEAL=0
                read -p "         Pulsa Enter             "
            fi
        fi

        ;;
      0)
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/menu_optionSelected.wav >/dev/null 2>&1 &
        PL_UPGRADE_MENU_HEAL=0
        ;;
      *)
        echo "Introduce una opción correcta"
        read -p "         Pulsa Enter             "
        ;;
    esac
  done
}

# Comprueba si el hechizo acierta o no "
function PL_MAGIC_CHECK {
  NPC_DICE=$(($[RANDOM%20+1] + $PL_SPELL_TARGET_STAT_MOD))
  if [[ $VERBOSE = "v" ]]
    then
      echo "NPC_ST: $NPC_DICE VS PL_C_SPELL_DC: $PL_C_SPELL_DC"
  fi
  if [ $NPC_DICE -ge $PL_C_SPELL_DC ]
    then
      echo -e "\e[1;91m$NPC_NAME\e[0m resiste el hechizo"
    else
      PL_MAGIC_HIT=1
  fi
}
# Menú de hechizos de jugador #
function PL_MAGIC {
PL_MAGIC_MENU=1
  while [ $PL_MAGIC_MENU -eq 1 ]
    do
      clear
      COMBAT_SCREEN
      PL_MAGIC_MENU_CHOICE=""
      PL_MAGIC_HIT=0
      echo -e "  1) \e[1;101mFireball\e[0m │ Coste: 65 │ 8d8 de daño. 1/2 daño con DEX save" 
      echo -e "  2) \e[1;100mRend\e[0m     │ Coste: 40 │ Reduce en 1 la AC del enemigo"
      echo -e "  3) Hechizos Curativos │ Hechizos de curación y estado"
      echo -e "  4) Buffos Personales    │ Mejora tus stats o tu AC"
      echo -e "  0) Volver al menú de acción"
      echo ""
      read -p "Escoge una acción: " PL_MAGIC_MENU_CHOICE
      case $PL_MAGIC_MENU_CHOICE in
        1)
          if [ $PL_MANA_CURRENT -ge 65 ]
            then
              PL_MAGIC_MENU=0
              PL_TURN_MENU=0
              PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 65))
              PL_SPELL_TARGET_STAT_MOD=$NPC_C_DEX_MOD
              FB_RNDM_SND=$[RANDOM%4+1]
              nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_fire_$FB_RNDM_SND.wav >/dev/null 2>&1 &
              echo -e "\e[1;92m$PL_NAME\e[0m castea \e[1;101mFireball\e[0m"
              PL_MAGIC_CHECK
              PL_SPELL_DMG_TOTAL=0
              for ((fball = 1 ; fball <= 8 ; fball++ ))
                do
                  PL_SPELL_DMG_DICE=$[RANDOM%8+1]
                  PL_SPELL_DMG_TOTAL=$(($PL_SPELL_DMG_TOTAL + $PL_SPELL_DMG_DICE))
                  if [[ $VERBOSE = "v" ]]
                    then
                      echo "dado número: $fball"
                      echo "Resultado: $PL_SPELL_DMG_DICE"
                      echo "Daño acumulado: $PL_SPELL_DMG_TOTAL"
                      echo ""
                  fi
                done          
              if [ $PL_MAGIC_HIT -eq 1 ]
                then
                  NPC_C_HP=$(($NPC_C_HP - $PL_SPELL_DMG_TOTAL))
                else
                  PL_SPELL_DMG_TOTAL=$(($PL_SPELL_DMG_TOTAL / 2))
                  NPC_C_HP=$(($NPC_C_HP - $PL_SPELL_DMG_TOTAL))
              fi
              echo -e "\e[1;91m$NPC_NAME\e[0m sufre \e[1;91m$PL_SPELL_DMG_TOTAL\e[0m puntos de daño"
              read -p "         Pulsa Enter             "
            else
              echo -e "\e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
              read -p "         Pulsa Enter             "
          fi
          ;;
        2)
          if [ $PL_MANA_CURRENT -ge 40 ]
            then
              PL_MAGIC_MENU=0
              PL_TURN_MENU=0
              PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
              PL_SPELL_TARGET_STAT_MOD=$NPC_C_WIS_MOD
              echo -e "\e[1;92m$PL_NAME\e[0m castea \e[1;100mRend\e[0m"
              read -p "         Pulsa Enter             "
              PL_MAGIC_CHECK
              if [ $PL_MAGIC_HIT -eq 1 ]
                then
                  PL_REND_SND=$[RANDOM%4+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_alter_$PL_REND_SND.wav >/dev/null 2>&1 &
                  NPC_C_AC=$((NPC_C_AC - 1))
                  echo -e "La AC de \e[1;91m$NPC_NAME\e[0m se reduce en 1"
              fi
            else
              echo -e "\e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
              read -p "         Pulsa Enter             "
          fi
          ;;
        3)
          PL_MAGIC_HEALS
          ;;
        4)
          PL_MAGIC_BUFFS
          ;;
        0)
          PL_MAGIC_MENU=0
          ;;
        *)
          echo ""
          read -p "         Escoge una opción válida             "
          ;;
      esac
    done
}
# Menú de curaciones y cleanse #
function PL_MAGIC_HEALS {
  PL_MAGIC_MENU_SUBMENU_OPTION=""
  PL_MAGIC_MENU_SUBMENU=1
    while [ $PL_MAGIC_MENU_SUBMENU -eq 1 ]
      do
        clear
          echo -e "HP: \e[32m$PL_HP/$PL_HP_MAX\e[0m │ MP: \e[1;34m$PL_MANA_CURRENT/$PL_MANA_MAX\e[0m │ Estado: \e[1;93m$PL_C_STATUS\e[0m"
          echo -e "1) \e[1;90;103mHeal\e[0m\t\t │ Coste: 20 │ Te cura 10 puntos de daño"
          echo -e "2) \e[1;90;103mHeal+\e[0m\t │ Coste: 45 │ Te cura 25 puntos de daño"
          echo -e "3) \e[1;90;103mHeal++\e[0m\t │ Coste: 80 │ Te cura 50 puntos de daño"
          echo -e "4) Cleanse\t │ Coste: 30 │ Elimina el veneno"
          echo -e "0) Vover al menú de hechizos"
          echo ""
          read -p "Escoge un hechizo: " PL_MAGIC_MENU_SUBMENU_OPTION
          case $PL_MAGIC_MENU_SUBMENU_OPTION in
            1)
              if [ $PL_MANA_CURRENT -ge 20 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 20))
                  PL_HP=$(($PL_HP + 10 ))
                  PL_HP_OVERFLOW_CHECK
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_heal_1.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Heal"
                  echo -e "\e[1;92m$PL_NAME\e[0m se cura 10 puntos de vida"
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            2)
              if [ $PL_MANA_CURRENT -ge 45 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 45))
                  PL_HP=$(($PL_HP + 25 ))
                  PL_HP_OVERFLOW_CHECK
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_heal_2.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Heal+"
                  echo -e "\e[1;92m$PL_NAME\e[0m se cura 25 puntos de vida"
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            3)
              if [ $PL_MANA_CURRENT -ge 80 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 80))
                  PL_HP=$(($PL_HP + 50 ))
                  PL_HP_OVERFLOW_CHECK
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_heal_4.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Heal++"
                  echo -e "\e[1;92m$PL_NAME\e[0m se cura 50 puntos de vida"
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            4)
              if [ $PL_MANA_CURRENT -ge 30 ]
                then
                  if [ $PL_C_STATUS = "Envenenado" ]
                    then
                      PL_TURN_MENU=0
                      PL_MAGIC_MENU=0
                      PL_MAGIC_MENU_SUBMENU=0
                      PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 30))
                      PL_C_STATUS="OK"
                      echo -e "\e[1;92m$PL_NAME\e[0m castea Cleanse "
                    else
                      echo -e "\e[1;92m$PL_NAME\e[0m no está envenenado"
                      read -p "         Pulsa Enter             "
                  fi
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            0)
              PL_MAGIC_MENU_SUBMENU=0
              ;;
            *)
              ;;
          esac
        done
}
# Menú de buffos mágicos #
function PL_MAGIC_BUFFS {
  PL_MAGIC_MENU_SUBMENU_OPTION=""
  PL_MAGIC_MENU_SUBMENU=1
    while [ $PL_MAGIC_MENU_SUBMENU -eq 1 ]
      do
        clear
          echo -e "MP: \e[1;34m$PL_MANA_CURRENT/$PL_MANA_MAX\e[0m"
          echo -e ""
          echo -e "1) Bull Strength  │ Coste: 40 │ Aumenta tu fuerza en 2 ($PL_C_STR)"
          echo -e "2) Cat Grace\t  │ Coste: 40 │ Aumenta tu dexteridad en 2 ($PL_C_DEX)"
          echo -e "3) Bear Endurance │ Coste: 40 │ Aumenta tu constitucion en 2 ($PL_C_CON)"
          echo -e "4) Fox Cunning\t  │ Coste: 40 │ Aumenta tu inteligencia en 2 ($PL_C_INT)"
          echo -e "5) Owl Wisdom\t  │ Coste: 40 │ Aumenta tu sabiduría en 2 ($PL_C_WIS)"
          echo -e "6) Eagle Splendor │ Coste: 40 │ Aumenta tu carisma en 2 ($PL_C_CHA)"
          echo -e "7) \e[1;100mMage Armour\e[0m\t  │ Coste: 25 │ Aumenta tu armadura en 1 ($PL_C_ARMOR)"
          echo -e "0) Volver al menú de hechizos"
          echo ""
          read -p "Escoge un hechizo: " PL_MAGIC_MENU_SUBMENU_OPTION
          case $PL_MAGIC_MENU_SUBMENU_OPTION in
            1)
              if [ $PL_MANA_CURRENT -ge 40 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
                  PL_C_STR=$(($PL_C_STR + 2))
                  PL_C_STAT_REFRESH
                  ALTER_RNDM_SND=$[RANDOM%3+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_alterself_$ALTER_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Bull Strenght"
                  echo -e " La fuerza de \e[1;92m$PL_NAME\e[0m aumenta en 2"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            2)
              if [ $PL_MANA_CURRENT -ge 40 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
                  PL_C_DEX=$(($PL_C_DEX + 2))
                  PL_C_STAT_REFRESH
                  ALTER_RNDM_SND=$[RANDOM%3+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_alterself_$ALTER_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Cat Grace"
                  echo -e " La dexteridad de \e[1;92m$PL_NAME\e[0m aumenta en 2"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            3)
              if [ $PL_MANA_CURRENT -ge 40 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
                  PL_C_CON=$(($PL_C_CON + 2))
                  PL_C_STAT_REFRESH
                  ALTER_RNDM_SND=$[RANDOM%3+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_alterself_$ALTER_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Bear Endurance"
                  echo -e " La constitución de \e[1;92m$PL_NAME\e[0m aumenta en 2"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            4)
              if [ $PL_MANA_CURRENT -ge 40 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
                  PL_C_INT=$(($PL_C_INT + 2))
                  PL_C_STAT_REFRESH
                  ALTER_RNDM_SND=$[RANDOM%3+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_alterself_$ALTER_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Fox Cunning"
                  echo -e " La Inteligencia de \e[1;92m$PL_NAME\e[0m aumenta en 2"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            5)
              if [ $PL_MANA_CURRENT -ge 40 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
                  PL_C_WIS=$(($PL_C_WIS + 2))
                  PL_C_STAT_REFRESH
                  ALTER_RNDM_SND=$[RANDOM%3+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_alterself_$ALTER_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Owl Wisdom"
                  echo -e " La sabiduría de \e[1;92m$PL_NAME\e[0m aumenta en 2"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            6)
              if [ $PL_MANA_CURRENT -ge 40 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 40))
                  PL_C_CHA=$(($PL_C_CHA + 2))
                  PL_C_STAT_REFRESH
                  ALTER_RNDM_SND=$[RANDOM%3+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/spell_alterself_$ALTER_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Eagle splendor"
                  echo -e " La carisma de \e[1;92m$PL_NAME\e[0m aumenta en 2"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            7)
              if [ $PL_MANA_CURRENT -ge 25 ]
                then
                  PL_TURN_MENU=0
                  PL_MAGIC_MENU=0
                  PL_MAGIC_MENU_SUBMENU=0
                  PL_MANA_CURRENT=$(($PL_MANA_CURRENT - 25))
                  PL_C_ARMOR=$(($PL_C_ARMOR + 1))
                  PL_C_STAT_REFRESH
                  MARM_RNDM_SND=$[RANDOM%4+1]
                  nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/spell/cast_prot_$MARM_RNDM_SND.wav >/dev/null 2>&1 &
                  echo -e "\e[1;92m$PL_NAME\e[0m castea Mage armour"
                  echo -e " La AC de \e[1;92m$PL_NAME\e[0m aumenta en 1"
                  read -p "         Pulsa Enter             "
                else
                  echo -e " \e[1;92m$PL_NAME\e[0m no tiene maná suficiente"
                  read -p "         Pulsa Enter             "
              fi
              ;;
            0)
              PL_MAGIC_MENU_SUBMENU=0
              ;;
            *)
              echo ""
              read -p "         Escoge una opción válida             "
              ;;
          esac
        done
}
# Calcula el daño del jugador #
function PL_DAMAGE {
  PL_DMG_DICE=0
  PL_DMG_TOTAL=0
  for ((d = 1 ; d <= $PL_WPN_DICE ; d++ ))
    do
      PL_DMG_DICE=$[RANDOM%$PL_WPN_DMG+1]
      PL_DMG_TOTAL=$(($PL_DMG_TOTAL + $PL_DMG_DICE))
      if [[ $VERBOSE = "v" ]]
        then
          echo "dado número: $d"
          echo "Resultado: $PL_DMG_DICE"
          echo "Daño acumulado: $PL_DMG_TOTAL"
          echo ""
      fi
    done
  if [ $PL_ATTACK_TYPE -eq 1 ]
    then
      PL_DMG_TOTAL=$((PL_DMG_TOTAL + PL_C_DMG_BONUS + PL_WPN_UPGRADE_BONUS))
  elif [ $PL_ATTACK_TYPE -eq 0 ]
    then
      PL_DMG_TOTAL=$((PL_DMG_TOTAL + PL_C_DMG_BONUS + PL_WPN_UPGRADE_BONUS - 2))
    else
      PL_DMG_TOTAL=$((PL_DMG_TOTAL + PL_C_DMG_BONUS + PL_WPN_UPGRADE_BONUS + 2))
  fi
  PL_DAMAGE_UNDERFLOW_CHECK
  if [[ $VERBOSE = "v" ]]
    then
      if [ $PL_ATTACK_TYPE -eq 0 ]
        then
          echo "Penalizacion -2 por ataque ligero"
      elif [ $PL_ATTACK_TYPE -eq 2 ]
        then
          echo "Bonificacion +2 por ataque pesado"
      fi
      echo "Modificador de daño: STAT: $PL_C_DMG_BONUS | ARMA: $PL_WPN_UPGRADE_BONUS "
      echo "Resultado daños: $PL_DMG_TOTAL"
  fi
  if [ $PL_DICE -eq 20 ]
    then
      PL_DMG_TOTAL=$((PL_DMG_TOTAL * 2))
      echo "Daño doble por crítico: $PL_DMG_TOTAL"
    else 
      echo "Daño total: $PL_DMG_TOTAL"
  fi
  read -p "         Pulsa Enter             "
  NPC_C_HP=$(($NPC_C_HP - $PL_DMG_TOTAL))
  echo ""
  # COMBAT_SCREEN
  # if [ $NPC_C_HP -le  0 ]
    # then
      # COMBAT_SCREEN
      # COMBAT_END_FLAG=1
      # echo -e "¡Has derrotado al \e[1;91m$NPC_NAME\e[0m!"
      # echo -e " \e[1;92m$PL_NAME\e[0m obtiene $NPC_EXP de esencia"
      # PL_EXP=$(($PL_EXP + $NPC_EXP))
    # else
      # #echo -e "¡Al \e[1;91m$NPC_NAME\e[0m le quedan $NPC_C_HP puntos de vida!"#
      # echo ""
  # fi 
  read -p "         Pulsa Enter             "
}
# Asigna daño a 1 si este es inferior o igual a 0 #
function PL_DAMAGE_UNDERFLOW_CHECK {
  if [ $PL_DMG_TOTAL -le 0 ]
    then
      PL_DMG_TOTAL=1
  fi
}
### definir funcion ataque de jugador ###
function PL_ATTACK {
  PL_DICE=$[RANDOM%20+1]
  COMBAT_SCREEN
  if [ $PL_ATTACK_TYPE -eq 0 ]
    then
      echo -e "\e[1;92m$PL_NAME\e[0m realiza un ataque ligero +2HIT -2DMG"
  elif [ $PL_ATTACK_TYPE -eq 2 ]
    then
      echo -e "\e[1;92m$PL_NAME\e[0m realiza un ataque pesado -2HIT +2DMG"
  fi
  if [[ $VERBOSE = "v" ]]
    then
      echo "El resultado del dado es $PL_DICE"
      echo ""
  fi
  if [ $PL_DICE -eq 20 ]
    then
      nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/wpn/hit_$PL_WPN.wav >/dev/null 2>&1 &
      echo "¡Un golpe crítico!"
      read -p "         Pulsa Enter             "
      echo ""
      PL_DAMAGE
    else
      if [[ $VERBOSE = "v" ]]
        then
          echo -e "\e[1;92m$PL_NAME\e[0m Obtiene un $PL_DICE + $PL_HIT + $PL_WPN_UPGRADE_BONUS en su tirada a hit"
          read -p "         Pulsa Enter             "
      fi
      if [ $PL_ATTACK_TYPE -eq 1 ]
        then
          PL_DICE_TOTAL=$(($PL_DICE + $PL_HIT + $PL_WPN_UPGRADE_BONUS))
      elif [ $PL_ATTACK_TYPE -eq 0 ]
        then
          PL_DICE_TOTAL=$(($PL_DICE + $PL_HIT + $PL_WPN_UPGRADE_BONUS + 2 ))
        else
          PL_DICE_TOTAL=$(($PL_DICE + $PL_HIT + $PL_WPN_UPGRADE_BONUS - 2 ))
      fi
      echo ""
      if [ $PL_DICE_TOTAL -ge $NPC_C_AC ]
        then
          #COMBAT_SCREEN
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/wpn/hit_$PL_WPN.wav >/dev/null 2>&1 &
          echo -e "¡\e[1;92m$PL_NAME\e[0m consigue dar!"
          PL_DAMAGE
        else
          nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/fx/wpn/miss_$PL_WPN.wav >/dev/null 2>&1 &
          echo -e "El ataque de \e[1;92m$PL_NAME\e[0m falla"
          echo ""
          read -p "         Pulsa Enter             "
          echo ""
      fi
  fi
}
# Comprueba si el jugador logra huir del combate #
function PL_FLEE {
  PL_DICE=$[RANDOM%20+1]
  NPC_DICE=$[RANDOM%20+1]
  if [[ $VERBOSE = "v" ]]
    then
      echo -e "La tirada de huida de \e[1;92m$PL_NAME\e[0m es $PL_DICE"
      echo -e "El bonus de huida de \e[1;92m$PL_NAME\e[0m es $PL_C_DEX_MOD"
      echo -e "El tirada de huida de \e[1;91m$NPC_NAME\e[0m es $NPC_DICE"
      echo -e "El bonus de huida de \e[1;91m$NPC_NAME\e[0m es $NPC_C_DEX_MOD"
  fi
  if [ $PL_CLASS = "Picaro" ]
    then
      PL_C_FLEE=$(($PL_DICE + $PL_C_DEX_MOD + 4))
    else
      PL_C_FLEE=$(($PL_DICE + $PL_C_DEX_MOD))
  fi
  NPC_C_FLEE=$(($NPC_DICE + $NPC_C_DEX_MOD))
  if [ $PL_C_FLEE -gt $NPC_C_FLEE ]
    then
      echo -e "\e[1;92m$PL_NAME\e[0m consigue huir"
      COMBAT_END_FLAG=1
      FLEE_FLAG=1
  elif [ $PL_C_FLEE -le $NPC_C_FLEE ]
    then
      echo -e "\e[1;92m$PL_NAME\e[0m no consigue huir"
  fi
}

resize -s 33 87
VERBOSE=0
VERBOSE=$1
GAME_EXIT=0
PL_UPGRADES_SET_COST
source ./g
if [ $INTRO -eq 1 ]
  then
    source ./intro.sh
fi
while [ $GAME_EXIT -eq 0 ]
  do
    source ./g
    GAME_OVER=0
    FINAL_BOSS=0
    MAIN_MENU=1
    while [ $MAIN_MENU -eq 1 ]
      do
        clear
        echo "                                                                                 V 2.0"
        echo -e "                   \e[91m@@@@@@@   @@@        @@@@@@    @@@@@@   @@@@@@@  "
        echo -e "                   @@@@@@@@  @@@       @@@@@@@@  @@@@@@@@  @@@@@@@@ "
        echo -e "                   @@!  @@@  @@!       @@!  @@@  @@!  @@@  @@!  @@@ "
        echo -e "                   !@   @!@  !@!       !@!  @!@  !@!  @!@  !@!  @!@ "
        echo -e "                   @!@!@!@   @!!       @!@  !@!  @!@  !@!  @!@  !@! "
        echo -e "                   !!!@!!!!  !!!       !@!  !!!  !@!  !!!  !@!  !!! "
        echo -e "                   !!:  !!!  !!:       !!:  !!!  !!:  !!!  !!:  !!! "
        echo -e "                   :!:  !:!   :!:      :!:  !:!  :!:  !:!  :!:  !:! " 
        echo -e "                    :: ::::   :: ::::  ::::: ::  ::::: ::   :::: :: " 
        echo -e "                   :: : ::   : :: : :   : :  :    : :  :   :: :  :  " 
        echo -e "                                                           "   
        echo -e "                      \e[0m@@@@@@@@@@    @@@@@@    @@@@@@   @@@  @@@"        
        echo -e "                      @@@@@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@ @@@"        
        echo -e "                      @@! @@! @@!  @@!  @@@  @@!  @@@  @@!@!@@@"        
        echo -e "                      !@! !@! !@!  !@!  @!@  !@!  @!@  !@!!@!@!"        
        echo -e "                      @!! !@! @!@  @!@  !@!  @!@  !@!  @!@ !!@!"        
        echo -e "                      !@!  !! !@!  !@!  !!!  !@!  !!!  !@!  !!!"        
        echo -e "                      !!:     !!:  !!:  !!!  !!:  !!!  !!:  !!!"        
        echo -e "                      :!:     :!:  :!:  !:!  :!:  !:!  :!:  !:!"        
        echo -e "                      :::     ::   ::::: ::  ::::: ::   ::   ::"        
        echo -e "                       :      :     : :  :    : :  :   ::    : "                   
        echo ""
        echo ""
        #parametros de aplay -t formato fichero, -f codificacion, -r bitrate de audio en Hz
        nohup aplay -q -t WAV -f S16_LE -R 44100 ./snd/umbra_nigra.wav >/dev/null 2>&1 &
        echo -e " \t\t\t\t1) Comenzar Partida"
        echo ""
        if [ $GAUNTLET -eq 1 ]
          then
            echo -e " \t\t\t\t2) Gauntlet"
            echo ""
        fi
        echo -e " \t\t\t\t0) Salir"
        #Elimina la intro, variable contenida en el fichero "g"
        sed -i s/INTRO=1/INTRO=0/g g
        read -p "> " MAIN_MENU_OPTION
        case $MAIN_MENU_OPTION in
          1)
            MAIN_MENU=0
            ;;
          2)
            if [ $GAUNTLET -eq 1 ]
              then
                echo "Disponible con el DLC"
                echo ""
                read -p "         Pulsa Enter             "
              else
                echo "Elige una opción correcta"
                read -p "         Pulsa Enter             "
            fi
            ;;
          0)
            MAIN_MENU=0
            GAME_EXIT=1
            ;;
          *)
            echo "Elige una opción correcta"
            read -p "         Pulsa Enter             "
            ;;
        esac
      done
    if [ $GAME_EXIT -eq 0 ]
      then
        PL_LVL=3
        CHARGEN_NAME
        CHARGEN_RACE
        CHARGEN_CLASS
        CHARGEN_STATS
        ### Declarar stats de combate de jugador ###
        PL_C_STAT_ASSIGN
        PL_C_STAT_REFRESH
        ### Muestra stats y modificadores ###
        clear
        echo -e "Estas son las estadísticas finales para \e[1;92m$PL_NAME\e[0m"
        echo -e "╔══════════════════╗"
        echo -e "║NIVEL ║ PROFIENCIA║"
        echo -e "║══════════════════║"
        echo -e "║  $PL_LVL   ║     +$PL_PROF\t   ║"
        echo -e "╚══════════════════╝"
        echo ""
        echo -e "╔═══════════════════════════════════╗"
        echo -e "║Vida: \e[1;32m$PL_HP/$PL_HP_MAX\e[0m ║ Armadura: $PL_ARMOR ║ AC: \e[1;100m$PL_C_AC\e[0m ║"
        if [ $PL_CLASS = "Mago" ]
          then
            echo -e "║═══════════════════════════════════║"
            echo -e "║Maná: \e[1;34m$PL_MANA_CURRENT/$PL_MANA_MAX\e[0m Regeneración: \e[1;36m$PL_C_MANA_REGEN\e[0m\t    ║"
            echo -e "║Spell DC: \e[1;36m$PL_C_SPELL_DC\e[0m\t\t\t    ║"
            echo -e "╚═══════════════════════════════════╝"
            echo ""
          else
            echo -e "╚═══════════════════════════════════╝"
        fi
        echo -e "╔═══════════════════════╗"
        echo -e "║ \tSTATS\t║  MOD  ║"
        echo -e "║═══════════════════════║"
        echo -e "║STR:\t  $PL_STR \t║  $PL_STR_MOD\t║"
        echo -e "║DEX:\t  $PL_DEX \t║  $PL_DEX_MOD\t║"
        echo -e "║CON:\t  $PL_CON \t║  $PL_CON_MOD\t║"
        echo -e "║INT:\t  $PL_INT \t║  $PL_INT_MOD\t║"
        echo -e "║WIS:\t  $PL_WIS \t║  $PL_WIS_MOD\t║"
        echo -e "║CHA:\t  $PL_CHA \t║  $PL_CHA_MOD\t║"
        echo -e "╚═══════════════════════╝"
        echo ""
        ################ CHARGEN ENDING #########################
        echo "HIT MOD │ DMG MOD │ INITIATIVE"
        echo "   $PL_HIT    │    $PL_DMG_BONUS    │     $PL_INI_MOD "
        echo ""
        read -p "         Pulsa Enter             "
        echo ""
        ### Recalcular modificadores de combate del jugador ###
        PL_C_STAT_REFRESH
        if [ $GAME_OVER -eq 0 ]
          then
            source ./chapters/c1.sh
            BATTLE
            if [[ $VERBOSE = "v" ]]
              then 
                echo "End of chapter"
                read -p "         Pulsa Enter             "
            fi
        fi
        if [ $GAME_OVER -eq 0 ]
          then
            source ./chapters/c2.sh
            BATTLE
            if [[ $VERBOSE = "v" ]]
              then 
                echo "End of chapter"
                read -p "         Pulsa Enter             "
            fi
        fi
        if [ $GAME_OVER -eq 0 ]
          then
            source ./chapters/c3.sh
            FINAL_BOSS=1
            BATTLE
            if [ $PL_HP -gt 0 ]
              then
                GAME_OVER=2
            fi
            if [[ $VERBOSE = "v" ]]
              then 
                echo "End of chapter"
                read -p "         Pulsa Enter             "
            fi
        fi
        if [ $GAME_OVER -eq 1 ]
          then
            source ./chapters/gameover.sh
        fi
        if [ $GAME_OVER -eq 2 ]
          then
            source ./chapters/end.sh
        fi
      else
        echo "Cobarde..."
    fi
  done
