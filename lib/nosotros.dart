import 'package:flutter/material.dart';
import 'package:saikomakki/clases/mision.dart';
import 'package:saikomakki/stream/stream.dart';
import 'package:saikomakki/clases/vision.dart';
import 'package:saikomakki/clases/nosotros.dart';
import 'widgets/loader.dart';
import 'clases/carta.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Nosotros extends StatelessWidget {
  final StreamApp demo = StreamApp();

  Nosotros();

  Widget nosotros() {
    return StreamBuilder(
      stream: demo.listViewNosotros,
      builder: (BuildContext context, AsyncSnapshot<List<NosotrosC>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: Text(""));
          case ConnectionState.done:
            List<NosotrosC> nosotros = snapshot.data;
            print("************************");
            print(nosotros.length);
            print("************************");
            return nosotros.length > 0
                ? Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 3.0,
                      children: <Widget>[
                        Text("Nosotros: ",
                            style: TextStyle(
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                fontFamily: 'VWHeadB',
                                fontSize: 20)),
                        Text(nosotros[0].descripcionNosotros,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'VWTextL')),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 3.0,
                      children: <Widget>[
                        Text("Nosotros: ",
                            style: TextStyle(
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                fontFamily: 'VWHeadB',
                                fontSize: 20)),
                        Text("No existe descripción por el momento",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'VWTextL')),
                      ],
                    ),
                  );
        }
      },
    );
  }

  Widget vision() {
    return StreamBuilder(
      stream: demo.listViewVision,
      builder: (BuildContext context, AsyncSnapshot<List<Vision>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: LoaderOne());
          case ConnectionState.done:
            List<Vision> vision = snapshot.data;
            print("************************");
            print(vision.length);
            print("************************");
            return vision.length > 0
                ? Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 3.0,
                      children: <Widget>[
                        Text("Visión: ",
                            style: TextStyle(
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                fontFamily: 'VWHeadB',
                                fontSize: 20)),
                        Text(vision[0].descripcionVision,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'VWTextL')),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 3.0,
                      children: <Widget>[
                        Text("Visión: ",
                            style: TextStyle(
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                fontFamily: 'VWHeadB',
                                fontSize: 20)),
                        Text("No existe descripción por el momento",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'VWTextL')),
                      ],
                    ),
                  );
        }
      },
    );
  }

  Widget mision() {
    return StreamBuilder(
      stream: demo.listViewMision,
      builder: (BuildContext context, AsyncSnapshot<List<Mision>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: Text(""));
          case ConnectionState.done:
            List<Mision> mision = snapshot.data;
            print("************************");
            print(mision.length);
            print("************************");
            return mision.length > 0
                ? Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 3.0,
                      children: <Widget>[
                        Text("Misión: ",
                            style: TextStyle(
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                fontFamily: 'VWHeadB',
                                fontSize: 20)),
                        Text(mision[0].descripcionMision,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'VWTextL')),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 3.0,
                      children: <Widget>[
                        Text("Misión: ",
                            style: TextStyle(
                                color: Color(0xFF5e287e).withOpacity(1.0),
                                fontFamily: 'VWHeadB',
                                fontSize: 20)),
                        Text("No existe descripción por el momento",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'VWTextL')),
                      ],
                    ),
                  );
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
            body:
                /*Container(
              height: alto,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[nosotros(), mision(), vision()],
              ),
            )
            */
                SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [nosotros(), mision(), vision()],
            ))));
  }
}
