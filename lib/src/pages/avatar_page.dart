import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://imagenes.20minutos.es/files/og_thumbnail/uploads/imagenes/2020/05/12/elon-musk-director-de-testa-y-spacex.jpeg'),
              //radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image:NetworkImage('https://image.cnbcfm.com/api/v1/image/106806377-1607090600215-gettyimages-1229893101-AFP_8WA6E2.jpeg?v=1611322909&w=1400&h=950'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 200 ),
        ),
      ),
    );
  }
}