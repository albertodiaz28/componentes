import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue),
            title: Text('Título'),
            subtitle: Text('Esta será la descripción de la tarjeta y la primera de clase'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){

                }
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){

                }
              ),
            ]
          )
        ],
      ),
    );

  }

  Widget _cardTipo2(){

    final card = Container(
      //clipBehavior: Clip.antiAlias,
      //elevation: 10.0,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage('https://wallpaperaccess.com/full/1083274.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /*Image(
            image: NetworkImage('https://wallpaperaccess.com/full/1083274.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No sé que poner')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
        //color: Colors.red
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );

  }

}