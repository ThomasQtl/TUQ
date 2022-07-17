void setup() {
  size(700,800);
  remplissageDictionnairePieces(); //Remplissage du dictionnaire "pieces"
  chargerImages(); //Charge toutes les images
  musique(); //Charge les musiques
  loadScore(); //Charge les pseudos avec les scores dans 2 listes
}


void draw() {
  background(255);
  fill(255); //Blanc
  while (initialisation) {
    initialisation(); //Initialisation des élèments de base (une seule fois)  
    initialisation = false;
  }
  
  if (accueil == 1) {
    affichageAccueil(); //Affiche l'écran d'accueil avec le choix du niveau
  }
  
  if (pseudo == 1) {
    affichageDuPseudo(); //Affiche l'écran de choix du pseudo
  }
  
  if (musique == 1) {
    affichageMusique(); //Affiche l'écran de choix des musiques
  }
  
  if (jeu == 1) {
    vitesse(); //Calcul la vitesse du frameRate()
    toucher(); //Vérifie si la pièce en cours a touché le bas
    allumer(); //Vérifie si les cases sont allumées ou non
    pieceSuivante(); //Affiche la pièce suivant dans le cadre
    ligneComplete(); //Vérifie si une ligne est entièrement complétée 
    scoreboard(); //Affiche le tableau des scores
  } 
  
  if (finDuJeu == 1) {
    affichageDeFin(); //Affiche l'écran de fin
    saveScore(); //Sauvegarde les pseudos avec les scores 
  }
  
  if (credits == 1) {
    affichageDesCredits(); //Affiche les crédits (Titre, auteur, licence des musiques)
  }
}


void stop() {
  stop_musique(); 
}