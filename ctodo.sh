#ctodo - a comfy and very simple todo application.
update()
{
		awk -i inplace '{$1 = FNR} 1' ~/todo
}
flag="${1}"
case ${flag} in
	-h)
		echo "Help... Work in Progress.."
		;;
	-a) ADD="${2}"
		update
		lines=$(wc -l < ~/todo)
		lines=$((lines+1))
		echo $lines
		echo "$lines ${2}" >> ~/todo
		;;
	-c) DONE="${2}"
		sed -i "${2}d" ~/todo >> ~/todo
		update
		;;
	-v) 
		update
		cat ~/todo
		;;
	-u)
		update
		;;
	*)
		echo "Flag not recognized. Use -h for help."
		;;
esac


