Test --placeGapConsistently using a previously failed test case.
This test case is special because the SDP alignment and refined 
alignment are different in qPos and qAlignedSeqPos. It is used
to test if MakeQueryForward() has reset all positions correctly.

Set up
  $ . $TESTDIR/setup.sh

  $ Q=$DATDIR/test-pgc/pgc-query-1.fasta 
  $ T=$DATDIR/test-pgc/hxb2.fasta

Test m4 output
  $ O=$OUTDIR/pgc-1.m4
  $ $EXEC $Q $T -m 4 --out $O --bestn 1 --placeGapConsistently && echo $?
  [INFO]* (glob)
  [INFO]* (glob)
  0
  $ cat $O
  m54013_160805_234612/6160938/0_3197/0_3197 B.FR.1983.HXB2-LAI-IIIB-BRU.K03455 -11436 86.0179 0 0 3196 3197 1 4597 7700 9719 254

Test m5 output
  $ O=$OUTDIR/pgc-1.m5
  $ $EXEC $Q $T -m 5 --out $O --bestn 1 --placeGapConsistently && echo $?
  [INFO]* (glob)
  [INFO]* (glob)
  0
  $ cat $O
  m54013_160805_234612/6160938/0_3197/0_3197 3197 0 3196 +  B.FR.1983.HXB2-LAI-IIIB-BRU.K03455 9719 2019 5122 - -11436 2793 259 144 51 254 GGTGTTTTACTAA-CTGTTCCATGTTCTAATCTTCATCCTGTCTACCTGCCACACAATCAGCACCTGCCATCTGTTTTCCATAATCCCTAATAATTTTTGCTTTCCTCCTTGGTACTAACCTT-ATGTCACTATTATCTTGTATTACTACTGCCCCTTCACCTTTCCAGAGTAG-TTTGGCTGGTCCTTTCCAAA-TAGGGTCTCTGCTGTCTCTGTAATAAACCCGAAAATTTTGAATTTTTAAAATTTGGTTTTGTAGTTCTTTAGTCTGTATGTCTGATGCTAGTTATATCTATTATTCTTTCCCCTGCACTGTACCCCCCAATCCCCC-TCTTCTTTTAAAAATTGTGAATGAATACTGCCATTTGTACTTGCTGTCTTAAGGTGCTCAGCTTGTTCTCTTACCTGCCCTATGATTTTCTTTAATTCTTTATTCATAGATTCTACTACTCCTTGACTTTGGGGATTGTAGGGAATTCCAAATTCCTG-TTGAATACCTGCCCACCAACAGGCTGCTTTAAC--T-GCA--G-T-AACT-G--G---T-G--A--A-GTTACTGGCCATTAGCTGTATGTATTACCCTGGACTGGGCCATCTTCCTGCTAATTTTAGTAGAAAGTATGCTGTTTCTTGTCCGGTTTTCTGCTGGAATAACCCTCTGCCTCTATTGTAGCCACTGGCTACATGGACTGCTACCAGGATGATTTTTCCTTCTAAGTGTGTACAATCTAATTGCCATATCCCTGGACTACAATCTACTTGTCCATGTATGGCTTCCCCCTTTTAGCTGGACATTTATCACAGCAAAGCTACTATTTCCTTTGCTACTACGGGTGGGATAATTAAATTCATTAGCCATTGCTCTCCAATTGCTGTGATATTTTTCATGCTCTTCTTGAGCCTTAATCTATTCCATCTAGAAACAGCACTT-CCTGATTCCA-CTACTTACTAATTTATCTACGTGTTCATTTCCTCCAATTCCTTTATGTGCTGGTACCCATGACAGGTAGACCCTTTTCCTTGCTTATTAACTGTTCTATTATTTGATTAAACTATCTCTGATTCACTTTTATCTGGTTGTGCTTGAATGATCCCTAATGCATACTGTGAGTCTGTTTACTATGTTTACTTCTGATCCTGAATCCTGTTAAAAGCTAAGCTGGATTGCTTGTAATTCAGTCCTTCTGGTTTGTTTGTTTCAGTTTAGAGA-ACAA-TTTTCTGCCTTCCTCTATCAGTAAACATACCCTGCTTTTCCTA-TTTAGTTTCCCTATTAGCTGCTCCATCTTACATAGAAAGTTTCTACTCCTGCTATTGGGTTCTTTCTCTAGCTGGTACCATAATTTTACTAGGGGAGGGGTATTAACAAAACTCCCATTCAGGAATCCAGGTGGGCTTGCCCAATAGTCTGTCCCACCATGCTTCCCATGTTTC-TTTCTGGAATGGGTAATCTAAATTTAGGAGTCTTTCCCCATATTACTATGCTTTCCAG-GGCTATCTTTTGCACTACCGCTGTTAACTGCTTTACATCATTAGTGTGGGCAGTCCCTCTTTTTTGCATAACTTCCCTGTTTTCAGATTTTTGAATGGTTTCTTGGTAAATTTGATATGTCCAT-GGTCCT-GCCCCTGTTTCTGTATTTCAGCTATTAAGTCTTTTGATGGGTCATAATATACTCCATGTACTGGTTCTTTTAGGAATTTCCCTGTTCTCTGCCAATTCTAATTCTGCTTCTTCAGTTTAGTGTTACTA-TGTCTGTTAGTGCTTTGGCTCCCCTAAGGAGTTTACACAGTTGCCTTACTTTAATCCCTGGGTAAATCTGACTTGCCCAGTTTTAATTTTCCCACTAACTTCTGTATATCATTGACAGTCCAGCTATCCTTTTCTGGCAAGCTGTATGGGCTGTACTGTCCATTGT-TCAGGATG-AGTTCATACCCCATCCAAAGAAATGGAGGTTCTTTCTGATGTTTCTTGTCTGGTGTGGTAAATCCCCACTTTAATAGATGTTCTCTTAAACTCTTCTATTTTTGCTCTATGTTGCCCTATTTCTAAGTCAGATCCTACATTACAAGTCATCCATATATTGATAGATAACTATTTCTGGAGTTTTGTGCTCTAAAGGGCTCTAAGATTTTTGTCCATGCTACTCTGGAATATTGCTGGTGATCCTTTCCATCCCTGTGGAAGCACATTATATTGATATATAATTTCCTGGTGTTTTCATTGTTTTTACTAGGTATGGTGAATGCAGTATATTTTCTGAAACCTTCATCTAAAGGAACTGAGAAATATTGCATCCCCCACATCTAGTACTGTCACTGATTTTTTCTTTTTTAACCCTGCTGGG-TGTGGTATTCCCTAATTGAAACTTCCCAAAAGTCCTTGAGTTTCTTTTATTGAGTTCCCTGAAATCTACTAATTTTCTCCACTTAGTACTGTCCTTCTTT-TTTATGGCAAATACTGGAGTGTTATATGGGTTTTTCAGGCCCAACTTTTGAAATTTTTCCTTCCTTTTCCATTTCT-TCACAAATTGCTGTTAATGCTTTTATCTTTTCTTCTGTCAATGGCCATTGTTTTGACTTTTGGGGCCATCCATTCCTGGCTT-AATTTTACTGGTACAAGTTTCAAT-GGACTAATTGGAAAGTTTTAATGTGCAATCCAAGCTGAGTCAACATG-TTTCTTCCAATTATGTTGACAGGTGTAGGTCCTACTAGTACTGTACCTATAGCCTTTTT-TCCACAAATTTTCTAAGAGTATTTGATCATACTGTTCTTACTTTAATAAAACCTCCAATTCCTCCTATCATTTTTGGTTTTCCATTTTCCTGGCAAAATTTATTTCTTCTAATACTGTATCATCTGCTCCTGTGTTCTAAGAGAGCCTCCTTTAGCTGTCCCCCTATTTTTATTGTAACAAGTGGTCGTTGCCAAAGAGTGATTTGAGGGAAGTTTAAGGCT----TTCCCTGTCTTTCAGCTCCTGCTTCGGAGAAGGTGTTGCT-TCCTCGAACCTGAAGCTCTCTGGTGGTAGTGCTGTTGGGCTCTGGTCTGAGACTCTCTGGTGGGGCTGTTGGTCTCTGGTCTGTTCTGAAGGAAATTCCCTGGCCT-CCCTTGTTGGAAGGCCAAAG-TTCCCTAAAAAATTAGGCCTGTCTCTCAGTACAGTCTTTCATTTTGGTGTCCTTCCTTTCCACATTTCCAACAGCCTTTTTTTCCTAGGAGCCCT |||||||||||||*||*|||||||||||||||*|||||||||||||*|||||||||||||*|||||||||||||||||||||||||||||||*||*||||||||*||*|||||*||||*|*||*|||||||||||||||||||||||||||||||||||||||||||||||*||*||||*|||||||||||||||*|*||*|*|||||||||*||||||||||||||||||||||||||||||**||||||*|||||||*|||||||||*||||||||||*|||||*||||*||||*|||||||||||||||||||||||||||||||||||*|*|||||||||||*|||||*|||||||||||||||||||||*|||||||||||*||*|||||*||*|||||||||||*|||||*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*||||*|*||*||||||||||||||*||**||||**|*|||**|*|*||*|*|**|***|*|**|**|*||*|*||****||***|**|*******|**|||*|****|*||||||||||||||||||**|||||*|||||||||||*||*||*||||*|||||||||||||**|||||*|||||**||*||||||||||||||*||||||||||||||*|*||||||||||||*|||||||||||||*|||||||||*|||||||||||*||||||||||||||*||||||||*||*|||||||||*||||||||||||||***|||||||||||*|||||||||||*|||||*|***|||||*|||*|||||||||||||||||||*|||||||||||*|||||*||*|||||*||||||*|||||||||||||*|||*||*||||*||||||||||*|*|||*||||||||||||||*|||||||||||||||||||||||*||||||||||||||||*|||*||||||*||||||||**||||||||||*||||||||||||||*|*|||*||||||||||||||*|||||||||||||||||||||*|||||||||||*||||||||||||*|||||||||||||||*||||*||||||||**|||*||||*|*|**|||||||||||*||||||*|||||*||||||*||*||||||*||*|**||||*||||*||*||||||||||*|||||*||||*|||||||||||||*||||||*|||||*||||||||*||||||*||||||||*||||||*|||||*||||*||||||||||||||*|||||||||||||||*||||*||||||||||||||||||*||||||*||||||||||||||||*||||||*||||*|||||||*||||||*||||||||||||*|||*||*|*||||*|*|*|||||||||||||||||||||||||||||||||||||**|*||*|||*|||||||||*||*|||||||*||*|||||||||||||||||||||**|||||*||*|||||||**||||*|||||||||||||||*|||||*|*||||*||||||||||||||||||*||*|||*|||||||*|||||||||||*|||||||||||||||||||||||||||||*|||||||||||||||||||||||*|||*||*|||||*|||||||*|||||**|||||||||||*|||*||||*||*||*|*||||||||||||||||*|||*||||||||||||||*|*|||||||||||||||||||||||||||||||||||||||*||**|||||*|||||||||||||||||*|||||||||||||||||*||*||||||||||*||**|||*||||||||||||||||*|*||||||||*||||||||*|||||||||||*|||||||||||||||||||||||*||||||||||||||||*|||||||*|*||*|||||||*|||*|**|||*||||||||||*||||||*||||||||||||||||||||||||||||*||||*||||||||*|||||||||||||||||*||||||*||||||**||||||*||||||||||||||||||*||||||||*||||||||||||||||||||||||||||||||||||||||||||*||*||||||*||||**||||||||*|*||||||||*|||||||||||||*|||||||||||*||*|||||**||||||||||*||||||||*||||||*|||||*||||||||*||||||||*||||||||||||||||||||||||||*|||*|||||||||||*||||||||*|||||||*|||||*|||||||*||*|||||*|||||*|||||||||||||||||||||||*|||||||||||*||*|||*||||||||||||||||||||*||*|||||*||||*|||||||||*||||||||||||*||||||||||||||*|||*|*|||||||*||**||||||||||||*||||||||||||||||||||||||||**|||||||||*|||||||||||||||||*|||||||||||||||*||*|||||*||*|||||*|||||*|||*||*||||||*||||*|||||||||||*|*|||||||||||||||||||||||||||||||||||||*|||||||||||||||*|||*|*||||||*||||*|||*||||||*||||||||||||*||||||||*|||||||||||||||||*|||||||||||||||||*||||*|||||||||||*|**||||||||||||||||||||||||||||||||*|*||||*|||||*||||||||*||*||||||||*||||||||*||*||*|||||||||||||||||||**|||||||||||*||||*|****||||*|||||*||*|||||||||||*|||**||*||||*|*||*||*|*||**|*|**|*|||*****||**||******||||**||||*|**|****||*||**|||||||*||||||||||*|||||||*||||||||||||||*|||||||*|||||||||*|**||||||||||||||||*||||||||||||||||*||||||||||*|||||||||||||||||||||||||||||||*******|*|********| GGTGTTTTACTAAACTTTTCCATGTTCTAATCCTCATCCTGTCTACTTGCCACACAATCATCACCTGCCATCTGTTTTCCATAATCCCTAATGATCTTTGCTTTTCTTCTTGGCACTA-CTTTTATGTCACTATTATCTTGTATTACTACTGCCCCTTCACCTTTCCAGAGGAGCTTTG-CTGGTCCTTTCCAAAGT-GGATTTCTGCTGTCCCTGTAATAAACCCGAAAATTTTGAATTTTTGTAATTTGTTTTTGTAATTCTTTAGTTTGTATGTCTGTTGCTA-TTATGTCTACTATTCTTTCCCCTGCACTGTACCCCCCAATCCCCCCTTTTCTTTTAAAA-TTGTGGATGAATACTGCCATTTGTACT-GCTGTCTTAAGATGTTCAGCCTGATCTCTTACCTGTCCTATAATTTTCTTTAATTCTTTATTCATAGATTCTACTACTCCTTGACTTTGGGGATTGTAGGGAATTCCAAATTCCTGCTTGATTCCC-GCCCACCAACAGGCGGCCCTAACCGTAGCACCGGTGAAATTGCTGCCATTGTCAGTATGT-ATTGTT--TT---T--A-------C--TGG-C----C-ATCTTCCTGCTAATTTTAAAAGAAAATATGCTGTTTCCTGCCCTGTTT-CTGCTGGAATAACT-TCTGCTTCTATA-TATCCACTGGCTACATGAACTGCTACCAGGATAACTTTTCCTTCTAAATGTGTACAATCTAGTTGCCATATTCCTGGACTACAGTCTACTTGTCCATGCATGGCTTCTCC-TTTTAGCTG-ACATTTATCACAGCTG-GCTACTATTTCTTTTGCTACTACAGGTGGCAGG-TTAAAATCACTAGCCATTGCTCTCCAATTACTGTGATATTTCTCATGTTCATCTTGGGCCTTA-TCTATTCCATCTAAAAATAGTACTTTCCTGATTCCAGC-ACTGACTAATTTATCTACTTGTTCATTTCCTCCAATTCCTTTGTGTGCTGGTACCCATGCCAGATAGACC-TTTTCCTTTTTTATTAACTGCTCTATTATTTGATTGA-CTAACTCTGATTCACTTTGATCTGGTTGTGCTTGAATGATTCCTAATGCATATTGTGAGTCTGTT-ACTATGTTTACTTCTAATCCCGAATCCTGC-AAA-GCTA-GATAAATTGCTTGTAACTCAGTC-TTCTGATTTGTT-GTGTCAGTT-AGGGTGACAACTTTT-TGTCTTCCTCTATTAGTAA-CATATCCTGCTTTTCCTAATTTAGTCTCCCTGTTAGCTGCCCCATCT-ACATAGAAGGTTTCTGCTCCTACTAT-GGGTTCTTTCTCTAACTGGTACCATAATTTCACTAAGGGAGGGGTATTAACAAA-CTCCCACTCAGGAATCCAGGTGG-CTTGCC-AATACTCTGTCC-ACCATGTTTCCCATGTTTCCTTT-TGTA-TGGGCAGTTTAAATTTAGGAGTCTTTCCCCATATTACTATGCTTTCT-GTGGTTATTTTTTGCACTGCCTCTGTTAATTGTTTTACATCATTAGTGTGGGCAC-CCCTCATTCTTGCATATTTTCC-TGTTTTCAGATTTTTAAATGGCT-CTTGATAAATTTGATATGTCCATTGG-CCTTGCCCCTGCTTCTGTATTTCTGCTATTAAGTCTTTTGATGGGTCATAATACACTCCATGTACTGGTTCTTTTAG-AATCTCTCTGTTTTCTGCCAGTTCTAGCTCTGCTTCTTCTGTT-AGTGGTATTACT-TCTGTTAGTGCTTTGGTTCCTCTAAGGAGTTTACATAATTGCCTTACTTTAATCCCTGGGTAAATCTGACTTGCCCAATTC-AATTTCCCCACTAACTTCTGTATGTCATTGACAGTCCAGCTGTCTTTTTCTGGCA-GCACTATAGGCTGTACTGTCCATT-TATCAGGATGGAGTTCATAACCCATCCAAAGGAATGGAGGTTCTTTCTGATGTTTTTTGTCTGGTGTGGTAAGTCCCCACCTCAACAGATGTTGTCTCAG-CTCCTCTATTTTTGTTCTATGCTGCCCTATTTCTAAGTCAGATCCTACAT-ACAAATCATCCATGTATTGATAGATAACTATGTCTGGA-TTTTGTTTTCTAAAAGGCTCTAAGATTTTTGTC-ATGCTACTTTGGAATATTGCTGGTGATCCTTTCCATCCCTGTGGAAGCACATTGTACTGATATCTAATC-CCTGGTGTCT-CATTGTTTATACTAGGTATGGTAAATGCAGTATACTTCCTGAAGTCTTCATCTAAGGGAACTGAAAAATAT-GCATCACCCACATCCAGTACTGTTACTGATTTTTTCTTTTTTAACCCTGC-GGGATGTGGTATTCC-TAATTGAA-CTTCCCAGAAGTC-TTGAGTT-CTCTTATTAAGTTCTCTGAAATCTACTAATTTTCTCCATTTAGTACTGTCTTT-TTTCTTTATGGCAAATACTGGAGTATTGTATGGATTTT-CAGGCCCAATTTTTGAAATTTTCCCTTCCTTTTCCATCTCTGT-ACAAATTTCTACTAATGCTTTTATTTTTTCTTCTGTCAATGGCCATTGTTTA-ACTTTTGGG-CCATCCATTCCTGGCTTTAATTTTACTGGTACA-GTCTCAATAGGGCTAATGGGAAAATTTAAA-GTGCAA-CCAATCTGAGTCAACA-GATTTCTTCCAATTATGTTGACAGGTGTAGGTCCTACTAATACTGTACCTATAGC-TTTATGTCCACAGATTT-CTATGAGTATCTGATCATACTGT-CTTACTTTGATAAAACCTCCAATTCCCCCTATCATTTTTGGTTT-CCATCTTCCTGGCAAACTC-ATTTCTTCTAATACTGTATCATCTGCTCCTGTAT-CTAATAGAGCTTCCTTTAGTTGCCCCCCTATCTTTATTGTGACGAGGGGTCGTTGCCAAAGAGTGACCTGAGGGAAGTTAAAGGATACAGTTCCTTGTCTATCGGCTCCTGCTTCTGAGGGGGAGTTGTTGTC-TCTACCCC-A-GA-C-CTGA----AG--CT------CTCT--TCTG-G--T----GG-GG--CTGTTGG-CTCTGGTCTGCTCTGAAGAAAATTCCCTGGCCTTCCCTTGTAGGAAGGCCAGATCTTCCCTAAAAAATTAG-CCTGTCTCTCAGTACAATCTTTCATTT-GGTGTCCTTCCTTTCCACATTTCCAACAGCC-------C-T--------T

Test sam output
  $ O=$OUTDIR/pgc-1.sam
  $ $EXEC $Q $T --sam --out $O --bestn 1 --placeGapConsistently && echo $?
  [INFO]* (glob)
  [INFO]* (glob)
  0
  $ cat $O |grep -v '^@'
  m54013_160805_234612/6160938/0_3197\t16\tB.FR.1983.HXB2-LAI-IIIB-BRU.K03455\t2020\t254\t1S1=8I1=1I1=7I31=1I10=1X16=1I16=1D1X1=1X9=1X7=1D14=1X7=1X10=1I7=2I2=1I2=4I1=2I1=1I4=2I4=6I2=2I2=4I1X3=1I1=1I1X1=1I1=1I1X2=1X1=1X2=1I2=1D1=1X4=1X2=2X3=1X11=1X2=1X5=1X4=4D1=1X4=1X11=2X19=1X2=1X2=1X8=1X8=1X2=1X8=1X5=1X4=1I1=1X32=1I1X1=1X11=1X4=1I17=1X17=1X8=1I12=1X6=1X3=1I4=1X6=1D1=1X3=1I15=1X37=1D1=1I11=1X4=1I6=1I2=1X3=1X5=1X5=1X2=1D5=1X2=1I15=1D17=1I9=1I1X26=1X12=2X2=1X7=1I1=1D3=1X14=1X12=1X9=1I4=1X5=1X2=1X20=1D3=1I2=1X11=1X23=1X5=1X5=1X2=1I7=1I5=1X7=1I8=1I11=1D3=1I26=1X8=1X8=1X5=1I6=1X8=1X10=2X5=1X2=1X11=1X13=1X8=1I1=1X8=1I1X4=1X6=1X2=1X44=1X8=1I18=1X6=2X6=1I6=1X17=1X8=1X4=1I28=1X6=1X10=1X3=1I1X1=1X3=1X7=1X2=1X1=1X7=1X16=1X23=1X11=1X8=1D8=1D1=1I16=1X3=2X2=1I10=1X2=1X17=1X17=1X5=1I1X2=1X39=1X1=1X14=1X3=1X16=1I1=1D2=1X2=1X4=1I3=1X11=2X5=1X7=1X5=1X2=1X3=1I23=1X29=1X11=1X7=1D3=1I2=1D18=1X4=1I1=1X5=1X15=1I4=2X7=1X2=1X5=1I1X21=1X2=1X7=1X2=1X9=1X3=1X2=1D1=1I1X37=1X1=1X1=1X4=1I1=1X2=1I3=1D12=1X6=1I7=1X4=1I6=1I16=1X6=1I18=1X4=1X15=1X14=1I4=1X5=1X6=1X8=1I6=1X8=1X5=1X6=1D13=1X4=1I5=1X10=1X2=1I4=1D4=1D1X1=1X2=1I6=1X2=1I6=1X5=1I6=1X11=2X1=1X1=1I4=1I3=1I1X8=1X4=1X15=1I12=1X11=1X21=1X14=1X3=1I1=1X14=1X10=2X8=1I6=1X3=1X16=1X23=1X14=1X3=1I1=1D10=1D4=1X2=1X3=1X13=1I6=1X5=1X2=1X5=1X11=1X19=1X3=1X5=1I2X1=1X5=1X11=1X11=1I2X14=1I9=1I2=1X8=1X14=1X11=1X9=1X13=1X12=1X1=1X14=1X14=1X2=1I1X5=1X5=1I1X13=1I4=1X2=1X2=1X11=1X5=2X18=1I1=4I1=1I3=2I1=7I1=2I1=3I2=2I2X2=1X1=1I2=1D1=2D1=2D1=1D1=3D1=2D1=1D1=1X2=1D1=1D1=2D3=1D1=2D4=2X2=1X14=1I2=1X1=1X4=1D74=1X5=1X11=1X2=1X5=1X2=1X11=1I21=1X5=1I11=1X1=1D35=1X4=1X4=1I5=1X10=1X9=1X7=1X6=2X30=1X9=1X1=1X2=1I1=1D15=1I4=1D2=1X47=1D2=1X1=1I4=1X5=1X2=1X8=1X2=1X31=1X13=1X13=1X15=1X2=1D13=\t*\t0\t0\tAAGGGCTCCTAGGAAAAAAAGGCTGTTGGAAATGTGGAAAGGAAGGACACCAAAATGAAAGACTGTACTGAGAGACAGGCCTAATTTTTTAGGGAACTTTGGCCTTCCAACAAGGGAGGCCAGGGAATTTCCTTCAGAACAGACCAGAGACCAACAGCCCCACCAGAGAGTCTCAGACCAGAGCCCAACAGCACTACCACCAGAGAGCTTCAGGTTCGAGGAAGCAACACCTTCTCCGAAGCAGGAGCTGAAAGACAGGGAAAGCCTTAAACTTCCCTCAAATCACTCTTTGGCAACGACCACTTGTTACAATAAAAATAGGGGGACAGCTAAAGGAGGCTCTCTTAGAACACAGGAGCAGATGATACAGTATTAGAAGAAATAAATTTTGCCAGGAAAATGGAAAACCAAAAATGATAGGAGGAATTGGAGGTTTTATTAAAGTAAGAACAGTATGATCAAATACTCTTAGAAAATTTGTGGAAAAAAGGCTATAGGTACAGTACTAGTAGGACCTACACCTGTCAACATAATTGGAAGAAACATGTTGACTCAGCTTGGATTGCACATTAAAACTTTCCAATTAGTCCATTGAAACTTGTACCAGTAAAATTAAGCCAGGAATGGATGGCCCCAAAAGTCAAAACAATGGCCATTGACAGAAGAAAAGATAAAAGCATTAACAGCAATTTGTGAAGAAATGGAAAAGGAAGGAAAAATTTCAAAAGTTGGGCCTGAAAAACCCATATAACACTCCAGTATTTGCCATAAAAAAGAAGGACAGTACTAAGTGGAGAAAATTAGTAGATTTCAGGGAACTCAATAAAAGAAACTCAAGGACTTTTGGGAAGTTTCAATTAGGGAATACCACACCCAGCAGGGTTAAAAAAGAAAAAATCAGTGACAGTACTAGATGTGGGGGATGCAATATTTCTCAGTTCCTTTAGATGAAGGTTTCAGAAAATATACTGCATTCACCATACCTAGTAAAAACAATGAAAACACCAGGAAATTATATATCAATATAATGTGCTTCCACAGGGATGGAAAGGATCACCAGCAATATTCCAGAGTAGCATGGACAAAAATCTTAGAGCCCTTTAGAGCACAAAACTCCAGAAATAGTTATCTATCAATATATGGATGACTTGTAATGTAGGATCTGACTTAGAAATAGGGCAACATAGAGCAAAAATAGAAGAGTTTAAGAGAACATCTATTAAAGTGGGGATTTACCACACCAGACAAGAAACATCAGAAAGAACCTCCATTTCTTTGGATGGGGTATGAACTCATCCTGAACAATGGACAGTACAGCCCATACAGCTTGCCAGAAAAGGATAGCTGGACTGTCAATGATATACAGAAGTTAGTGGGAAAATTAAAACTGGGCAAGTCAGATTTACCCAGGGATTAAAGTAAGGCAACTGTGTAAACTCCTTAGGGGAGCCAAAGCACTAACAGACATAGTAACACTAAACTGAAGAAGCAGAATTAGAATTGGCAGAGAACAGGGAAATTCCTAAAAGAACCAGTACATGGAGTATATTATGACCCATCAAAAGACTTAATAGCTGAAATACAGAAACAGGGGCAGGACCATGGACATATCAAATTTACCAAGAAACCATTCAAAAATCTGAAAACAGGGAAGTTATGCAAAAAAGAGGGACTGCCCACACTAATGATGTAAAGCAGTTAACAGCGGTAGTGCAAAAGATAGCCCTGGAAAGCATAGTAATATGGGGAAAGACTCCTAAATTTAGATTACCCATTCCAGAAAGAAACATGGGAAGCATGGTGGGACAGACTATTGGGCAAGCCCACCTGGATTCCTGAATGGGAGTTTTGTTAATACCCCTCCCCTAGTAAAATTATGGTACCAGCTAGAGAAAGAACCCAATAGCAGGAGTAGAAACTTTCTATGTAAGATGGAGCAGCTAATAGGGAAACTAAATAGGAAAAGCAGGGTATGTTTACTGATAGAGGAAGGCAGAAAATTGTTCTCTAAACTGAAACAAACAAACCAGAAGGACTGAATTACAAGCAATCCAGCTTAGCTTTTAACAGGATTCAGGATCAGAAGTAAACATAGTAAACAGACTCACAGTATGCATTAGGGATCATTCAAGCACAACCAGATAAAAGTGAATCAGAGATAGTTTAATCAAATAATAGAACAGTTAATAAGCAAGGAAAAGGGTCTACCTGTCATGGGTACCAGCACATAAAGGAATTGGAGGAAATGAACACGTAGATAAATTAGTAAGTAGTGGAATCAGGAAGTGCTGTTTCTAGATGGAATAGATTAAGGCTCAAGAAGAGCATGAAAAATATCACAGCAATTGGAGAGCAATGGCTAATGAATTTAATTATCCCACCCGTAGTAGCAAAGGAAATAGTAGCTTTGCTGTGATAAATGTCCAGCTAAAAGGGGGAAGCCATACATGGACAAGTAGATTGTAGTCCAGGGATATGGCAATTAGATTGTACACACTTAGAAGGAAAAATCATCCTGGTAGCAGTCCATGTAGCCAGTGGCTACAATAGAGGCAGAGGGTTATTCCAGCAGAAAACCGGACAAGAAACAGCATACTTTCTACTAAAATTAGCAGGAAGATGGCCCAGTCCAGGGTAATACATACAGCTAATGGCCAGTAACTTCACCAGTTACTGCAGTTAAAGCAGCCTGTTGGTGGGCAGGTATTCAACAGGAATTTGGAATTCCCTACAATCCCCAAAGTCAAGGAGTAGTAGAATCTATGAATAAAGAATTAAAGAAAATCATAGGGCAGGTAAGAGAACAAGCTGAGCACCTTAAGACAGCAAGTACAAATGGCAGTATTCATTCACAATTTTTAAAAGAAGAGGGGGATTGGGGGGTACAGTGCAGGGGAAAGAATAATAGATATAACTAGCATCAGACATACAGACTAAAGAACTACAAAACCAAATTTTAAAAATTCAAAATTTTCGGGTTTATTACAGAGACAGCAGAGACCCTATTTGGAAAGGACCAGCCAAACTACTCTGGAAAGGTGAAGGGGCAGTAGTAATACAAGATAATAGTGACATAAGGTTAGTACCAAGGAGGAAAGCAAAAATTATTAGGGATTATGGAAAACAGATGGCAGGTGCTGATTGTGTGGCAGGTAGACAGGATGAAGATTAGAACATGGAACAGTTAGTAAAACACC\t*\tRG:Z:15f3fb27\tnp:i:1\tqe:i:3197\tqs:i:0\tzm:i:0\tAS:i:-11436\tNM:i:454 (esc)
