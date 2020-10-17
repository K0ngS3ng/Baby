echo 'BABY'
dir=/home/master/Baby/Tool
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

for url in $(cat $1); do
        echo '_____________________________________________'
        echo  "${red} Testing : ${green} ${url} ${reset}"
        echo '---------------------------------------------'
        echo '_________________________________________________________'
        echo  "${red} Performing : ${green} Subdomain Scanning & Resolving ${reset}"
        echo '---------------------------------------------------------'
        $dir/resolver.sh $url;
        echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} URL Extraction for Potential Vulnerabilities ${reset}"
        echo '----------------------------------------------------------------------'		
        $dir/extractor.sh $url;
        echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} Reverse Whois ${reset}"
        echo '----------------------------------------------------------------------'		
        $dir/reverse.sh  $url;
	echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} Nuclei Scan ${reset}"
        echo '----------------------------------------------------------------------'		
        $dir/nuclear.sh $url;
	echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} Heartbleed Scan ${reset}"
        echo '----------------------------------------------------------------------'
        $dir/heartbleed.sh $url;
        echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} Http request smuggling ${reset}"
        echo '----------------------------------------------------------------------'
	$dir/smuggler.sh $url;
	echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} Http request smuggling ${reset}"
        echo '----------------------------------------------------------------------'
	$dir/ffuf.sh $url;
	echo '_____________________________________________'
        echo  "${red} Finished Testing : ${green} ${url} ${reset}"
        echo '---------------------------------------------'

done

