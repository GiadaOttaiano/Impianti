#!/bin/bash

# Numero di pianeti da passare come argomento
num_pianeti=10000

# File per tenere traccia del numero di esecuzioni
count_file="C:/Users/ottgi/Downloads/Benchmark/nbody/nbody/benchmark_count.txt"

# Inizializza il contatore se non esiste
if [ ! -f $count_file ]; then
    echo 0 > $count_file
fi

# Leggi il contatore
count=$(cat $count_file)

# Loop per eseguire lo script 40 volte
while [ $count -lt 40 ]; do
    count=$((count + 1))
    echo "Esecuzione $count con -n $num_pianeti"
    ./launch_nbody.sh -r 5 -n $num_pianeti >> benchmark_$num_pianeti.txt
    echo "Risultati salvati in benchmark_$num_pianeti.txt"
    
    # Aggiorna il contatore
    echo $count > $count_file
    
    # Riavvia il sistema
    echo "Riavvio del sistema..."
    reboot
done

# Rimuovi il file del contatore al termine
rm $count_file