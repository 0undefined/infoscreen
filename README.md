Kantinens infoskærmssystem
==========================

`infoscreen.py` kører i en tmux på infoskærmsmaskinen.

Indhold
-------

Alt indhold der bliver vist ligger i `content`-mappen.

Understøttede filer:

  * `.html`, `.gif`: Vises i en browser
  * `.jpg`, `.png`: Vises i en billedfremviser
  * `.url`: Hjemmesidelinket i filen åbnes i en browser
  * `.sh`: Programmet køres i en grafisk terminal på infoskærmen

Design efter en opløsning på 1920x1080.

Opsætning
---------

Infoskærmsmaskinen (herefter bare kaldet `odroid`) er en Odroid som er
monteret bag skærmen i kantinen.  Man kan logge ind på maskinen via
SSH ved først at forbinde til kantine.diku.dk, og derefter videre til
odroid med bruger `odroid` og løsen `odroid`.

Når maskinen starter op kører den lightdm, som automatisk logger
brugeren `odroid` ind i en session, der kører scriptet `.xinitrc`.
Vi har vedhæftet vores `.xinitrc` i dette repo.

Dette scripts primære ansvar er at starte en `tmux`-session der kører
infoskærmsscriptet, samt starte en enkelt window manager.

Disse dele er pt. ikke i Git, så lad være med at slette dem med mindre
du ved hvordan man erstatter dem.

`odroid` er en rimeligt hurtig maskine, *bortset* fra dens faste
lager, som er verdens mest langso^Wgrundige Micro-SD-kort.  Hvis det
virker som om den hænger, så er det sandsynligvis bare fordi den læser
fra disken.

Et cronjob (`sudo crontab -e`) sørger for at genstarte maskinen hver
morgen klokken 6.  Dette er for at sikre at der aldrig sniger sig
noget ind i opsætningen der ikke kan overleve en genstart.

Sådan gør man manuelt
---------------------

Grundet vor sofistikerede og fremskredne teknologi er det ikke enkelt
at starte infoskærmen.  Her er den nutids-kompatible procedure:

  0) Log ind på odroid-maskinen med odroid-brugeren.

  1) Start en tmux.

  2) Gå ind i `infoscreen`-mappen.

  3) Kør: export DISPLAY=:0

  4) Kør: dbus-launch ./infoscreen.py

  5) Vent til maskinen crasher, gå derefter til 0.
