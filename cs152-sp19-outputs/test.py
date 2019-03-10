import csv

with open('result.csv') as f:
    f_csv = csv.reader(f)
    headers = next(f_csv)
    wants = [' Output width (bits)', ' Access time (ns)', ' Random cycle time (ns)', ' Area (mm2)', ' Data arrary area efficiency %', ' Tag arrary area efficiency %']
    print(wants)
    idx = []
    for s in wants:
        idx.append(headers.index(s))
    area = 0.0
    for row in f_csv:
        row = [row[i] for i in idx]
        print(row)
