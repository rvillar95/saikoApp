import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Redes extends StatelessWidget {
  Redes();

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
          body: Container(
            child: Column(
              children: [
                new ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 40,
                  ),
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
                    leading: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.red,
                      size: 40,
                    ),
                    title: Text("INSTAGRAM",
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'VWTextL')),
                    onTap: () {
                      Navigator.of(context).pop();
                      launch(
                          'https://www.instagram.com/saikoexquisito/'); //https://www.facebook.com/SAIKOexquisito
                    }),
              ],
            ),
          ),
        ));
  }
}
