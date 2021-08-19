import 'package:flutter/material.dart';
import 'package:saikomakki/mensaje.dart';
import 'package:saikomakki/promocion.dart';
import 'package:saikomakki/prueba.dart';
import 'provider/push_notifications_provider.dart';
import 'data/servicio.dart';
import 'carta.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const fondo = const Color(0xff5e287e);

class _MyHomePageState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  int _counter = 0;
  int menuSeleccionado = null;

  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();
    print("hola");
    pushProvider.mensajes.listen((argumento) {
      //Navigator.pushNamed(context, 'mensaje');
      print("Argumento del push");
      print(argumento);

      navigatorKey.currentState.pushNamed('promociones',arguments: argumento);
    });
  }

  // void guardaToken() async {
  //  final pushProvider = new PushNotificationsProvider();
  //  var token = await pushProvider.getToken();
  //  print(token);
  // }

  //guardaToken();

 
  void guardarToken() async {
    print("COMENZO");
    Servicio servicio = Servicio();
    String resultado = await servicio.guardarToken();
    print(resultado);
    print("TERMINO");
  }

  @override
  Widget build(BuildContext context) {

    guardarToken();

   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => Prueba(),
        'promociones': (BuildContext context) => Promocion("0"),
      },
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text("aasdsa"),
          )),
    );
  }
}
