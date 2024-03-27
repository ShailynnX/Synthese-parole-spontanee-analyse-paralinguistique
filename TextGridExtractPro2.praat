clearinfo
#/Users/yuyanq/Desktop/M2-1/UE2Parole/
directory$ = "/Users/yuyanq/Desktop/M2-1/UE2Parole/Module3_synthese_de_la_parole/projet/ressources/"
baseName$ = "T11"
wavName$ = baseName$ + ".wav"
textgridName$ = baseName$ + ".TextGrid"

# Chargement des fichiers .wav et .TextGrid
Read from file... 'directory$''wavName$'
Read from file... 'directory$''textgridName$'

# Sélection du TextGrid
selectObject: "TextGrid 'baseName$'"

# Obtention du nombre d'intervalles dans le troisième tier
numberOfIntervals = Get number of intervals: 3

appendInfoLine: "Pho", " Durée(ms) ", "F0 initiale(Hz)  ",  "F0 centrale (Hz)"

# Sélection du Sound correspondant pour extraire la F0 et l'intensité
selectObject: "Sound 'baseName$'"

# Création de l'objet Pitch
To Pitch: 0.0, 75, 600 

# Boucle sur chaque intervalle
for i from 1 to numberOfIntervals
    # Sélection du TextGrid
    selectObject: "TextGrid 'baseName$'"
    
    # Obtention de l'étiquette (label) et des points de temps de l'intervalle
    label$ = Get label of interval: 3, i
    startTime = Get starting point: 3, i
    endTime = Get end point: 3, i

	# Calcul du point milieu
    midPoint = (startTime + endTime) / 2  
    
    # Transformer en Millisecondes pour la durée
    duration = round((endTime - startTime) * 1000)
    
    # Sélection de l'objet Pitch pour obtenir la valeur de F0 au début et au milieu
    selectObject: "Pitch 'baseName$'"
    f0Start = Get value at time: startTime, "Hertz", "Linear"
    f0Mid = Get value at time: midPoint, "Hertz", "Linear"
    
    # Arrondir les valeurs de F0 si elles sont valides

    if f0Mid > 1 
		f0Mid = round(f0Mid) 
	endif
    
    # Affichage des résultats
    if label$ == ""
		appendInfoLine: "_ " ,duration
	else 
		if f0Start > 1 and f0Mid > 1 
			f0Start = round(f0Start)
			f0Mid = round(f0Mid) 
			appendInfoLine: label$, "    ", duration, "     0  ", f0Start, "   50 ", f0Mid
		else
          appendInfoLine: label$, "    ", duration
		endif
    endif
endfor
