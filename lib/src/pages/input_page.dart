import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  List _poderes = ['Volar', 'Rayos X', 'Super aliento', 'Lanzallamas'];
  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Escriba un nombre',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
       
        setState(() {
          _nombre = valor;
        });
      },
    );

  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Escriba su email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState((){
        _email = valor;
      })
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Escriba su contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_rounded)
      ),
      onChanged: (valor) => setState((){
        _email = valor;
      })
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );
  }

  _crearPersona(){
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionSeleccionada)
    );
  }

  void _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if (picked != null ){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) { 
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  _crearDropdown() {

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );

    

  }


}