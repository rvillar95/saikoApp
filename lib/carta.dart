import 'package:flutter/material.dart';
import 'package:saikomakki/stream/stream.dart';
import 'widgets/loader.dart';
import 'clases/carta.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class CartaView extends StatelessWidget {
  final StreamApp demo = StreamApp();

  CartaView();

  Widget carta(var ancho, var alto) {
    return StreamBuilder(
      stream: demo.listViewCarta,
      builder: (BuildContext context, AsyncSnapshot<List<Carta>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: LoaderOne());
          case ConnectionState.done:
            List<Carta> mensajes = snapshot.data;
            return mensajes?.length == 0
                ? Center(
                    child: Text(
                    "No existe carta por el momento.",
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
                        Carta _mensaje = mensajes[position];
                        print(_mensaje.imagenCarta);
                        return GestureDetector(
                          onTap: () {
                            PinchZoom(
                              image: Image.network(_mensaje.imagenCarta),
                              zoomedBackgroundColor:
                                  Colors.black.withOpacity(0.5),
                              resetDuration: const Duration(milliseconds: 100),
                              maxScale: 2.5,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 4.0, //degradado
                                      offset: Offset(
                                          2.0, 5.0) //posision de la sombra
                                      )
                                ]),
                            child: Card(
                              color: Colors.white,
                              child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                            margin: EdgeInsets.all(2),
                                            height: alto,
                                            width: ancho,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.network(
                                                          _mensaje.imagenCarta)
                                                      .image,
                                                  fit: BoxFit.fill),
                                            )),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var alto = MediaQuery.of(context).size.height;
    var ancho = MediaQuery.of(context).size.width;
    print(alto);
    print(ancho);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mensaje',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: carta(ancho * .90, alto / 1.5),
        ));
  }
}
