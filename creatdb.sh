#!/usr/bin/bash
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
