# Directory to store separated scripts
SCRIPT_DIR="separated_scripts"
mkdir -p "$SCRIPT_DIR"

# 1. Count all files containing 'TLS_CECPQ1*'
cat > "$SCRIPT_DIR/count_tls_cecpq1.sh" <<'EOF'
zgrep 'TLS_CECPQ1*' $(find . -name '*.gz') | wc -l
EOF

# 2. Count all lines not containing '#'
cat > "$SCRIPT_DIR/count_non_comment.sh" <<'EOF'
zgrep -v '#' $(find . -name '*.gz') | wc -l
EOF

# 3. Extract lines containing 'sntrup761x2551' and save to file
cat > "$SCRIPT_DIR/extract_sntrup761x2551.sh" <<'EOF'
zgrep 'sntrup761x2551' $(find . -name '*.gz') | tee ~/ssh-sntrup761x2551.tsv
EOF

# 4. Print 17th column from ssh-sntrup761x2551.tsv
cat > "$SCRIPT_DIR/print_col17.sh" <<'EOF'
awk -v FS='\t' '{print $17}' ssh-sntrup761x2551.tsv
EOF

# 5. Count lines where 3rd column is 'ssh-ed25519'
cat > "$SCRIPT_DIR/count_ssh_ed25519.sh" <<'EOF'
awk 'BEGIN {count=0;} {if ($3 == "ssh-ed25519") count+=1} END {print count}' ssh-sntrup761x2551.tsv
EOF

# 6. Count unique values in 17th column
cat > "$SCRIPT_DIR/count_unique_col17.sh" <<'EOF'
awk -v FS='\t' '{print $17}' ssh-sntrup761x2551.tsv | sort | uniq -c
EOF

# 7. Count and sort unique values in 3rd column (first two dot-separated fields)
cat > "$SCRIPT_DIR/count_unique_col3_prefix.sh" <<'EOF'
awk -v FS='\t' '{print $3}' ssh-sntrup761x2551.tsv | cut -d'.' -f1,2 | sort | uniq -c | sort -nr | awk '{ print $2 "," $1}' | tee ssh-as-count.csv
EOF

