import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:saikomakki/clases/carta.dart';
import 'package:saikomakki/clases/constantes.dart';
import 'package:saikomakki/gps.dart';
import 'package:saikomakki/horario.dart';
import 'package:saikomakki/inicio.dart';
import 'package:saikomakki/galeria.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saikomakki/mensaje.dart';
import 'package:saikomakki/nosotros.dart';
import 'package:saikomakki/promocion.dart';
import 'package:saikomakki/redes.dart';
import 'provider/push_notifications_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/servicio.dart';
import 'carta.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saiko Makki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Saiko Makki'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const fondo = const Color(0xff5e287e);

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int menuSeleccionado = null;

  // void guardaToken() async {
  //  final pushProvider = new PushNotificationsProvider();
  //  var token = await pushProvider.getToken();
  //  print(token);
  // }

  //guardaToken();

  Widget menu = null;
  Widget carta = CartaView();
  void guardarToken() async {
    print("COMENZO");
    Servicio servicio = Servicio();
    String resultado = await servicio.guardarToken();
    print(resultado);
    print("TERMINO");
  }

  @override
  Widget build(BuildContext context) {
    var alto = MediaQuery.of(context).size.height;
    var ancho = MediaQuery.of(context).size.width;
    print(alto);
    print(ancho);

    var tamano = ancho / 3.1;
    print(tamano);
    guardarToken();

    Widget inicio() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              alto <550 ? Positioned(
                left: -10,
                right: -10,
                bottom: -100,
                child: Image.asset('lib/img/FONDO.jpg'))
              :alto < 1400 && alto >780 ? Positioned(
                left: -10,
                right: -10,
                bottom: -200,
                child: Image.asset('lib/img/FONDO.jpg')):
              Positioned(
                left: -10,
                right: -10,
                bottom: -40,
                child: Image.asset('lib/img/FONDO.jpg')),
              Container(
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

                              setState(() {
                                menu = CartaView();
                              });
                            },
                            child: Image.asset(
                              'lib/img/BTN_CARTA.png',
                              width: tamano,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // demo.vistoMensajeApoderado(_mensaje.idMensaje);

                              setState(() {
                                menu = Promocion("1");
                              });
                            },
                            child: Image.asset(
                              'lib/img/BTN_PROMO.png',
                              width: tamano,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // demo.vistoMensajeApoderado(_mensaje.idMensaje);
                              setState(() {
                                menu = Redes();
                              });
                            },
                            child: Image.asset(
                              'lib/img/BTN_REDES.png',
                              width: tamano,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: menu == null ? inicio() : menu,
      drawer: new Drawer(
        child: Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              new Container(
                color: Colors.white,
                padding: EdgeInsets.only(right: 15.0, left: 15.0),
                child: new Column(children: <Widget>[
                  new ListTile(
                      //  leading: new Icon(
                      //    Icons.image,
                      //     color: Colors.black,
                      //    ),
                      title: Text("CARTA",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWHeadB')),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          menu = CartaView();
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      //  leading: new Icon(
                      //    Icons.image,
                      //     color: Colors.black,
                      //    ),
                      title: Text("INICIO",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          menu = inicio();
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      // leading: FaIcon(FontAwesomeIcons.star,color: Colors.black,),
                      title: Text("PROMOCIONES",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pop();
                          menu = Promocion("1");
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                    //leading: FaIcon(FontAwesomeIcons.facebook,color: Colors.black,),
                    title: Text("FACEBOOK",
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'VWTextL')),
                    onTap: () {
                      Navigator.of(context).pop();
                      launch(
                          'https://www.facebook.com/SAIKOexquisito'); //https://www.facebook.com/SAIKOexquisito
                    },
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      // leading: FaIcon(FontAwesomeIcons.instagram,color: Colors.black,),
                      title: Text("INSTAGRAM",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        Navigator.of(context).pop();
                        launch(
                            'https://www.instagram.com/saikoexquisito/'); //https://www.facebook.com/SAIKOexquisito
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      //leading: FaIcon(FontAwesomeIcons.images,color: Colors.black,),
                      title: Text("NOSOTROS",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        setState(() {
                          menu = Nosotros();
                          Navigator.of(context).pop();
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      //leading: FaIcon(FontAwesomeIcons.images,color: Colors.black,),
                      title: Text("FOTOGRAFIAS",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        setState(() {
                          menu = Galeria();
                          Navigator.of(context).pop();
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      //leading: FaIcon(FontAwesomeIcons.locationArrow,color: Colors.black,),
                      title: Text("UBICACIÓN",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          menu = Gps();
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      // leading: FaIcon(FontAwesomeIcons.calendar,color: Colors.black,),
                      title: Text("HORARIOS",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWTextL')),
                      onTap: () {
                        setState(() {
                          menu = HorarioView();
                          Navigator.of(context).pop();
                        });
                      }),
                  Divider(
                    height: 5.0,
                    color: Colors.black,
                  ),
                  new ListTile(
                      // leading: FaIcon(FontAwesomeIcons.car,color: Colors.black,),

                      title: Text("DELIVERY",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'VWHeadB')),
                      onTap: () {
                        Navigator.of(context).pop();
                        print("ver perfil");
                      })
                ]),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        //backgroundColor: fondo,
        elevation: 0.0,
        backgroundColor: Color(0xFF5e287e).withOpacity(1.0),
      ),
    );
  }
}
