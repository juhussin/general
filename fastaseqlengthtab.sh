out=$2
seq=$1

/well/donnelly/julieh/bin/fastaseqlength.sh $seq > temp.length

paste <( grep ">" temp.length) <( grep -v ">" temp.length) > temp_2col.length
sed 's/>//g' temp_2col.length > $out
#awk '$2 > 50000 {print $0}' temp_2col.length > $out

rm temp.length temp_2col.length
