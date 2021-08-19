import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'provider/push_notifications_provider.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
void main() => runApp(new Galeria());

class Galeria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
/*
 final pushProvider = new PushNotificationsProvider();
    print(pushProvider.getToken().then((token) {
      print(token);
    }));*/

    
    final theme = Theme.of(context);
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new ListView.builder(
              itemBuilder: _buildVerticalChild,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVerticalChild(BuildContext context, int index) {
    index++;
    if (index > 24) return null;
    return new Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new GestureDetector(
        onTap: () {
          print('Tapped $index');
        },
        child: new ParallaxImage(
          extent: 150.0,
          image: new ExactAssetImage(
            'lib/img/img$index.jpg',
          ),
        ),
      ),
    );
  }
}
