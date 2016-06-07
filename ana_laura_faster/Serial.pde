void control_serial(){
  for ( int i = 0; i < zonas_x; i++ ) {
    for ( int j = 0; j < zonas_y; j++ ) {
     if( zona[i][j].si_cambio  == true)
     { 
       //enontro uno para enviar
       println("Envio: " + i + " : " + j + " : " + zona[i][j].cuanto_cambio);
       serial.write(encabezado);
       serial.write(i);
       serial.write(j);
       serial.write(zona[i][j].cuanto_cambio);
       serial.write(cierre);
       cuantos_seriales--;
       zona[i][j].si_cambio  = false;
       i = zonas_x;
       j = zonas_y;
     }
    }
  }
}
