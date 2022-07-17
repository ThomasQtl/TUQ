/* Fonction qui permet de faire descendre la pièce */
void descendre() { 
  int blocage = 0; //Si blocage = 0: la pièce n'a pas touché le bas, si blocage = 1: la pièce a touché le bas
  for (int k = 0; k<18; k++) { //Scan de bas vers le haut 
    for (int l = 0; l<11; l++) {
      
      /* Transforme tous les 1 ou 2 de la dernière ligne de façon à bloquer la pièce */
      for (int j = 0; j<11; j++) {
        if (quadrillage[18][j] == 1) {
          quadrillage[18][j] = 9;
          blocage = 1;
        }
        if (quadrillage[18][j] == 2) {
          quadrillage[18][j] = 0; 
        }
      }

      /* Vérifie si il y a un 9 en dessous d'un 1, dans ce cas on arrête la pièce */
      for (int i = 0; i<18; i++) {
        for (int j = 0; j<11; j++) {
          if (quadrillage[18-i][j] == 9 && quadrillage[17-i][j] == 1) {
            blocage = 1;
          }
        }
      }
      
      /* Descendre la pièce dans le cas ou le bloc en dessous d'un 1 n'est pas un 9 */
      if (quadrillage[18-k][l] != 9 && blocage != 2) {                //{0,1,1,0,0,0}        Exemple       {0,1,1,0,0,0}        Exemple       {0,0,0,0,0,0}
        if (quadrillage[17-k][l] == 1) {                              //{0,0,1,1,0,0}      ---------->     {0,0,0,0,0,0}      ---------->     {0,1,1,0,0,0}     
          quadrillage[17-k][l] = 0;                                   //{0,0,0,0,0,0}      ---------->     {0,0,1,1,0,0}      ---------->     {0,0,1,1,0,0}
          quadrillage[18-k][l] = 1;                                   //{0,0,0,0,0,0}                      {0,0,0,0,0,0}                      {0,0,0,0,0,0}
        }
        if (quadrillage[17-k][l] == 2) {
          quadrillage[17-k][l] = 0;
          quadrillage[18-k][l] = 2;
        }
      }
    }
  }
  
  /* Transforme tous les 1 de la grille en 9 ainsi que tous les 2 en 0 si la pièce est arrivée en bas */
  if (blocage == 1) {
    for (int i = 0; i<19; i++) {
      for (int j = 0; j<11; j++) {
        if (quadrillage[i][j] == 1) {
          quadrillage[i][j] = 9;
        }
        if (quadrillage[i][j] == 2) {
          quadrillage[i][j] = 0;
        }
      }
    }
    blocage = 0;
    finDuJeu(); //Vérifie s'il y a un 9 sur la 1ère ligne pour signaler la fin du jeu
  }
}




        
        
