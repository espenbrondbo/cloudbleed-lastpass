import csv, tldextract

tlds = set()
with open('password.csv') as f:
	reader = csv.DictReader(f)
	for row in reader:
		ext = tldextract.extract(row['url'])
		tlds.add(ext.registered_domain)
for tld in tlds:
	print(tld)
