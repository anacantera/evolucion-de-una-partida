

import processing.video.*;
import processing.serial.*;
Serial serial;  // Create object from Serial class

Capture camara;
boolean bNoLoop = false;

int ancho_camara = 640;
int alto_camara = 480;

float umbral = 0.34;


PFont texto;
int frames = 30 ;


///cambio de tamano de una zona
boolean cambiando=false;
int inicio_x;
int inicio_y;
int fin_x;
int fin_y;

//Objetos
Zonas zona[][];//objetos del tipo Bolita
int zonas_cell = 40;
int zonas_x = 7;
int zonas_y = 7;
int zonas_off_x = (ancho_camara - (zonas_cell*zonas_x))/2;
int zonas_off_y = (alto_camara - (zonas_cell*zonas_y))/2;


// Variables de control de menu
int menu = 0;
int cant_menu = 4;

long m;
long cada_cuanto =  30000;
long ultimo_cambio;

boolean hay_cambios = false;
int cuantos_cambios = 0;
int cuantos_seriales = 0;

//Valiables seriales
int encabezado = 255;
int cierre = 254;

boolean bUseSerial = false;
boolean bLoadEstado = true;
boolean bSaveAllFiles = true;
boolean bUseMouseControl = false;
//---------------------------------------//
//---------------------------------------//
void setup() {
  size(960, 640);
  inicio();
  if(bLoadEstado) load_estado("1");//
}
//---------------------------------------//
//---------------------------------------//
void draw() {
  if (camara.available()) {//si hay imagen nueva
    camara.read();//leo imagen
  }  
  visuales() ;
  
  if(bUseSerial) control_serial();
  
  
  //---------------------------------------//
  // control de tiempo
  m = millis();
  if ( m > ultimo_cambio + cada_cuanto ) {
    ultimo_cambio = m;
    calculo_imagen();
  }

  stroke(255);
  fill(255);
  String texto_t = "T: " + ((ultimo_cambio + cada_cuanto) - m);
  text(texto_t, 10, 510);
  
  texto_t = "Seriales: " + cuantos_seriales;
  text(texto_t, 10, 530);
}