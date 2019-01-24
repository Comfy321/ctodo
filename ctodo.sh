#ctodo - a comfy and very simple todo application.
update()
{
		awk -i inplace '{$1 = FNR} 1' ~/todo
}
flag="${1}"
case ${flag} in
	-h)
		echo "USAGE: ctodo {flags}
		-a: Add an item to todo list (ctodo -a \"homework\")
		-c: Complete an item on todo list (ctodo -c 5)
		-v: View the todo list (ctodo -v)
		-s: set a todo file (default: ~/todo) (ctodo -s /foo/bar/todo)
		-ca: complete all items on todo list (ctodo -ca)
		-h: Display this dialog"
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


