awk -v FS='\t' '{print $3}' ssh-sntrup761x2551.tsv | cut -d'.' -f1,2 | sort | uniq -c | sort -nr | awk '{ print $2 "," $1}' | tee ssh-as-count.csv
