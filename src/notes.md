command to count all files containing 
```
zgrep 'TLS_CECPQ1*' $(find . -name '*.gz') | wc -l
```


```
zgrep -v '#' $(find . -name '*.gz') | wc -l
```


```
zgrep 'sntrup761x2551' $(find . -name '*.gz') | tee ~/ssh-sntrup761x2551.tsv
```


```
awk -v FS='\t' '{print $17}' ssh-sntrup761x2551.tsv
```

```
awk ' BEGIN {count=0;}  { if ($3 == "ssh-ed25519") count+=1} end {print $count}' ssh-sntrup761x2551.tsv
```

```
awk -v FS='\t' '{print $17}' ssh-sntrup761x2551.tsv | sort | uniq -c
```

```
awk -v FS='\t' '{print $3}' ssh-sntrup761x2551.tsv | cut -d'.' -f1,2  | sort | uniq -c | sort -nr |  awk '{ print $2 "," $1}' | tee ssh-as-count.csv

```






Presubmission checklist
- Copy the distribution in table 1 to that data description in the text

- Check for all unhandled references (search for "?" mark)


- check for obviously wrong vocabulary and grammar errors

- Add the digital signature to the image

- Print and double check

- Fill in the implementation of protocols in Table 4

- Make sure acronyms are spelled out in the first time in Major sections.