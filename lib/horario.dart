import 'package:flutter/material.dart';
import 'package:saikomakki/clases/horarios.dart';
import 'package:saikomakki/stream/stream.dart';
import 'widgets/loader.dart';
import 'clases/carta.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HorarioView extends StatelessWidget {
  final StreamApp demo = StreamApp();

  HorarioView();

  Widget horarios() {
    return StreamBuilder(
      stream: demo.listViewHorarios,
      builder: (BuildContext context, AsyncSnapshot<List<Horarios>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: LoaderOne());
          case ConnectionState.done:
            List<Horarios> horarios = snapshot.data;
            return horarios?.length == 0
                ? Center(
                    child: Text(
                    "No existen cartas por el momento.",
                    style: TextStyle(
                        color: Color(0xFF5e287e).withOpacity(1.0),
                        fontFamily: 'VWHeadB'),
                  ))
                : Container(
                    color: Color(0xFFE6E6E6),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: horarios?.length ?? 0,
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (lista, position) {
                        Horarios _horarios = horarios[position];
                        return Container(
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
                                    offset:
                                        Offset(2.0, 5.0) //posision de la sombra
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: Wrap(
                                          alignment: WrapAlignment.start,
                                          direction: Axis.horizontal,
                                          runSpacing: 5.0,
                                          children: <Widget>[
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                    "Día: " +
                                                        _horarios.nombreHorario,
                                                    style: TextStyle(
                                                        color: Color(0xFF5e287e)
                                                            .withOpacity(1.0),
                                                        fontFamily: 'VWHeadB',
                                                        fontSize: 20)),
                                                Text(
                                                    "Desde: " +
                                                        _horarios.desdeHorario,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'VWTextL')),
                                                Text(
                                                    "Hasta: " +
                                                        _horarios.hastaHorario,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'VWTextL')),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
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
          body: horarios(),
        ));
  }
}
