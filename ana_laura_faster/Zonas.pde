
///defino la clase
class Zonas 
{
  //atributos
  int x;
  int y;
  int fin_x;
  int fin_y;
  int tam_x;
  int tam_y;
  int id_x;
  int id_y;
  
  
  int r;
  int g;
  int b;
  
  int x_muestra;
  int y_muestra;
  
  boolean si_cambio;
  int cuanto_cambio;
  int umbral = 20;//diferencia minima 

  
  ///inicio
  Zonas(int _x, int _y) {
    id_x = _x;
    id_y = _y;    
    x = id_x * zonas_cell + zonas_off_x;
    y = id_y * zonas_cell + zonas_off_y;
    tam_x = zonas_cell;
    tam_y = zonas_cell;
    fin_x = x + tam_x;
    fin_y = y + tam_y;
    si_cambio = false;
    
     x_muestra = (ancho_camara + 10) + (_x*4);
     y_muestra = 10 + (_y*4);
  }

  void nueva_medida(int _x, int _y, int _ini_x, int _ini_y) {
    x = (id_x * _x)+ _ini_x;
    y = (id_y * _y)+ _ini_y;
    tam_x = _x;
    tam_y = _y;
    fin_x = x + tam_x;
    fin_y = y + tam_y;
    si_cambio = false;

  }
  ////metodos update////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void update (int _r,int _g, int _b) {
    //analisisi de pixeles
    float d = dist(r,g,b,_r,_g,_b);
    if(d > umbral){
      cuanto_cambio = int(d);
      cuantos_cambios ++;
      if(si_cambio == false){cuantos_seriales ++;}
      
      cuanto_cambio = constrain(cuanto_cambio,0,500);
      cuanto_cambio = int(map(cuanto_cambio,0,500,0,10));
      hay_cambios = true;
      si_cambio = true;
      r = _r;
      g = _g;
      b = _b;
    }
    /*
   if(r != _r || g != _g || b != _b){
      //cambio algo
      hay_cambios = true;
      r = _r;
      g = _g;
      b = _b;
   }
   */
  }  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  ////metodos dibuja
  void dibuja () {
    noFill();
    stroke(0, 0, 255);
    rect(x, y, tam_x, tam_y);
    noStroke();
    fill(r,g,b);
    rect(x_muestra, y_muestra,3,3);
    
  }
}