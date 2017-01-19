#!/bin/bash
if ping -c2 150.10.10.31
then
        if ps -a | grep -s telnet
        then
        echo "responde y telnet conectado, salimos del script"
        exit
fi
fi

if ping -c2 150.10.10.31
        then
        echo "responde al ping, conetamos el  telnet"
        exec telnet 150.10.10.31 1433 > /home/mariocampos/Downloads/`date +%d-%m-%y_%H:%M`.txt
        exit
fi
echo "no responde el ping, matamos el telnet y salimos"
killall telnet

if ping -c2 192.1.1.15 
then
        if ps -a | grep -s telnet
        then
        echo "responde y telnet conectado, salimos del script"
        exit
fi
fi

if ping -c2 192.1.1.15 
        then
        echo "responde al ping, conetamos el  telnet"
        exec telnet 150.10.10.31 1521 > /home/mariocampos/Downloads/`date +%d-%m-%y_%H:%M`.txt
        exit
fi
echo "no responde el ping, matamos el telnet y salimos"
killall telnet
if ping -c2 10.40.100.2
then
        if ps -a | grep -s telnet
        then
        echo "responde y telnet conectado, salimos del script"
        exit
fi
fi

if ping -c2 10.40.100.21
        then
        echo "responde al ping, conetamos el  telnet"
        exec telnet 10.40.100.21 1433 > /home/mariocampos/Downloads/`date +%d-%m-%y_%H:%M`.txt
        exit
fi
echo "no responde el ping, matamos el telnet y salimos"
killall telnet

if ping -c2 192.168.220.20
then
        if ps -a | grep -s telnet
        then
        echo "responde y telnet conectado, salimos del script"
        exit
fi
fi

if ping -c2 192.168.220.20
        then
        echo "responde al ping, conetamos el  telnet"
        exec telnet 192.168.220 1521 > /home/mariocampos/Downloads/`date +%d-%m-%y_%H:%M`.txt
        exit
fi
echo "no responde el ping, matamos el telnet y salimos"
killall telnet







exit



