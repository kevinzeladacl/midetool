#!/bin/bash
clear
cat << "EOF"

              _                            _              _             _          _____ 
             | |                          | |            | |           (_)        / __  \
__      _____| | ___ ___  _ __ ___   ___  | |_ ___     __| | __ _ _ __  _  __   __`' / /'
\ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | __/ _ \   / _` |/ _` | '_ \| | \ \ / /  / /  
 \ V  V /  __/ | (_| (_) | | | | | |  __/ | || (_) | | (_| | (_| | |_) | |  \ V / ./ /___
  \_/\_/ \___|_|\___\___/|_| |_| |_|\___|  \__\___/   \__,_|\__,_| .__/|_|   \_/  \_____/
                                                                 | |                     
                                                                 |_|     by  @kevinzeladacl
                                                                         

PROJECT: MIDETOOL

==========================================================================================

SELECT A OPTION (enter number):

============LOCAL/DEV OPTIONS ==========
0 - RUN WITH DEBUG CONSOLE (DEV)
1 - AUTO LOCAL MIGRATIONS
2 - CREATE SUPER USER LOCAL


============PROD OPTIONS ==========
51 - RUN WITH DEBUG CONSOLE (PROD)
52 - AUTO PROD MIGRATIONS
999 - INSTALL PROJECT LOCAL

===========================================================================================

EOF

read option
case $option in
  999) 
     echo "Installing now ..."
     pip install -r requirements/staging.txt
     python3 manage.py makemigrations --settings=dapi.settings.local
     python3 manage.py migrate --settings=dapi.settings.local
  ;;
  0) 
     echo "RUN WITH DEBUG CONSOLE (DEV)..."
     python3 manage.py runserver 0.0.0.0:8015 --settings=dapi.settings.local
  ;;
  1)
     echo "RUN AUTO LOCAL MIGRATIONS..."
     pip install -r requirements/staging.txt
     python3 manage.py makemigrations --settings=dapi.settings.local
     python3 manage.py migrate --settings=dapi.settings.local
     clear
     echo "DONE!!!"
  ;;
  2) 
     echo "CREATE SUPER USER..."
     python3 manage.py createsuperuser --settings=dapi.settings.local
  ;;
  51) 
     echo "RUN WITH DEBUG CONSOLE (PROD)..."
     python3 manage.py runserver 0.0.0.0:8009 --settings=dapi.settings.prod
  ;;
  52)
     echo "RUN AUTO PROD MIGRATIONS..."
     python3 manage.py makemigrations --settings=dapi.settings.prod
     python3 manage.py migrate --settings=dapi.settings.prod
  ;;
  *)
     echo "Select a valid option 77"
  ;;

esac  