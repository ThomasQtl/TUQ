//Gestion des touches
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {  //Si on appuie sur la flèche droite (Aller vers la droite)
      int bloque = 0; //Pour vérifier si toute la pièce peut se déplacer
      for (int k = 0; k<18; k++) {
        for (int l = 0; l<10; l++) {
          if (quadrillage[k][9-l] == 1 || quadrillage[k][9-l] == 2) {
            if (quadrillage[k][10-l] == 9) {
              bloque = 1;
            }
          }
        }
      }
      if (bloque == 0) {  
        for (int i = 0; i<18; i++) {
          for (int j = 0; j<10; j++) {
            if (quadrillage[i][10-j] == 0) {
              if (quadrillage[i][9-j] == 1) {
                quadrillage[i][10-j] = 1;
                quadrillage[i][9-j] = 0;
              }
              if (quadrillage[i][9-j] == 2) {
                quadrillage[i][10-j] = 2;
                quadrillage[i][9-j] = 0;
              }
            }
          }
        }
      }
    }
    if (keyCode == LEFT) {   //Si on appuie sur la flèche gauche (Aller vers la gauche)
      int bloque = 0; //Pour vérifier si toute la pièce peut se déplacer
      for (int k = 0; k<18; k++) {
        for (int l = 0; l<10; l++) {
          if (quadrillage[k][l+1] == 1 || quadrillage[k][l+1] == 2) {
            if (quadrillage[k][l] == 9) {
              bloque = 1;
            }
          }
        }
      }
      if (bloque == 0) {
        for (int i = 0; i<18; i++) {
           for (int j = 0; j<10; j++) {
             if (quadrillage[i][j] == 0) {
               if (quadrillage[i][j+1] == 1) {
                 quadrillage[i][j] = 1;
                 quadrillage[i][j+1] = 0;
               }
               if (quadrillage[i][j+1] == 2) {
                 quadrillage[i][j] = 2;
                 quadrillage[i][j+1] = 0;
               }
             }
           }
         }
       }
    }
    if (keyCode == UP) {     //Si on appuie sur la flèche du haut (Pivoter)
    int e = 1;
    int f = 1;
    String rotate = "";
      for (int i = 0; i<18; i++) {
        for (int j = 0; j<11; j++) {
          if (quadrillage[18-i][j] == 1 || quadrillage[18-i][j] == 2) {
            if (e == 1){
              if ("D".equals(pieceEnCours.substring(6,7))) {
                rotate = "Bas";
              }
              if ("B".equals(pieceEnCours.substring(6,7))) {
                rotate = "Gauche";
              }
              if ("G".equals(pieceEnCours.substring(6,7))) {
                rotate = "Haut";
              }
              if ("H".equals(pieceEnCours.substring(6,7))) {
                rotate = "Droite";
              }   
              pieceEnCours = "piece" + pieceEnCours.substring(5,6) + rotate;
              if (i > 3 && j < 7 && i < 16) {
                for (int m = 0; m<4; m++) {
                  for (int n = 0; n<4; n++) {
                    if (quadrillage[18-i-m][j+n] == 9) {
                      f = 0;
                    }
                  }
                }
                if (f == 1) {
                  for (int k = 0; k<4; k++) {
                    for (int l = 0; l<4; l++) {
                      quadrillage[18-i-k][j+l] = pieces.get(pieceEnCours)[k][l]; 
                    }
                  }
                }
              }
              e = 0;
            }
          }
        }
      }
    }
    if (keyCode == DOWN) {   //Si on appuie sur la flèche du bas (Descendre rapidement)
      frameRate(60); //On accélère la vitesse 
    }
  }
}
