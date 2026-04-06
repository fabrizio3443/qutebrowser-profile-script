#/bin/bash

profiles=(
	"uni:~/.config/qutebrowser-uni"
	"fdev:~/.config/qutebrowser-fdev"
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
