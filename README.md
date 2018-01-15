# llx-valencianitzador
Valencianitzador de .pos
És una shel script que demana arxiu .po en català i el transforma a la variant valenciana (ca@valencia). Utilitza l'script de SoftCatala src2valencia.sed que el podeu trobar a: 
https://github.com/Softcatala/adaptadorvariants
El resultat, s'espera que deixe en fuzzy els canvis per a que el traductor decidisca amb el virtal (o amb poedit, o amb qualsevol altra eina de traducció)  si vol conservar els canvis.
## Ús
per tal d'usar-lo tant src2valencia.sed i valencianitzador.sh han de tindre permisos d'execució, obrirem el valencianitzador.sh amb doble click i ens demanarà quin arxiu volem traduïr i on volem guardar la valencianització. El resultat serà un arxiu .po valencianitzat

## Adaptació d'una carpeta

Per tal de traduir una carpeta completa, amb diversos pos a dintre, disposem de l'script po4all.sh amb la següent sintaxi:

```
po4all.sh carpetaOrigen carpetaDesti
```

Per exemple:

```
./po4all.sh v6.0/ca/ca-libo_help/ v6.0/ca_valencia/ca-libo_help/
```

Cal tindre present que si la carpeta d'origen finalitzem la ruta en "/", també hem d'incloure aquest caràcter a la carpeta de destí, per evitar errors en la nomenclatura de les carpetes.
