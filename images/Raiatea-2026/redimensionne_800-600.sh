#!/bin/bash

for img in *.jpg *.jpeg *.png *.JPG; do
#for img in *.png; do
    # On récupère la taille de l'image
    read w h <<< $(identify -format "%w %h" "$img")

    if (( w > h )); then
        # Paysage -> largeur = 800 px max
        convert "$img" -resize 800x "$img"
    else
        # Portrait -> hauteur = 800 px max
        convert "$img" -resize x800 "$img"
    fi
done
