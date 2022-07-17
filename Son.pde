import ddf.minim.*;

Minim minim;
AudioPlayer musique1;
AudioPlayer musique2;
AudioPlayer musique3;
AudioPlayer musique4;


void musique() { //Charge les musiques
  minim = new Minim(this); 
  musique1 = minim.loadFile("musique1.mp3");
  musique2 = minim.loadFile("musique2.mp3");
  musique3 = minim.loadFile("musique3.mp3");
  musique4 = minim.loadFile("musique4.mp3");
}


void stop_musique() {
  musique1.close();
  musique2.close();
  musique3.close();
  musique4.close();
  minim.stop();
  super.stop();
}