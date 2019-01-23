#ctodo - a comfy and very simple todo application.

flag="${1}"
case ${flag} in
	-h)
		echo "Help... Work in Progress.."
		;;
	-a) ADD="${2}"
		lines=$(wc -l < ~/todo)
		lines=$((lines+1))
		echo $lines
		echo "$lines ${2}" >> ~/todo
		;;
	-c) DONE="${2}"
		sed -i "${2}d" ~/todo 
		;;
	-v) 
		cat ~/todo
		;;
	*)
		echo "not recognized.."
		;;
esac

