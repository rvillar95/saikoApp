import 'package:flutter/material.dart';
import 'package:saikomakki/main.dart';
import 'carta.dart';
class Inicio extends StatelessWidget {
  Inicio();
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
        body: SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Image.asset('lib/img/FONDO.jpg'),
              Container(
                height: alto,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('lib/img/LOGO-ICONOS.png'),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // demo.vistoMensajeApoderado(_mensaje.idMensaje);
                              print("CARTA");
                            
                            },
                            child: Image.asset(
                              'lib/img/BTN_CARTA.png',
                              width: tamano,
                            ),
                          ),
                          Image.asset(
                            'lib/img/BTN_PROMO.png',
                            width: tamano,
                          ),
                          Image.asset(
                            'lib/img/BTN_REDES.png',
                            width: tamano,
                          ),
                        ],
                      ),
                    )

                    //Image.asset('lib/img/BOTONES.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
