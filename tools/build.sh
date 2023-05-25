#!/usr/bin/env bash

#####################################################################
#*******************************************************************#
#* A simple script to:                                             *#
#* - fetch the latest Base16 Schemes from the central repository   *#
#*   - https://github.com/tinted-theming/base16-schemes            *#
#* - convert the `yaml` to `lua`                                   *#
#* - generate a list of all the builtin colorschemes               *#
#* - run `stylua` on the generated lua files                       *#
#*                                                                 *#
#* Requirements:                                                   *#
#* - stylua                                                        *#
#* - bash                                                          *#
#* - git                                                           *#
#* - fd                                                            *#
#*******************************************************************#
# ###################################################################

tools_dir="$(dirname "$0")"
schemes_source="https://github.com/base16-project/base16-schemes"
schemes_dir="$tools_dir/base16-schemes"
colors_dir="$(dirname tools_dir)/colors"
theme_list="$colors_dir/README.md"

prepare() {
	if [ ! -d "$colors_dir" ]; then
		echo "Creating colors directory..."
		mkdir -p "$colors_dir"
	fi
	if [ ! -f "$theme_list" ]; then
		echo "Creating themes list..."
		printf " # base16 colorschemes\n---\n" >"$theme_list"
	fi
}

get_schemes() {
	if [ ! -d "$schemes_dir/base16-schemes/" ]; then
		echo "Cloning base16-schemes..."
		git clone -q --depth=1 "$schemes_source" "$schemes_dir" &
	else
		echo "Pulling latest changes..."
		git \
			--git-dir="$schemes_dir" \
			--work-tree="$schemes_dir" \
			pull -q &
	fi
	wait
	echo "Done"
}

purge_colors() {
	rm -rf "$colors_dir/*.lua"
	sed -ne 's/^- base16-//p' "$theme_list"
}

update_list() {
	color="$1"
	echo "- base16-$color" >>"$theme_list"
}

generate_lua() {
	scheme="$1"
	echo 'require("base16").setup({'
	for color in base0{0..9} base0{A..F}; do
		value=$(sed -ne 's/'"$color"': "\(.*\)".*/\1/p' "$scheme")
		printf '\t%s = "%s",\n' "$color" "#$value"
	done
	echo "})"
}

loop() {
	echo "Updating lua themes..."
	mkdir -p "$colors_dir"
	schemas="$(fd --glob '*.y*ml' --no-ignore | sort)"
	for scheme in $schemas; do
		fbname=$(basename "$scheme" | cut -d. -f1)
		generate_lua "$scheme" >"$colors_dir/base16-$fbname.lua" &
		update_list "$fbname"
	done
	wait
	echo "Done!"
}

cleanup() {
	echo "Cleaning up..."
	rm -rf "$schemes_dir"
}

run() {
	prepare
	purge_colors
	get_schemes
	loop
	stylua .
	cleanup
}

run
