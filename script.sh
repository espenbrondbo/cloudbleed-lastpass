#!/bin/bash
if [ ! -f "affected-sites.txt" ]
then
	echo "Downloading list of affected sites"
	wget -O affected-sites.txt https://github.com/pirate/sites-using-cloudflare/raw/master/sorted_unique_cf.txt
fi

chmod +x extract-domains.py
python3 extract-domains.py > output

for url in $(cat output); do
	if 
		grep -x "$url" affected-sites.txt >/dev/null; then
		echo "$url is affected";
	fi
done

rm output 
