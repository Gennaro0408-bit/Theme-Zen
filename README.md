# Zen Chai ☕

Un tema caldo e calmo per Zen Browser nei toni **panna, arancio e marrone chiaro**,
sempre chiaro anche quando macOS è in modalità scura. Pensato per affaticare poco gli occhi:
nessun bianco puro, nessun nero puro, contrasti morbidi ma leggibili
(testo principale oltre 7,9:1, testo secondario oltre 4,5:1).

## Cosa cambia

- Sfondo della finestra in un gradiente crema leggerissimo con una grana "carta"
- Scheda attiva su carta chiara con ombra morbida; le altre schede in tono attenuato
- Barra degli indirizzi e risultati con evidenziazione ambra tenue (niente blocchi colorati)
- Menu, pannelli, tooltip e toast negli stessi toni
- Niente più lampo bianco mentre le pagine caricano
- Nuova scheda, about:blank e impostazioni coordinate
- Sui siti web cambia solo il colore della selezione e delle barre di scorrimento

## Installazione

Su macOS:

```sh
git clone https://github.com/<utente>/zen-chai.git
cd zen-chai
./install.sh
```

Poi chiudi Zen del tutto (Cmd+Q) e riaprilo.

L'installer crea dei link simbolici verso questa cartella: non spostarla né
cancellarla, altrimenti Zen non trova più il tema. Modificando i file qui
basta riavviare Zen per vedere i cambiamenti. Abilita anche
`toolkit.legacyUserProfileCustomizations.stylesheets`, necessario per caricare i CSS.

Per rimuoverlo: `./install.sh --remove`, poi riavvia Zen.

## Personalizzare

Tutti i colori sono le variabili `--chai-*` in cima a `userChrome.css`. Ad esempio:

- `--chai-accent`: il colore d'accento (prova `#C98A5B` per un caramello più tenue)
- `--chai-grain`: intensità della grana carta, `0` per toglierla
- `--zen-border-radius`: arrotondamento degli angoli

Le variabili di `userContent.css` vanno aggiornate a mano se cambi la palette.

Il tema sostituisce i gradienti scelti per gli spazi: per riaverli, elimina le
righe sotto "Sfondo finestra" in `userChrome.css`.

## Licenza

MIT, vedi [LICENSE](LICENSE). Puoi usarlo, modificarlo e ridistribuirlo liberamente.
