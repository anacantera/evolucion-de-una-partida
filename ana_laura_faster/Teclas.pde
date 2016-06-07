

void keyPressed() {
  if (key=='0') {  
    save_estado("1");
  }
  if (key=='1') {  
    load_estado("1");
  }
  if (key=='m') {
    umbral += 0.01;
    umbral = constrain(umbral, 0, 1);
    println("Umbral: " + umbral);
  }
  if (key=='n') {
    umbral-= 0.01;
    umbral = constrain(umbral, 0, 1);
    println("Umbral: " + umbral);
  }
  if (key=='a') {  
    //analisis de la imagen en pantalla
    calculo_imagen_inicial();
  }

  if (key=='l') {  
    //analisis de la imagen en pantalla
    calculo_imagen();
  }

}