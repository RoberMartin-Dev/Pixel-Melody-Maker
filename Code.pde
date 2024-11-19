// Ver el archivo LICENSE para más detalles.
// Este código está licenciado bajo los términos de una licencia CC BY-NC-ND 4.0.
// El uso comercial del software está restringido únicamente al autor.
// Copyright © RoberMartin-Dev (Roberto Martin)
// Las bibliotecas Minim y controlP5 utilizadas en este software están licenciadas bajo la LGPL.

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.ugens.*;
import ddf.minim.spi.*;
import controlP5.*;

Minim minim;
AudioOutput out;
AudioRecorder recorder;
Oscil wave;
ControlP5 cp5;
int recordingCount = 0;

int noteIndex = 0;
int[] notes = new int[37]; // Array para 37 tonos
int duration = 30; // Duración inicial en frames
String currentInstrument = "SINE"; // Instrumento actual
float tempo = 1.0; // Tempo inicial
float volume = 0.5; // Volumen inicial
boolean manualMode = false; // Modo manual desactivado por defecto
PImage icon;

void setup() {
  size(1000, 600);
  icon = loadImage("PixelMelodyMaker192x192.png");
  surface.setIcon(icon);
  background(0);
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil(440, volume, Waves.SINE);
  wave.patch(out);
  recorder = minim.createRecorder(out, "musica.wav", true);
  frameRate(30); // 30 frames por segundo
  recorder.beginRecord();
  
  // Inicializar el array de notas
  for (int i = 0; i < 37; i++) {
    notes[i] = 60 + i; // Notas MIDI desde 60 hasta 96
  }
  
  cp5 = new ControlP5(this);
  cp5.addSlider("volume")
     .setPosition(650, 50)
     .setRange(0, 1)
     .setValue(volume);
  
  cp5.addSlider("tempo")
     .setPosition(650, 100)
     .setRange(0, 10)
     .setValue(tempo);
  
  cp5.addButton("SINE")
     .setPosition(650, 150)
     .setSize(80, 30)
     .onClick(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent) {
         wave.setWaveform(Waves.SINE);
         currentInstrument = "SINE";
       }
     });
  
  cp5.addButton("SAW")
     .setPosition(740, 150)
     .setSize(80, 30)
     .onClick(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent) {
         wave.setWaveform(Waves.SAW);
         currentInstrument = "SAW";
       }
     });
  
  cp5.addButton("TRIANGLE")
     .setPosition(650, 200)
     .setSize(80, 30)
     .onClick(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent) {
         wave.setWaveform(Waves.TRIANGLE);
         currentInstrument = "TRIANGLE";
       }
     });
  
  cp5.addButton("SQUARE")
     .setPosition(740, 200)
     .setSize(80, 30)
     .onClick(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent) {
         wave.setWaveform(Waves.SQUARE);
         currentInstrument = "SQUARE";
       }
     });
  
  cp5.addButton("MANUAL")
     .setPosition(650, 450)
     .setSize(210, 30)
     .onClick(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent) {
         manualMode = !manualMode;
       }
     });
}

void draw() {
  background(0);
  fill(255);
  textSize(32);
  text("Generador de melodías", 50, 50);
  textSize(16);
  text("Nota actual: " + notes[noteIndex], 50, 100);
  text("Instrumento actual: " + currentInstrument, 50, 150);
  text("Tempo: " + tempo, 50, 200);
  text("Modo manual: " + (manualMode ? "Activado" : "Desactivado"), 50, 450);
  
  if (!manualMode && frameCount % int(duration / tempo) == 0) {
    // Cambiar la frecuencia de la onda según una nota MIDI aleatoria
    noteIndex = int(random(notes.length));
    wave.setFrequency(midiToFreq(notes[noteIndex]));
    // Generar una nueva duración aleatoria entre 15 y 60 frames
    duration = int(random(15, 60));
  }
}

float midiToFreq(int midiNote) {
  return 440.0 * pow(2, (midiNote - 69) / 12.0);
}

void keyPressed() {
  if (keyCode == LEFT) {
    recorder.endRecord();
    recorder.save();
    println("Grabación guardada como musica_" + recordingCount + ".wav");
    recordingCount++;
    recorder = minim.createRecorder(out, "musica_" + recordingCount + ".wav", true);
    recorder.beginRecord();
  } else if (keyCode == RIGHT) {
    // Cambiar el tipo de onda
    changeInstrument();
  } else if (keyCode == UP) {
    // Aumentar el tempo
    tempo = min(10, tempo + 0.1);
  } else if (keyCode == DOWN) {
    // Reducir el tempo
    tempo = max(0.1, tempo - 0.1); // Asegurarse de que el tempo no sea negativo
  } else if (manualMode) {
    // Generar sonidos manualmente con las teclas del 1 al 0 y de la q a la m
    switch (key) {
      case '1': wave.setFrequency(midiToFreq(notes[0])); break;
      case '2': wave.setFrequency(midiToFreq(notes[1])); break;
      case '3': wave.setFrequency(midiToFreq(notes[2])); break;
      case '4': wave.setFrequency(midiToFreq(notes[3])); break;
      case '5': wave.setFrequency(midiToFreq(notes[4])); break;
      case '6': wave.setFrequency(midiToFreq(notes[5])); break;
      case '7': wave.setFrequency(midiToFreq(notes[6])); break;
      case '8': wave.setFrequency(midiToFreq(notes[7])); break;
      case '9': wave.setFrequency(midiToFreq(notes[8])); break;
      case '0': wave.setFrequency(midiToFreq(notes[9])); break;
      case 'q': wave.setFrequency(midiToFreq(notes[10])); break;
      case 'w': wave.setFrequency(midiToFreq(notes[11])); break;
      case 'e': wave.setFrequency(midiToFreq(notes[12])); break;
      case 'r': wave.setFrequency(midiToFreq(notes[13])); break;
      case 't': wave.setFrequency(midiToFreq(notes[14])); break;
      case 'y': wave.setFrequency(midiToFreq(notes[15])); break;
      case 'u': wave.setFrequency(midiToFreq(notes[16])); break;
      case 'i': wave.setFrequency(midiToFreq(notes[17])); break;
      case 'o': wave.setFrequency(midiToFreq(notes[18])); break;
      case 'p': wave.setFrequency(midiToFreq(notes[19])); break;
      case 'a': wave.setFrequency(midiToFreq(notes[20])); break;
      case 's': wave.setFrequency(midiToFreq(notes[21])); break;
      case 'd': wave.setFrequency(midiToFreq(notes[22])); break;
      case 'f': wave.setFrequency(midiToFreq(notes[23])); break;
      case 'g': wave.setFrequency(midiToFreq(notes[24])); break;
      case 'h': wave.setFrequency(midiToFreq(notes[25])); break;
      case 'j': wave.setFrequency(midiToFreq(notes[26])); break;
      case 'k': wave.setFrequency(midiToFreq(notes[27])); break;
      case 'l': wave.setFrequency(midiToFreq(notes[28])); break;
      case 'z': wave.setFrequency(midiToFreq(notes[29])); break;
      case 'x': wave.setFrequency(midiToFreq(notes[30])); break;
      case 'c': wave.setFrequency(midiToFreq(notes[31])); break;
      case 'v': wave.setFrequency(midiToFreq(notes[32])); break;
      case 'b': wave.setFrequency(midiToFreq(notes[33])); break;
      case 'n': wave.setFrequency(midiToFreq(notes[34])); break;
      case 'm': wave.setFrequency(midiToFreq(notes[35])); break;
    }
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    if (theEvent.getName().equals("volume")) {
      volume = theEvent.getController().getValue();
      wave.setAmplitude(volume);
    } else if (theEvent.getName().equals("tempo")) {
      tempo = theEvent.getController().getValue();
    }
  }
}

void changeInstrument() {
  if (currentInstrument.equals("SINE")) {
    wave.setWaveform(Waves.SAW);
    currentInstrument = "SAW";
  } else if (currentInstrument.equals("SAW")) {
    wave.setWaveform(Waves.TRIANGLE);
    currentInstrument = "TRIANGLE";
  } else if (currentInstrument.equals("TRIANGLE")) {
    wave.setWaveform(Waves.SQUARE);
    currentInstrument = "SQUARE";
  } else {
    wave.setWaveform(Waves.SINE);
    currentInstrument = "SINE";
  }
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}
