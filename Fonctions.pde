/* Remplissage du dictionnaire "pieces" sous la forme: {"pieceO": {{...}{...}{...}{...}}, "pieceL": {{...}{...}{...}{...}}} */
void remplissageDictionnairePieces() { 
  pieces.put("pieceOHaut",pieceOHaut); //Ajoute au dictionnaire *"pieceO": {{...}{...}{...}{...}}*
  pieces.put("pieceLHaut",pieceLHaut); //Ajoute au dictionnaire *"pieceL": {{...}{...}{...}{...}}*
  pieces.put("pieceJHaut",pieceJHaut); //Ajoute au dictionnaire *"pieceJ": {{...}{...}{...}{...}}*
  pieces.put("pieceTHaut",pieceTHaut); //Ajoute au dictionnaire *"pieceT": {{...}{...}{...}{...}}*
  pieces.put("pieceSHaut",pieceSHaut); //Ajoute au dictionnaire *"pieceS": {{...}{...}{...}{...}}*
  pieces.put("pieceZHaut",pieceZHaut); //Ajoute au dictionnaire *"pieceZ": {{...}{...}{...}{...}}*
  pieces.put("pieceIHaut",pieceIHaut); //Ajoute au dictionnaire *"pieceI": {{...}{...}{...}{...}}* 
  pieces.put("pieceODroite",pieceODroite);
  pieces.put("pieceOBas",pieceOBas);
  pieces.put("pieceOGauche",pieceOGauche);
  pieces.put("pieceLDroite",pieceLDroite);
  pieces.put("pieceLBas",pieceLBas);
  pieces.put("pieceLGauche",pieceLGauche);
  pieces.put("pieceJDroite",pieceJDroite);
  pieces.put("pieceJBas",pieceJBas);
  pieces.put("pieceJGauche",pieceJGauche);
  pieces.put("pieceTDroite",pieceTDroite);
  pieces.put("pieceTBas",pieceTBas);
  pieces.put("pieceTGauche",pieceTGauche);
  pieces.put("pieceSDroite",pieceSDroite);
  pieces.put("pieceSBas",pieceSBas);
  pieces.put("pieceSGauche",pieceSGauche);
  pieces.put("pieceZDroite",pieceZDroite);
  pieces.put("pieceZBas",pieceZBas);
  pieces.put("pieceZGauche",pieceZGauche);
  pieces.put("pieceIDroite",pieceIDroite);
  pieces.put("pieceIBas",pieceIBas);
  pieces.put("pieceIGauche",pieceIGauche);
}


/* Fonction qui fait l'initilialisation des élèments de base */
void initialisation() {                        
  for (int i = 0; i<19; i++) { //Création d'une liste de 0 créant le quadrillage. 19x11       {{0,0,0,0,0,0,0,0,0,0,0},
    for (int j = 0; j<11; j++) { //                                                            {0,0,0,0,0,0,0,0,0,0,0},
      quadrillage[i][j] = 0;  //                                                               ..........x15..........,
    }  //                                                                                      {0,0,0,0,0,0,0,0,0,0,0},
  } //                                                                                         {0,0,0,0,0,0,0,0,0,0,0}}
  pieceAleatoire = int(random(7)); //Pièce à venir 
}


/* Fonction qui permet d'afficher une nouvelle pièce */
void afficherUnePiece() { 
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      if (quadrillage[i][j+4] != 9 && quadrillage[i][j+4] != 1 && finDuJeu != 1) { 
        quadrillage[i][j+4] = pieces.get(pieceSuivante)[i][j]; //Affiche dans la partie haute du quadrillage la pièce en cours. Le j+4 est dû à la différence de taille des listes (11x19 et 4x4)
        pieceEnCours = pieceSuivante;
      } 
    }
  }
}


/* Fonction qui vérifie les cases à mettre en vert ou en blanc */
void allumer() { 
  for (int i = 0; i<19; i++) {
    for (int j = 0; j<11; j++) {
      if (quadrillage[i][j] == 1 || quadrillage[i][j] == 9) {
        fill(0,255,0); //Vert
      } else {
        fill(255); //Blanc
      }
      int coordX;
      int coordY;
      coordX = 240+40*j; //240 = position X; haut gauche du quadrillage, 40 = largeur des carreaux
      coordY = 20+40*i;  //20 = position Y; haut gauche du quadrillage, 40 = largeur des carreaux
      rect(coordX,coordY,40,40); //Carreaux de 40x40
    }
  }
}


/* Fonction qui vérifie si la pièce a touché le bas */
void toucher() { 
  int nbDe1 = 0;
  /* On vérifie le nombre de 1 qu'il reste dans la grille */
  for (int i = 0; i<18; i++) {
    for (int j = 0; j<11; j++) {
      if (quadrillage[i][j] == 1) {
        nbDe1 += 1;
      }
    }
  }
  if (nbDe1 != 0 && finDuJeu != 1) { //Si le bloc n'a pas touché le bas
    descendre(); //On descend la pièce
  } else { //Si le bloc a touché le bas (il n'y a plus de 1 dans le quadrillage) alors on fait apparaître une nouvelle pièce
    String[] listesPieces = {"pieceOHaut","pieceLHaut","pieceJHaut","pieceTHaut","pieceSHaut","pieceZHaut","pieceIHaut"}; //Transforme pieceAleatoire entier en chaîne de caractère 
    for (int i = 0; i<7;i++) { //Transforme le nombre aléatoire en nom de la pièce
      if (pieceAleatoire == i) { 
        pieceSuivante = listesPieces[i]; 
      }
    }
    afficherUnePiece(); //Affiche la pièce dans le quadrillage
    pieceAleatoire = int(random(7)); //Pour afficher la prochaine pièce dans le cadre
    scoreJoueur += 3; //Quand une pièce touche le bas, on ajoute 3 au score
  }
}


int vitesse = 4; //Vitesse frameRate()
int level;
int echelonScore = 1;
/* Fonction qui gére la vitesse; plus le score est élevé plus on augmente le frameRate() pour augmenter la vitesse de descente des pièces */
void vitesse() {
  if (scoreJoueur > 50 && scoreJoueur <= 200 && echelonScore == 1) {
    vitesse += 1;
    echelonScore = 2;
  }
  if (scoreJoueur > 200 && scoreJoueur <= 500 && echelonScore == 2) {
    vitesse += 1;
    echelonScore = 3;
  }
  if (scoreJoueur > 500 && scoreJoueur <= 1000 && echelonScore == 3) {
    vitesse += 1;
    echelonScore = 4;
  }
  if (scoreJoueur > 1000 && echelonScore == 4) {
    vitesse += 1;
    echelonScore = 0; //On a atteint la vitesse maximale
  }
  frameRate(vitesse + level);
}


/* Fonction qui permet d'afficher la pièce suivante dans le petit cadre */
void pieceSuivante() {
  fill(255); //Blanc
  rect(20,200,200,150); //Le rectangle d'affichage de la prochaine pièce
  String[] listesPieces = {"pieceOHaut","pieceLHaut","pieceJHaut","pieceTHaut","pieceSHaut","pieceZHaut","pieceIHaut"}; //Transforme pieceAleatoire entier en chaîne de caractère 
  for (int i = 0; i<7;i++) { //Transforme le nombre aléatoire en nom de la pièce
    if (pieceAleatoire == i) { 
      pieceSuivante = listesPieces[i]; 
    }
  }
  if (pieceSuivante == "pieceTHaut") {
    image(pieceTimg,30,215,180,120);
  }
  if (pieceSuivante == "pieceSHaut") {
    image(pieceSimg,30,215,180,120);
  }
  if (pieceSuivante == "pieceZHaut") {
    image(pieceZimg,30,215,180,120);
  }
  if (pieceSuivante == "pieceOHaut") {
    image(pieceOimg,60,215,120,120);
  }
  if (pieceSuivante == "pieceIHaut") {
    image(pieceIimg,103,210,33,130);
  }
  if (pieceSuivante == "pieceLHaut") {
    image(pieceLimg,77,210,86,130);
  }
  if (pieceSuivante == "pieceJHaut") {
    image(pieceJimg,77,210,86,130);
  }
}

    
/* Fonction qui vérifie si une ligne est complétée, si c'est le cas, on ajoute +10 au score et on supprime la ligne */
void ligneComplete() {
  int caseRemplie; //Nombre de 9 qu'il y a sur une ligne
  for (int i = 0; i<19; i++) {
    caseRemplie = 0;
    for (int j = 0; j<11; j++) {
      if (quadrillage[i][j] == 9) {
        caseRemplie += 1;
      }
    }
    if (caseRemplie == 11) { //Si une ligne est remplie
      scoreLigne += 1; //On ajoute 1 au nombre de ligne complétée
      scoreJoueur += 10; //On ajoute 10 au score 
      
      /* On supprime la ligne de 9 en les remplaçants par des 0 */
      for (int k = 0; k<11; k++) {
        quadrillage[i][k] = 0;
      }   
      
      /* Toutes les cases 9 au dessus de la ligne supprimée deviennent des 1 (pour faire la descente des pièces) */
      for (int l = 0; l<i; l++) {
        for (int m = 0; m<11; m++) {
          if (quadrillage[l][m] == 9) {
            quadrillage[l][m] = 1;
          }
        }
      }
      descendre();
    }
  }
}


/* Fonction qui vérifie s'il y a un 9 sur la 1ère ligne pour signaler la fin du jeu */
void finDuJeu() {
  for (int j = 0; j<11; j++) {
    if (quadrillage[0][j] == 9) {
      finDuJeu = 1;
      jeu = 0;
      if (scoreJoueur > topScore) {
        topScore = scoreJoueur;
      }
    }
  }
}
    



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
