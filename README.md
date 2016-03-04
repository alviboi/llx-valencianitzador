# llx-valencianitzador
Valencianitzador de .pos
És una shel script que demana arxiu .po en català i el transforma a la variant valenciana (ca@valencia). Utilitza l'script de SoftCatala src2valencia.sed que el podeu trobar a: 
https://github.com/Softcatala/adaptadorvariants
El resultat, s'espera que deixe en fuzzy els canvis per a que el traductor decidisca amb el virtal (o amb poedit, o amb qualsevol altra eina de traducció)  si vol conservar els canvis.
## Ús
per tal d'usar-lo tant src2valencia.sed i valencianitzador.sh han de tindre permisos d'execució, obrirem el valencianitzador.sh amb doble click i ens demanarà quin arxiu volem traduïr i on volem guardar la valencianització. El resultat serà un arxiu .po valencianitzat
