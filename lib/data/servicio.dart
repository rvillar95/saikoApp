import 'package:http/http.dart' as http;
import 'package:saikomakki/clases/horarios.dart';
import 'package:saikomakki/clases/mision.dart';
import 'package:saikomakki/clases/vision.dart';
import 'package:saikomakki/clases/nosotros.dart';
import '../provider/push_notifications_provider.dart';
import '../clases/carta.dart';
import 'dart:convert';

class Servicio {
  String urlLogin = "https://www.saikomakki.cl/Admin/guardarToken";
  String urlCarta = "https://www.saikomakki.cl/Admin/getCartaApp";
  String urlMision = "https://www.saikomakki.cl/Admin/getMisionApp";
  String urlVision = "https://www.saikomakki.cl/Admin/getVisionApp";
  String urlNosotros = "https://www.saikomakki.cl/Admin/getNosotrosApp";
  String urlHorarios = "https://www.saikomakki.cl/Admin/getHorarioApp";
  List<Carta> listaCartas = [];
  List<Mision> listaMision = [];
  List<Vision> listaVision = [];
  List<NosotrosC> listaNosotros = [];
  List<Horarios> listaHorarios = [];

  Future guardarToken() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(urlLogin, body: {'token': token});

    return response.body;
  }

  Future getCarta() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(urlCarta, body: {"token": token});
    if (response.statusCode == 200 && response.body != '"Error"') {
      listaCartas = (json.decode(response.body) as List)
          .map((o) => Carta.fromJson(o))
          .toList();
    }
    return listaCartas;
  }

  Future getVision() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(urlVision, body: {"token": token});
    if (response.statusCode == 200 && response.body != '"Error"') {
      listaVision = (json.decode(response.body) as List)
          .map((o) => Vision.fromJson(o))
          .toList();
    }
    return listaVision;
  }

  Future getMision() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(urlMision, body: {"token": token});
    if (response.statusCode == 200 && response.body != '"Error"') {
      listaMision = (json.decode(response.body) as List)
          .map((o) => Mision.fromJson(o))
          .toList();
    }
    return listaMision;
  }

  Future getNosotros() async {
    final pushProvider = new PushNotificationsProvider();
    var token = await pushProvider.getToken();
    //print(token);
    var response = await http.post(urlNosotros, body: {"token": token});
    if (response.statusCode == 200 && response.body != '"Error"') {
      listaNosotros = (json.decode(response.body) as List)
          .map((o) => NosotrosC.fromJson(o))
          .toList();
    }
    return listaNosotros;
  }

 
}
