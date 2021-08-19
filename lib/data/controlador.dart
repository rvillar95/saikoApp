import 'package:http/http.dart' as http;
import 'package:saikomakki/clases/carta.dart';
import 'package:saikomakki/clases/mision.dart';
import 'package:saikomakki/clases/nosotros.dart';
import 'package:saikomakki/clases/promociones.dart';
import 'package:saikomakki/clases/vision.dart';
import 'package:saikomakki/clases/horarios.dart';
import '../provider/push_notifications_provider.dart';
import 'dart:convert';

class Controlador {
  static Future getCarta() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    http.Response response = await http.post(
        "https://www.saikomakki.cl/Admin/getCartaApp",
        body: {'token': token});

    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<Carta> _carta =
        collection.map((json) => Carta.fromJson(json)).toList();
    return _carta;
  }

  static Future getVision() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    http.Response response = await http.post(
        "https://www.saikomakki.cl/Admin/getVisionApp",
        body: {'token': token});

    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<Vision> _carta =
        collection.map((json) => Vision.fromJson(json)).toList();
    return _carta;
  }

  static Future getMision() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    http.Response response = await http.post(
        "https://www.saikomakki.cl/Admin/getMisionApp",
        body: {'token': token});

    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<Mision> _carta =
        collection.map((json) => Mision.fromJson(json)).toList();
    return _carta;
  }

  static Future getNosotros() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    http.Response response = await http.post(
        "https://www.saikomakki.cl/Admin/getNosotrosApp",
        body: {'token': token});

    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<NosotrosC> _carta =
        collection.map((json) => NosotrosC.fromJson(json)).toList();
    return _carta;
  }

  static Future getHorarios() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(
        "https://www.saikomakki.cl/Admin/getHorarioApp",
        body: {"token": token});
    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<Horarios> _carta =
        collection.map((json) => Horarios.fromJson(json)).toList();
    return _carta;
  }

  static Future getPromociones() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(
        "https://www.saikomakki.cl/Admin/getPromocionesApp",
        body: {"token": token});
    await Future.delayed(Duration(seconds: 2));

    String content = response.body;
    List collection = json.decode(content);
    List<PromocionesC> _promociones =
        collection.map((json) => PromocionesC.fromJson(json)).toList();
    return _promociones;
  }
}
