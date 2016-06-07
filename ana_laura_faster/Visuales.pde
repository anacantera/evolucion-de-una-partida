
void visuales() {
  //salidas visuales
 background(0);
  //String texto_area = " Menu: q - w: Visuales : Camara: ";
  //text(texto_area, 330, 15);
  image(camara, 0, 0, ancho_camara, alto_camara);//muestro imagen;
  
  for ( int i = 0; i < zonas_x; i++ ) {
    for ( int j = 0; j < zonas_y; j++ ) {
      zona[i][j].dibuja();
    }
  }
  
}