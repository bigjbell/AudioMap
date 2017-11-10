
/*************************\
|  ARTG 2260_F2017_03     |
|  Jonathan Bell          |
|  bell.jo@husky.neu.edu  |
|  final_project          |
\*************************/

/////////AUDIOMAP\\\\\\\\\

import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 2048;
int bandCount = 150;
int stivity = 5;
int colorstivity = 10;
float[] spectrum = new float[bands];
VisualizerFactory vFactory = new VisualizerFactory();
IVisualizer v;
public Mods m = new Mods();

void setup() {
  //size(900, 800, P2D);
  fullScreen(P2D);
  background(0);
  colorMode(HSB);
  //frameRate(60);
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  in.start();
  
  fft.input(in);
  
  //This is a placeholder, will be replaced with manual
  //control for choosing a visualizer type
  v = vFactory.makeVisualizer("bars", bandCount);
  println(v);
}

void draw() {
  //background(0);
  //println(frameRate);
  //pushStyle();
  //fill(0, 10);
  //rect(0, 0, width, height);
  //popStyle();
  fft.analyze(spectrum);
  
  v.update(spectrum);
  v.display();
  
  //for(int i = 0; i < bandCount; i++) {
  //  pushStyle();
  //  colorMode(HSB);
  //  noStroke();
  //  fill(i, 255, spectrum[i] * 255 * colorstivity, 50);
  //  //rect( (width / bandCount) * i, height - spectrum[i]*height*stivity, width / bandCount, height - spectrum[i]*height*stivity);
  //  rect( (width / bandCount) * i, 0, width / bandCount, height);
  //  popStyle();
  //}
}

void keyReleased() {
  if (key == 'f') {
    m.modifyIntensity(-1);
  }
  if (key == 'g') {
    m.modifyIntensity(1);
  }
  if (key == 'h') {
    m.modifyMood(-1);
  }
  if (key == 'j') {
    m.modifyMood(1);
  }
}