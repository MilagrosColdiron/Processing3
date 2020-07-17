PImage img;

import processing.pdf.*;


public void setup()
{

  size( 980, 1454);
  background(64, 64, 64);
  
}


public void draw()
{

  String nameFile = "TEST002"; 
 
  img = loadImage( nameFile+ ".png" );
  
  int wI = img.width;
  int hI = img.height;
  
  println( wI + "  " + hI + "  ############################");
 
  
  //##### WARNING : the output of the PDF & TIF & the screen-output can result RADICALY different based on limits in their respective resolution
  //##### Usualy, when the PDF is looking good the TIF will look bad, and visa versa.
  

  int raster = 13;// resolution
  int LINEMODE = 1;// drawing is made out of nothing but lines
  int FILLMODE = 2;// drawing is made out of filled shapes
  int stepline = 4; // stepwise num of iterations to fill a pixel with outlines (the bigger the num, the lesser iterations)
  float lineWeigth_ = 0.1; // thickness of lines
  float embiggen = 1.3; // is the source image too small?, add some to make it fit 

  //......................
  
  image(img, 0, 0, wI*embiggen, hI*embiggen);

  beginRecord(PDF, nameFile + ".pdf");
  
  DrawRaster drawRaster = new DrawRaster();

  drawRaster.computeRasterLoc( raster );

  background(256, 256, 256);

  drawRaster.drawRaster( raster, FILLMODE, stepline, lineWeigth_  );

  endRecord();





  save("raster_001.jpg");

  noLoop();
}
