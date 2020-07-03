#!/bin/bash
source ./g
for i in scr/*; do
  source $i
done
resize -s 33 87
VERBOSE=0
VERBOSE=$1
GAME_EXIT=0
PL_UPGRADES_SET_COST

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
        CHARGEN_FINISH
        ### Recalcular modificadores de combate del jugador ###
        PL_C_STAT_REFRESH
        chp_count=1
        chp_path="./chapters/c"
        chp_sufx=".sh"
        while [ $GAME_OVER -eq 0 ]; do
          chp_full_path="${chp_path}${chp_count}${chp_sufx}"
          source $chp_full_path
          BATTLE

          if [[ $VERBOSE = "v" ]]
              then 
                echo "End of chapter"
                read -p "         Pulsa Enter             "
          fi

          if [[ $chp_count -eq 2 ]]
            then
              FINAL_BOSS=1
          fi

          if [ $chp_count -gt 2 ] && [ $PL_HP -gt 0 ]
              then
                GAME_OVER=2
          fi

          ((chp_count++))
        done

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
