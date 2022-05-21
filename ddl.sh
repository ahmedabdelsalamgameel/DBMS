#!/bin/bash
<<HI
project: DBMS <bash script>
describtion: this file represent DDl operation 
Authors: <Ahmed Abdelsalam>.<Ismael Ramadan> 
HI

#Upon user Connect to Specific Database, there will be new Screen with this Menu:
tables_menu(){
    echo -e "\n~~~~~~~~~< choose from menu: >~~~~~~~~~~\n"
    echo "~~~~~~~< 1. Create Table       >~~~~~~~"
    echo "~~~~~~~< 2. List Tables        >~~~~~~~"
    echo "~~~~~~~< 3. Drop Table         >~~~~~~~"
    echo "~~~~~~~< 4. Insert into Table  >~~~~~~~"
    echo "~~~~~~~< 5. Select from Table  >~~~~~~~"
    echo "~~~~~~~< 6. Delete from Table  >~~~~~~~"
    echo "~~~~~~~< 7. Update Table       >~~~~~~~"
    echo "~~~~~~~< 8. Back               >~~~~~~~"
    echo "~~~~~~~< 9. Exit               >~~~~~~~"

    read -p "   Enter the Number of your choice:  " choice

    if (($choice >=1)) && (($choice <=9));then
        case $choice in 
            1) creating_table ;;
            2) listing_table ;;
            3) droping_table ;;
            4) insert_into_table ;;
            5) select_from_table ;;
            6) delete_from_table ;;
            7) updating_table ;;
            8) ./main_menu.sh ;;
            9) exit ;;
            *) echo "Ooops! wrong input <<check again>>" tables_menu
        esac
    else
        echo "Wrong input !!" 
        tables_menu
    fi

}
creating_table()
{
    read -p "Enter table name: " tname
        if [ -f $tname ];then
            echo "this table already exist , choose another name "
            creating_table
        else
            touch $tname            
            read -p "Enter number of columns: " n_col
            for ((i=1;i<=$n_col;i++))
            {
                read -p "Enter data for column number $i : " data
                echo  $data >> $tname
            }
            echo "Data inserted successfully ! "
        fi
    echo "Hello from << creating_table >> function !"
}
listing_table()
{
    echo "Hello from << listing_table >> function !"
}
droping_table()
{
    echo "Hello from << droping_table >> function !"
}
insert_into_table()
{
    echo "Hello from << insert_into_table >> function !"
}
select_from_table()
{
    echo "Hello from << select_from_table >> function !"
}
delete_from_table()
{
    echo "Hello from << delete_from_table >> function !"
}
updating_table()
{
    echo "Hello from << updating_table >> function !"
}

tables_menu