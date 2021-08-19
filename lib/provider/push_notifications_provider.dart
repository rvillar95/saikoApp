import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../clases/constantes.dart';

class PushNotificationsProvider {
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  var token = "";

  Future<String> getToken() {
    _firebaseMessaging.requestNotificationPermissions();
    return _firebaseMessaging.getToken();
  }

  initNotifications() {
    print("HOLAAAAAAAAAAAA");

    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print("======FCM Token==========");
      print(token);
      this.token = token;
    });
    //APA91bH5rnZ33woedXtdvYQL1M2PvCwnBB9M8JHbbKrOG9171H0burznQU6UsNICo_hvEy4HXRUauFC_7FXAgogLf3A0TkQtPG_2BVEINvvesQhbMJJtkWFihjQdawBH3tBNuYKGpan6

    _firebaseMessaging.configure(onMessage: (info) {
      print('====== On Message ========');
      print('hola1');
      print(info);
      print('hola2');
      String argumento = 'no-data';
      if (Platform.isAndroid) {
        argumento = info['data']['comida'] ?? 'no-data';
      }
      print("la data es " + argumento);
      _mensajesStreamController.sink.add(argumento);
    }, onLaunch: (info) {
      print('====== On Launch ========');
      print(info);

      final noti = info['data']['comida'];
      print(noti);
    }, onResume: (info) {
      print('====== On Resume ========');
      print(info);
      final noti = info['data']['comida'];
      print(noti);
      String argumento = 'no-data';
      if (Platform.isAndroid) {
        argumento = info['data']['comida'] ?? 'no-data';
      }
      print("la data es " + argumento);
      _mensajesStreamController.sink.add(argumento);
    });
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
