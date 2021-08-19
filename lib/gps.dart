import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Gps extends StatelessWidget {
  Gps();
  @override
  Widget build(BuildContext context) {
    var alto = MediaQuery.of(context).size.height;
    var ancho = MediaQuery.of(context).size.width;
    print(alto);
    print(ancho);

    var tamano = ancho / 3.1;
    print(tamano);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            launch(
                'https://www.google.cl/maps/place/Saiko+Makki+Sushi/@-35.8444777,-71.6017845,17z/data=!4m5!3m4!1s0x9665f56910f5c7e3:0x72d84f8112480979!8m2!3d-35.8446038!4d-71.6000357');
          },
          child: Container(
            width: ancho,
            height: alto,
            child: Image.asset(
              'lib/img/gps.png',
              width: tamano,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
