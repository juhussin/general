
namefile=$1
nameseq=$2
start=$3
end=$4
out=$5

formatdb -pF -o T -i $namefile -n temporary.db
fastacmd -d temporary.db -s $nameseq -L $start,$end > $out
rm temporary.db
