/* Quadrillage */
int[][] quadrillage = new int[19][11]; //Quadrillage (0 = éteint) (1 = allumé)


/* Pièces */
HashMap<String, int[][]> pieces = new HashMap<String, int[][]>(); //Création d'un dictionnaire sous la forme: piece = {"pieceO": [[0,1,1,0][0,1,1,0][0,0,0,0][0,0,0,0]], "pieceL": [[][][][]],...}

/* Choix d'une pièce au hasard */
String pieceEnCours; 
String pieceSuivante;


/* Liste des différentes pièces */
int[][] pieceOHaut = {{1,1,0,0},
                      {1,1,0,0},
                      {0,0,0,0},
                      {0,0,0,0}};
                
int[][] pieceLHaut = {{0,1,2,0},
                      {0,1,2,0},
                      {0,1,1,0},
                      {0,0,0,0}};
            
int[][] pieceJHaut = {{0,2,1,0},
                      {0,2,1,0},
                      {0,1,1,0},
                      {0,0,0,0}};

int[][] pieceTHaut = {{1,1,1,0},
                      {2,1,2,0},
                      {0,0,0,0},
                      {0,0,0,0}};
              
int[][] pieceSHaut = {{2,1,1,0},
                      {1,1,2,0},
                      {0,0,0,0},
                      {0,0,0,0}};

int[][] pieceZHaut = {{1,1,2,0},
                      {2,1,1,0},
                      {0,0,0,0},
                      {0,0,0,0}};
                   
int[][] pieceIHaut = {{0,1,0,0},
                      {0,1,0,0},
                      {0,1,0,0},
                      {0,1,0,0}};
                  

               