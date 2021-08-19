import 'dart:async';
import 'package:saikomakki/clases/horarios.dart';
import 'package:saikomakki/clases/mision.dart';
import 'package:saikomakki/clases/promociones.dart';
import 'package:saikomakki/clases/vision.dart';
import 'package:saikomakki/clases/nosotros.dart';
import 'package:saikomakki/clases/horarios.dart';
import '../data/controlador.dart';

import '../clases/carta.dart';

class StreamApp {
  Stream<List<Carta>> get listViewCarta async* {
    yield await Controlador.getCarta();
    print("MENSAJES Profesor");
  }

  Stream<List<Mision>> get listViewMision async* {
    yield await Controlador.getMision();
    print("MENSAJES Profesor");
  }

  Stream<List<Vision>> get listViewVision async* {
    yield await Controlador.getVision();
    print("MENSAJES Profesor");
  }

  Stream<List<NosotrosC>> get listViewNosotros async* {
    yield await Controlador.getNosotros();
    print("MENSAJES Profesor");
  }

  Stream<List<Horarios>> get listViewHorarios async* {
    yield await Controlador.getHorarios();
    print("MENSAJES Profesor");
  }

   Stream<List<PromocionesC>> get listviewPromociones async* {
    yield await Controlador.getPromociones();
    print("MENSAJES Profesor");
  }
}
