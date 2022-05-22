#!/usr/bin/bash

<<HI
project: DBMS <bash script>
describtion: this file represent DDl operation 
Authors: <Ahmed Abdelsalam>.<Ismael Ramadan> 
HI
echo    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\n~~~~~~~~~< Welcome TO DBMS Using Shell Scripting >~~~~~~~~~~\n"
echo    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

main_menu(){
    echo -e "\n  ~~~~~~~~~< choose from menu: >~~~~~~~~~~\n"
    echo "~~~~~~~<   1. Create Database       >~~~~~~~"
    echo "~~~~~~~<   2. List Databases        >~~~~~~~"
    echo "~~~~~~~<   3. Connect To Databases  >~~~~~~~"
    echo "~~~~~~~<   4. Drop Database         >~~~~~~~"
    echo "~~~~~~~<   5. Exit                  >~~~~~~~"

    read -p "Enter the Number of your choice:  " choice

    if (($choice >=1)) && (($choice <=5));then
        case $choice in 
            1) creating_db ;;
            2) list_db ;;
            3) connect_db ;;
            4) drop_db ;;
            5) exit ;;
            *) echo "Ooops! wrong input <<check again>>" main_menu
        esac
    else
        echo "Wrong input !!" 
        main_menu
    fi
}
creating_db()
{
	read -p "Enter DB name plz;" dbname
	if [[ "$dbname" =~ ^[a-zA-Z]{3,15}$ ]];then
		if [ -d "DBMS_dir/$dbname" ];then
			echo " DBname already exist !"
			creating_db
		else
			mkdir DBMS_dir/$dbname
                        main_menu
		fi			
	else
		echo "Enter Valid name plz;"
		creating_db
	fi

}
list_db()
{       if [ $(ls -A DBMS_dir) ];then
                ls DBMS_dir
        else
                echo "Ooops. No Databases to Display" 
        fi
        main_menu
}
connect_db()
{
        read -p "Enter DB name plz;" dbname
	if [[ "$dbname" =~ ^[a-zA-Z]{3,15}$ ]];then
		if [ -d "DBMS_dir/$dbname" ];then
			echo "right plz wait !"
                        sleep 2
                        export $dbname
			./ddl.sh
		else
		        read -p "DB doesn't exist >> creat new ? [y|n] " ch 
                        case $ch in 
                                y) creating_db ;;
                                n) main_menu ;;
                                *) exit ;;
                        esac
		fi			
	else
		echo "Enter Valid name plz;"
		connect_db
	fi
}
drop_db()
{
        read -p "Enter DB name plz;" dbname
	if [[ "$dbname" =~ ^[a-zA-Z]{3,15}$ ]];then
		if [ -d "DBMS_dir/$dbname" ];then
                        rm -rf DBMS_dir/$dbname 
		else
                        echo "DB doesn't exist !"
                        main_menu
		fi			
	else
		echo "Enter Valid name plz;"
		drop_db
	fi
}


#############
main_menu
###########
<<C
select choice in creat_DB list_Db connect_DB drop_DB
do
	case $choice in
		creat_DB) echo "enter DB name"
			read DBname
			if [[ "$DBname" =~ ^[a-zA-Z]{3,15}$ ]]; 
			then
				if [ -d "DBS/$DBname" ]
                                then
                                        echo "this DBname is exist"
                                else
                                        mkdir DBS/$DBname
                                fi

			else
				echo "DBname must begin with charcter"
			fi
			;;
		list_Db) ls DBS
			;;
		connect_DB) echo "enter DB name"
                        read DBname
			  if [ -d "DBS/$DBname" ]
                                then
                                        echo "this DBname is exist"
                                else
                                        echo "this DBname is not exist"
                                fi

			;;
		drop_DB) echo "enter DB name"
                         read DBname
                          if [ -d "DBS/$DBname" ]
                                then
					rm -rf DBS/$DBname
                                else
                                        echo "this DBname is not exist"
                                fi

			;;
		5)exit
			;;
		*)echo "$REPLY is not one of choices"
			;;
	esac
done	
C