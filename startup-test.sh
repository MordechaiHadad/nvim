#!/usr/bin/env bash
get_time() {
tail -1 tmp | cut -d ' ' -f 1
}
pf() {
printf '%s : ' "$@"
}
echo "Warmup #1"
nvim -c q
echo "Warmup #2"
nvim -c q
pf "No config"
nvim --clean --startuptime tmp
get_time
pf "With config"
nvim --startuptime tmp
get_time
pf "Opening init.lua"
nvim "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua" --startuptime tmp
get_time
pf "Opening Python file"
nvim tmp.py --startuptime tmp
get_time
pf "Opening C File"
nvim tmp.c --startuptime tmp
get_time
pf "Opening Neorg File"
nvim tmp.norg --startuptime tmp
get_time
rm tmp
pf "Opening C# File"
nvim tmp.cs --startuptime tmp
get_time
rm tmp
pf "Opening Rust File"
nvim tmp.rs --startuptime tmp
get_time
rm tmp
pf "Opening HTML File"
nvim tmp.html --startuptime tmp
get_time
rm tmp
pf "Opening JSON File"
nvim tmp.json --startuptime tmp
get_time
rm tmp
