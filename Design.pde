PImage tuqLogo;
PImage touche;
PImage pieceTimg;
PImage pieceSimg;
PImage pieceZimg;
PImage pieceOimg;
PImage pieceIimg;
PImage pieceJimg;
PImage pieceLimg;
PImage licence;


int saveS;
int a = 0;
int b = 1;
/* Fonction qui permet de faire une pause de 1 seconde environ (pour bloquer les clics lors du changement d'affichage) */
void attenteUneSeconde() { 
  int s = second();
  if (b == 1) {
    saveS = s+1;
    b = 0;
  }
  if (saveS > 58) {
    saveS -= 59;
  }
  if (s > saveS) {
    a = 1;
  }
}


/* Fonction qui charge toutes les images */
void chargerImages() {
  tuqLogo = loadImage("tuqLogo.png"); //Logo TUQ
  touche = loadImage("touche.png"); //Petite touche à côté des Validé, Retour...
  licence = loadImage("licence.png");
  
  /* Images des pièces du petit cadre: pièce suivante */
  pieceTimg = loadImage("pieceTimg.png"); // T
  pieceSimg = loadImage("pieceSimg.png"); // S
  pieceZimg = loadImage("pieceZimg.png"); // Z
  pieceOimg = loadImage("pieceOimg.png"); // O
  pieceIimg = loadImage("pieceIimg.png"); // I
  pieceLimg = loadImage("pieceLimg.png"); // L
  pieceJimg = loadImage("pieceJimg.png"); // J
}


/* Fonction qui affiche l'interface d'accueil */
void affichageAccueil() {
  level = 0;
  image(tuqLogo,175,50,350,217);//Le logo de TUQ
  textSize(50);
  fill(0,0,0);
  textAlign(CENTER);
  text("LEVEL:",350,400);
  textSize(40);
  text("FACILE",350,500);
  text("MOYEN",350,575);
  text("DIFFICILE",350,650);
  attenteUneSeconde();
  if (a == 1) { //Delay
    if ((mouseX > 288 && mouseX < 414) && (mouseY > 471 && mouseY < 499)) { //Facile
      image(touche,225,460,50,50);
      if (mousePressed) {
        level = 1;
      }
    }
    if ((mouseX > 284 && mouseX < 417) && (mouseY > 546 && mouseY < 575)) { //Moyen
      image(touche,220,535,50,50);
      if (mousePressed) {
        level = 2;
      }
    }
    if ((mouseX > 264 && mouseX < 437) && (mouseY > 621 && mouseY < 650)) { //Difficile
      image(touche,205,610,50,50);
      if (mousePressed) {
        level = 3;
      }
    }
    if (level != 0) {
      pseudo = 1;
      accueil = 0; 
      nomJoueur = "";
    }
  }
}


/* Fonction qui affiche l'interface sur le choix du pseudo */
void affichageDuPseudo() {
  image(tuqLogo,175,50,350,217);//Le logo de TUQ
  textSize(50);
  fill(0,0,0);
  textAlign(CENTER);
  text("VOTRE PSEUDO:",350,400);
  if (keyPressed) {
    if (key != CODED /*Pour ignorer la pression de touche type majuscule*/ && nomJoueur.length() != 9 /*Pour ne pas sortir du scoreboard*/ && key != BACKSPACE) {
      nomJoueur += key;
      delay(175); //Evite le spam
    }
    if (key == BACKSPACE) { //Retirer un caractère
      if (nomJoueur.length() > 0) { //Au moins une lettre
        nomJoueur = nomJoueur.substring(0,nomJoueur.length()-1);
        delay(200); //Evite le spam
      } 
    }
  }
  text(nomJoueur + "_",350,450);
  textSize(40);
  text("RETOUR",200,700);
  text("VALIDER",500,700);
  attenteUneSeconde();
  if (a == 1) { //Delay
    if ((mouseX > 127 && mouseX < 277) && (mouseY > 673 && mouseY < 699)) { //Retour
      image(touche,65,660,50,50);
      if (mousePressed) {
        pseudo = 0;
        accueil = 1;
        a = 0;
        b = 1;
      }
    }
    if (nomJoueur.length() > 0) {
      if ((mouseX > 419 && mouseX < 581) && (mouseY > 671 && mouseY < 699)) { //Valider
        image(touche,360,660,50,50);
        if (mousePressed) {
          pseudo = 0;
          musique = 1;
          a = 0;
          b = 1;
          verifSiPseudoConnu();
        }
      }
    }
  }
}

int w = 1;
int x = 1;
int y = 1;
int z = 1;
/* Fonction qui affiche l'interface de musique */
void affichageMusique() {
  image(tuqLogo,175,50,350,217);//Le logo de TUQ
  textSize(50);
  fill(0,0,0);
  textAlign(CENTER);
  text("MUSIQUE:",350,400);
  textSize(30);
  text("Journey's Reflection",350,475);
  text("Days Past",350,525);
  text("Canon in D Major",350,575);
  text("Ambient Orchestral Piece",350,625);
  textSize(40);
  text("RETOUR",200,700);
  attenteUneSeconde();
  if (a == 1) { //Delay
    if ((mouseX > 205 && mouseX < 490) && (mouseY > 454 && mouseY < 476)) { //Journey's Reflection
      image(touche,155,445,40,40);
      musique2.pause();
      musique3.pause();
      musique4.pause();
      if (w == 1) {
        musique1.rewind();
        musique1.loop();
        w = 0;
      }
      x = 1;
      y = 1;
      z = 1;
      if (mousePressed) {
        musique = 0;
        jeu = 1;
        a = 0;   
        b = 1;
      }
    }
    if ((mouseX > 284 && mouseX < 419) && (mouseY > 504 && mouseY < 525)) { //Days Past
      image(touche,234,495,40,40);
      musique1.pause();
      musique3.pause();
      musique4.pause();
      if (x == 1) {
        musique2.rewind();
        musique2.loop();
        x = 0;
      }
      w = 1;
      y = 1;
      z = 1;
      if (mousePressed) {
        musique = 0;
        jeu = 1;
        a = 0;   
        b = 1;
      }
    }
    if ((mouseX > 224 && mouseX < 478) && (mouseY > 554 && mouseY < 578)) { //Canon in D Major
      image(touche,175,545,40,40);
      musique1.pause();
      musique2.pause();
      musique4.pause();
      if (y == 1) {
        musique3.rewind();
        musique3.loop();
        y = 0;
      }
      w = 1;
      x = 1;
      z = 1;
      if (mousePressed) {
        musique = 0;
        jeu = 1;
        a = 0;   
        b = 1;
      }
    }
    if ((mouseX > 170 && mouseX < 531) && (mouseY > 606 && mouseY < 626)) { //Ambient Orchestral Piece
      image(touche,120,595,40,40);
      musique1.pause();
      musique2.pause();
      musique3.pause();
      if (z == 1) {
        musique4.rewind();
        musique4.loop();
        z = 0;
      }
      w = 1;
      x = 1;
      y = 1;
      if (mousePressed) {
        musique = 0;
        jeu = 1;
        a = 0;   
        b = 1;
      }
    }
    if ((mouseX > 127 && mouseX < 277) && (mouseY > 673 && mouseY < 699)) { //Retour
      image(touche,65,665,50,50);
      if (mousePressed) {
        musique = 0;
        pseudo = 1;
        nomJoueur = "";
        a = 0;
        b = 1;
      }
    }
  }
}


String nomJoueur = "";
int scoreLigne;
int scoreJoueur = -3;
int topScore;
/* Fonction qui affiche le tableau des scores */
void scoreboard() { 
  image(tuqLogo,20,40,200,124);//Le logo de TUQ
  
  /* Affichage du score */
  textSize(20);
  fill(0,0,0);
  textAlign(LEFT);
  text("JOUEUR: "+ nomJoueur,25,400);
  text("LEVEL: "+ level,25,440);
  text("LIGNE: "+ scoreLigne,25,480);
  text("SCORE: "+ scoreJoueur,25,520);
  text("TOP SCORE: "+ topScore,25,560);
}


/* Fonction qui affiche l'interface de fin */
void affichageDeFin() {
  textSize(50);
  fill(0,0,0);
  textAlign(CENTER);
  text("PERDU !",350,150);
  textSize(30);
  text("JOUEUR: " + nomJoueur,350,300);
  text("LIGNE: " + scoreLigne,350,375);
  text("SCORE: " + scoreJoueur,350,450);
  text("TOP SCORE: " + topScore,350,525);
  textSize(40);
  text("REJOUER",200,700);
  text("QUITTER",500,700);
  attenteUneSeconde();
  if (a == 1) { //Delay
    if ((mouseX > 122 && mouseX < 281) && (mouseY > 673 && mouseY < 699)) { //Rejouer
      image(touche,65,660,50,50);
      if (mousePressed) {
        finDuJeu = 0;
        initialisation = true;
        scoreLigne = 0;
        scoreJoueur = -3;
        jeu = 1;
        a = 0;
      }
    }
    if ((mouseX > 418 && mouseX < 584) && (mouseY > 673 && mouseY < 699)) { //Quitter
      image(touche,360,660,50,50);
      if (mousePressed) {
        finDuJeu = 0;
        credits = 1;
        a = 0;
        b = 1;
      }
    }
  }
}


/* Fonction qui affiche les crédits (Titre, auteur, licence des musiques) */
void affichageDesCredits() {
  image(tuqLogo,175,50,350,217);//Le logo de TUQ
  textSize(50);
  fill(0,0,0);
  textAlign(CENTER);
  text("CREDITS:",350,400);
  textSize(30);
  text("Darren Curtis - Journey's Reflection",350,465);
  text("In Closing - Days Past",350,515);
  text("Kevin MacLeod - Canon in D Major",350,565);
  text("Steven O Brien - Ambient Orchestral Piece",350,615);
  textSize(20);
  text("Musique: https://creativecommons.org/licenses/by/3.0/deed.fr",350,650);
  text("Jeu: https://creativecommons.org/licenses/by-sa/4.0/",350,675);
  textSize(40);
  text("QUITTER",500,730);
  attenteUneSeconde();
  if (a == 1) { //Delay
    if ((mouseX > 418 && mouseX < 584) && (mouseY > 703 && mouseY < 729)) { //Quitter
      image(touche,360,690,50,50);
      if (mousePressed) {
        exit();
      }
    }
  }
  image(licence,75,700);
}
