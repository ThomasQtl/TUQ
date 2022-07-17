JSONArray pseudosAvecScores = new JSONArray();
String[] pseudos = {};
int[] top_score = {};

   
JSONArray json;
/* Fonction qui charge les pseudos avec les scores dans 2 listes */
void loadScore() {
  json = loadJSONArray("pseudosAvecScores.json");
  for (int i = 0; i < json.size(); i++) {
    JSONObject e = json.getJSONObject(i);
    String pseudo = e.getString("pseudo");
    int top_score2 = e.getInt("top_score");
    pseudos = append(pseudos, pseudo);
    top_score = append(top_score, top_score2);
  }
}


int sauvegardeEnCours = 1;
/* Fonction qui sauvegarde les pseudos avec les scores */
void saveScore() {
  if (sauvegardeEnCours == 1) {
    if (joueurDejaExistant == false) {
      pseudos = append(pseudos, nomJoueur);
      top_score = append(top_score, topScore);
    } else {
      for (int i = 0; i<pseudos.length; i++) {
        if (nomJoueur.equals(pseudos[i])) {
          top_score[i] = topScore;
        }
      }
    }
    for (int i = 0; i < pseudos.length; i++) {
      JSONObject p = new JSONObject();
      p.setString("pseudo", pseudos[i]);
      p.setInt("top_score", top_score[i]);
      pseudosAvecScores.setJSONObject(i, p);
    }
    saveJSONArray(pseudosAvecScores, "pseudosAvecScores.json");
    sauvegardeEnCours=0;
  }
}


/* Fonction qui vérifie si le pseudo de l'utilisateur est déjà dans le fichier pseudosAvecScores.json */
void verifSiPseudoConnu() {
  for (int i = 0; i<pseudos.length; i++) {
    if (nomJoueur.equals(pseudos[i])) {
      joueurDejaExistant = true;
      topScore = top_score[i];
    } 
  }
}
