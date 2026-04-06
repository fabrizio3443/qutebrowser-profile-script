#/bin/bash

profiles=(
	"work:~/.config/qutebrowser-work" # example
	"uni:~/.config/qutebrowser-university" #example
)

echo "select a qutebrowser profile:"
select entry in "${profiles[@]}"; do
	name="${entry%%:*}"
	dir="${entry##*:}"

	echo "Launching $name..."
	qutebrowser --basedir "$dir" >/dev/null 2>&1 &
	disown
	break
done
