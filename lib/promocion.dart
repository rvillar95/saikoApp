import 'package:flutter/material.dart';
import 'package:saikomakki/clases/promociones.dart';
import 'package:saikomakki/stream/stream.dart';
import 'widgets/loader.dart';
import 'clases/carta.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

class Promocion extends StatelessWidget {
  String numero = "";
  Promocion(this.numero);
  final StreamApp demo = StreamApp();

  Widget promociones(ancho) {
    return StreamBuilder(
      stream: demo.listviewPromociones,
      builder:
          (BuildContext context, AsyncSnapshot<List<PromocionesC>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: LoaderOne());
          case ConnectionState.done:
            List<PromocionesC> mensajes = snapshot.data;
            return mensajes?.length == 0
                ? Center(
                    child: Text(
                    "No existen promociones por el momento.",
                    style: TextStyle(
                        color: Color(0xFF5e287e).withOpacity(1.0),
                        fontFamily: 'VWHeadB'),
                  ))
                : Container(
                    color: Color(0xFFE6E6E6),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mensajes?.length ?? 0,
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (lista, position) {
                        PromocionesC _mensaje = mensajes[position];
                        return _mensaje.validaciones == 'S'
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    color: Color(0xFF5e287e).withOpacity(1.0)),
                                margin: EdgeInsets.all(20),
                                height: 400,
                                //color: Colors.blue,
                                child: Column(
                                  children: [
                                    this.numero == "0" && position == 0
                                        ? Stack(
                                            fit: StackFit.loose,
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                  image: DecorationImage(
                                                      image: Image.network(_mensaje
                                                              .imagenPromocion)
                                                          .image,
                                                      fit: BoxFit.cover),
                                                ),
                                                //color: Colors.red,
                                                height: 170,
                                                width: ancho,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 8.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: Colors.red,
                                                ),
                                                child: Text(
                                                  "Nueva Promoción",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontFamily: 'VWHeadB',
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              image: DecorationImage(
                                                  image: Image.network(_mensaje
                                                          .imagenPromocion)
                                                      .image,
                                                  fit: BoxFit.cover),
                                            ),
                                            //color: Colors.red,
                                            height: 170,
                                            width: ancho,
                                          ),
                                    Container(
                                        height: 230,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Text(
                                                _mensaje.nombrePromocion,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontFamily: 'VWHeadB'),
                                              ),
                                              _mensaje.tipoPromocion == '1'
                                                  ? Text(
                                                      "Valido hasta: " +
                                                          _mensaje.fechaFin,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontFamily:
                                                              'VWTextL'),
                                                    )
                                                  : Text(""),
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Text(
                                                  _mensaje.descripcionPromocion,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'VWTextL'),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    new String.fromCharCodes(
                                                            new Runes(
                                                                '\u0024')) +
                                                        _mensaje.precioNuevo,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        fontFamily: 'VWHeadB'),
                                                  ),
                                                  Text(
                                                    new String.fromCharCodes(
                                                            new Runes(
                                                                '\u0024')) +
                                                        _mensaje.precioAntiguo,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      fontFamily: 'VWHeadB',
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    child: QrImage(
                                                      data: _mensaje.link,
                                                      version: QrVersions.auto,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      backgroundColor:
                                                          Colors.white,
                                                      size: 80.0,
                                                      gapless: false,
                                                    ),
                                                    onTap: () async {
                                                      final result = await showOkCancelAlertDialog(
                                                          context: context,
                                                          title:
                                                              '¿Desea canjear esta promoción ahora?',
                                                          message:
                                                              'Esta promoción solo puede ser utilizada una vez.',
                                                          defaultType:
                                                              OkCancelAlertDefaultType
                                                                  .cancel,
                                                          cancelLabel:
                                                              "Ahora no.",
                                                          okLabel:
                                                              "Si, ocupar.");
                                                      print(result);
                                                      if (result ==
                                                          OkCancelResult.ok) {
                                                        launch(_mensaje.link);
                                                        promociones(ancho);
                                                      } else {
                                                        print("cancelar");
                                                      }
                                                      //logger.info(result);
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            : Container(
                                height: 0,
                              );
                      },
                    ));
        }
      },
    );
  }

/*
Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xFF5e287e).withOpacity(1.0)),
              margin: EdgeInsets.all(20),
              height: 400,
              //color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: Image.network(
                                  "https://www.saikomakki.cl/images/caramel-onion-makki.jpg?crc=4223763421")
                              .image,
                          fit: BoxFit.cover),
                    ),
                    //color: Colors.red,
                    height: 170,
                    width: ancho,
                  ),
                  Container(
                    height: 230,
                    child: Column(
                      children: [
                        Text(
                          "10% en Café para llevar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'VWHeadB'),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Esta mañana sorprendí a mi nieto mirando por la ventana con la mirada perdida. No me oyó entrar. Al verlo tan ensimismado preferí no interrumpir sus pensamientos y esperar. Tal vez, pensé, algo de lo que está viendo le esté descubriendo una parte nue",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'VWTextL'),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              new String.fromCharCodes(new Runes('\u0024')) +
                                  "650.- ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'VWHeadB'),
                            ),
                            Text(
                              new String.fromCharCodes(new Runes('\u0024')) +
                                  "650.- ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'VWHeadB',
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            GestureDetector(
                              child: QrImage(
                                data: "https://www.saikomakki.cl/Admin/cobrarPromocion?variable=" +
                                    base64
                                        .encode(utf8.encode(
                                            "d8fLCcR3RUevELbAj3TsIC:APA91bG5LXtCVHCDtXQh7rsTF5gekf4aM-2HDg3oXGMj36nVymqWGXU22jtEGKQWApVssT6QmpLtbUUu299As0BlSoSBNtP1wPlbB0CpaHqeHdmUbj-iGvboXr0fLOEA9hmtSydt04NM,S"))
                                        .toString(),
                                version: QrVersions.auto,
                                padding: EdgeInsets.all(5),
                                backgroundColor: Colors.white,
                                size: 80.0,
                                gapless: false,
                              ),
                              onTap: () async {
                                final result = await showOkCancelAlertDialog(
                                    context: context,
                                    title:
                                        '¿Desea canjear esta promoción ahora?',
                                    message:
                                        'Esta promoción solo puede ser utilizada una vez.',
                                    defaultType:
                                        OkCancelAlertDefaultType.cancel,
                                    cancelLabel: "Ahora no.",
                                    okLabel: "Si, ocupar.");
                                print(result);
                                if (result == OkCancelResult.ok) {
                                  launch(
                                      'https://www.instagram.com/saikoexquisito/');
                                } else {
                                  print("cancelar");
                                }
                                //logger.info(result);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
*/
  Widget cuerpo(ancho) {
    if (numero == "1") {
      return Scaffold(
        body: promociones(ancho),
      );
    } else if (numero == "0") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Promociones"),
          elevation: 0.0,
          backgroundColor: Color(0xFF5e287e).withOpacity(1.0),
        ),
        body: promociones(ancho),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var alto = MediaQuery.of(context).size.height;
    var ancho = MediaQuery.of(context).size.width;
    print(alto);
    print(ancho);

    return cuerpo(ancho);
  }
}
