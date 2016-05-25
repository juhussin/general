#!/usr/bin/perl -w 
use strict;
use warnings;
use Bio::SeqIO;

my $nameseq;

$nameseq=$ARGV[0];

my $seqio = Bio::SeqIO->new(-file => $nameseq, -format => 'fasta');
while(my $seq = $seqio->next_seq) {
    my $s = $seq->seq;
    $s =~ s/n/N/g;
    my $id  = $seq->display_id; # name (ID)
    my $len = $seq->length; # length
    my %count;
    $count{$_}++ foreach split //, $s; # count bases
    $count{"N"} = 0 if !exists($count{"N"}); # create N = 0 if no N in sequence
    my $ratio = $count{"N"} / ($len - $count{"N"}); # ratio of N to not N
    my @output = ($id, $len, $count{"N"}, $ratio);
    print join(",", @output), "\n";
}
