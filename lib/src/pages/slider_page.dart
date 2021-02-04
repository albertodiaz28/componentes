import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      onChanged: (_bloquearCheck) ? null : ( valor ){
        setState(() {
           _valorSlider = valor;
        });
       
      },
      
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage('https://i.pinimg.com/originals/d8/c7/6c/d8c76c0aa3bc15174e6272ec70f4cd1a.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _checkBox() {

    /*return Checkbox(
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
        
      }
    );

  }*/

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck, 
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
          
        }
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck, 
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
          
        }
    );
  }
}