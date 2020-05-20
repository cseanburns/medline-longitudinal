# About

Exploratory analysis:

To examine why searches limited by pub dates return different but close results across the five MEDLINE platforms.

Basing this on search s07 in the queries spreadsheet on Google Drive.

Data collection note: According to Proquest, the search returns 184 results. I can only retrieve 183 of them, though. All are selected, and so am unsure what the missing one is and why I can't download it.

Data analysis:

All the files have the PubMed IDs in them -- in some form. I grepped them and redirect output to separate files to see which records are missing in the others.

This Bash line will use the pubmed-id.txt file as the pattern file to search the second file, which in this case is the ebscohost-id.txt file. Using the ``-v`` option means it will return anything not in the first file that's in the second file. Example below. Grep is awesome.

```
grep -v -f pubmid-id.txt ebsco-id.txt
```
