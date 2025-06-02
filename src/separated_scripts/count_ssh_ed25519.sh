awk 'BEGIN {count=0;} {if ($3 == "ssh-ed25519") count+=1} END {print count}' ssh-sntrup761x2551.tsv
