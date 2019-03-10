#! /bin/bash
cat L1Dcache.csv > result.csv
tail -n1 L1Icache.csv >> result.csv
tail -n1 L2cache.csv >> result.csv
tail -n1 L1TLB.csv >> result.csv
tail -n1 L2TLB.csv >> result.csv
python3 test.py

