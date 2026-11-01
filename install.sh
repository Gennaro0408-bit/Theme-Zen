#!/bin/zsh
# Zen Chai — installa il tema nel profilo Zen in uso.
#
#   ./install.sh            installa (link simbolici: modifichi qui, riavvii Zen)
#   ./install.sh --remove   rimuove il tema

set -e

THEME_DIR="${0:A:h}"
ZEN_DIR="$HOME/Library/Application Support/zen"

# Profilo usato più di recente (quello con prefs.js più nuovo)
latest=( "$ZEN_DIR"/Profiles/*/prefs.js(Nom[1]) )
if (( ! ${#latest} )); then
  echo "Nessun profilo Zen trovato in $ZEN_DIR" >&2
  exit 1
fi
PROFILE="${latest[1]:h}"

CHROME="$PROFILE/chrome"
USERJS="$PROFILE/user.js"
PREF='user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);'

if [[ "$1" == "--remove" ]]; then
  for f in userChrome.css userContent.css; do
    [[ -L "$CHROME/$f" ]] && rm "$CHROME/$f" && echo "Rimosso $f"
  done
  echo "Tema rimosso. Riavvia Zen."
  exit 0
fi

mkdir -p "$CHROME"
for f in userChrome.css userContent.css; do
  if [[ -e "$CHROME/$f" && ! -L "$CHROME/$f" ]]; then
    mv "$CHROME/$f" "$CHROME/$f.backup-$(date +%Y%m%d%H%M%S)"
    echo "Salvato il vecchio $f come backup"
  fi
  ln -sf "$THEME_DIR/$f" "$CHROME/$f"
done

if ! grep -qF "$PREF" "$USERJS" 2>/dev/null; then
  echo "$PREF" >> "$USERJS"
fi

echo "Zen Chai installato in: $PROFILE"
echo "Chiudi Zen del tutto (Cmd+Q) e riaprilo."
