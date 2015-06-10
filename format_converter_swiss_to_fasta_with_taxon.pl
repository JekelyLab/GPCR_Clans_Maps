 #!/bin/perl -w
 
 
     use Bio::SeqIO;
use strict;
  # get command-line arguments, or die with a usage statement
  
  my $usage = "format_converter.pl infile\n";
  my $infile = shift or die $usage;
 
open (OUTFILE, ">$infile"."_with_taxon.fa") or die "Cannot open file!\n";
  
    # create one SeqIO object to read in,and another to write out
	
	
    my $seq_in = Bio::SeqIO->new('-file' => "<$infile",
                                      '-format' => 'swiss'); #if downloaded from EBI, use swiss as informat (.dat files)
									  
#	my $seq_out = Bio::SeqIO->new('-file' => "$infile"."_with_taxon.fa",
#								'-format' => 'fasta');
								
								
	 # write each entry in the input file to the output file				

	while (my $inseq = $seq_in->next_seq) {
	print OUTFILE ">", $inseq->id, " ", $inseq->desc, $inseq->species->classification,"\n", $inseq->seq,"\n";
	
	#	$seq_out->write_seq($inseq) unless $inseq->length==0;
	
	}
	
	exit;
