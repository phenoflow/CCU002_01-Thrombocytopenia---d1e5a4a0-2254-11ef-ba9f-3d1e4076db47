# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"D69.3","system":"icd10"},{"code":"D69.4","system":"icd10"},{"code":"D69.5","system":"icd10"},{"code":"D69.6","system":"icd10"},{"code":"19307009","system":"icd10"},{"code":"13172003","system":"icd10"},{"code":"28505005","system":"icd10"},{"code":"78345002","system":"icd10"},{"code":"78129009","system":"icd10"},{"code":"73397007","system":"icd10"},{"code":"154826009","system":"icd10"},{"code":"441322009","system":"icd10"},{"code":"866152006","system":"icd10"},{"code":"33183004","system":"icd10"},{"code":"438476003","system":"icd10"},{"code":"402654005","system":"icd10"},{"code":"87902006","system":"icd10"},{"code":"32273002","system":"icd10"},{"code":"2897005","system":"icd10"},{"code":"267534000","system":"icd10"},{"code":"191322006","system":"icd10"},{"code":"128091003","system":"icd10"},{"code":"302873008","system":"icd10"},{"code":"36070007","system":"icd10"},{"code":"371106008","system":"icd10"},{"code":"D314z","system":"icd10"},{"code":"D313z","system":"icd10"},{"code":"42P8.","system":"icd10"},{"code":"Dyu32","system":"icd10"},{"code":"D3130","system":"icd10"},{"code":"D315.","system":"icd10"},{"code":"D313.","system":"icd10"},{"code":"D314.","system":"icd10"},{"code":"D3141","system":"icd10"},{"code":"D3143","system":"icd10"},{"code":"G7561","system":"icd10"},{"code":"D3133","system":"icd10"},{"code":"42P2.","system":"icd10"},{"code":"D3131","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-thrombocytopenia-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-thrombocytopenia-thrombocytopaenia---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-thrombocytopenia-thrombocytopaenia---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-thrombocytopenia-thrombocytopaenia---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
