import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:form_hass/widgets/NavBar.dart';

class SickForm extends StatefulWidget {
  const SickForm({Key? key}) : super (key: key);

  @override
  _SickForm createState() => _SickForm();
}

class _SickForm extends State<SickForm> {

  // Variables datos de salida
  var sickChoose, statusChoose;

  // Variables datos de entrada
  List sickList = [
    "Verticillium", "Phytophthora", "Antracnosis", "Cancros"
  ];

  List statusList = [
    "Recién detectada", "En tratamiento", "Tratamiento sin exito", "Antecedentes de enfermedad"
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de enfermedades'),
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _sickDrop(),
            _statusDrop(),
            Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width - 30,
              height: 45,
              child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightGreen
                  ),
                  onPressed: (){
                  },
                  child: Text("Añadir enfermedad", style: TextStyle(fontSize: 18),)
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text("Siguiente", style: TextStyle(fontSize: 25),)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _sickDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Enfermedad: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: sickChoose,
          onChanged: (newValue){
            setState(() {
              sickChoose = newValue;
            });
          },
          items: sickList.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
  Container _statusDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Estado: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: statusChoose,
          onChanged: (newValue){
            setState(() {
              statusChoose = newValue;
            });
          },
          items: statusList.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }

}