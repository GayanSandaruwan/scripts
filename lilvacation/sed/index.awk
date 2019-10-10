#!/usr/bin/awk -f 

BEGIN{
	
}
{
	gsub(/\`|\~|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\_|\-|\=|\,|\.|\?|\:|\;|\"|\'|\[|\{|\}|\]|\|/," ");				#replaces all the non alphanumeric with space
	for (i = 1; i <= NF; i++){
		word=tolower($i);
		if(wc[word] != ""){
			wc[word] = wc[word]", "NR;
		}
		else{
			wc[word] = NR;
		}
		word=false;
	} 
};
END {
for (w in wc){
	print(w": "wc[w]) | "sort";
	}
}
