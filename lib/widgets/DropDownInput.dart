import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:form_hass/widgets/NavBar.dart';

class FormDropDown extends StatefulWidget {
  const FormDropDown({Key? key}) : super (key: key);

  @override
  _FormDropDownState createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {

  //Variable para geolocalicacion
  Future<Position> determinatePosition() async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return Future.error("error");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async{
    Position position = await determinatePosition();
    print (position.latitude);
    print (position.longitude);
  }

  // Variables datos de salida
  var productiveChoose, sizeChoose, statusChoose, birthChoose, zocaChoose, colorChoose, packChoose, nutrientChoose, stepChoose;

  // Variables datos de entrada
  List productiveList = [
    "Alta", "Media", "Baja", "Sin producción"
  ];

  List sizeList = [
    "Muy grande", "Grande", "Mediano", "Pequeño", "Vacio"
  ];

  List statusList = [
    "Okey", "Amarillento", "Resiembra", "Zoca", "Muerto"
  ];

  List birthList = [
    "0", "0.5", "1", "1.5", "2"
  ];

  List colorList = [
    "Sin follaje", "Amarillo avanzado", "Amarillo leve", "Verde normal"
  ];

  List packList = [
    "1", "2", "3", "4"
  ];

  List stepList = [
    "Floración", "Cuaje", "Brotación", "Cosecha", "Prefloración", "Desarrollo de fruto"
  ];

  List nutrientList = [
    "Zinc", "Boro", "Magnesio", "npk", "Calcio", "Azufre"
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de caracteristicas'),
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _productiveDrop(),
            _sizeDrop(),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: _statusDrop(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: _birthDrop(),
                ),
              ],
            ),
            _colorDrop(),
            _stepDrop(),
            _nutrientDrop(),
            _packDrop(),
            Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width - 30,
              height: 45,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.lightGreen
                ),
                  onPressed: (){
                    getCurrentLocation();
                  },
                  child: Text("Tomar coordenadas", style: TextStyle(fontSize: 18),)
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
                    Navigator.pushNamed(context, '/bug');
                  },
                  child: Text("Siguiente", style: TextStyle(fontSize: 25),)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _productiveDrop() {
    return Container (
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15)
          ),
          child: DropdownButton(
            hint: Text("Nivel de productividad: "),
            dropdownColor: Colors.white,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ), //TextStyle
            value: productiveChoose,
            onChanged: (newValue){
              setState(() {
                productiveChoose = newValue;
              });
            },
            items: productiveList.map((valueItem){
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
        ),
      );
  }
  Container _sizeDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Tamaño: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: sizeChoose,
          onChanged: (newValue){
            setState(() {
              sizeChoose = newValue;
            });
          },
          items: sizeList.map((valueItem){
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
  Container _birthDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Edad: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: birthChoose,
          onChanged: (newValue){
            setState(() {
              birthChoose = newValue;
            });
          },
          items: birthList.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
  Container _colorDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Color: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: colorChoose,
          onChanged: (newValue){
            setState(() {
              colorChoose = newValue;
            });
          },
          items: colorList.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
  Container _packDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Lote: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: packChoose,
          onChanged: (newValue){
            setState(() {
              packChoose = newValue;
            });
          },
          items: packList.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
  Container _stepDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Etapa fenológica: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: stepChoose,
          onChanged: (newValue){
            setState(() {
              stepChoose = newValue;
            });
          },
          items: stepList.map((valueItem){
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ),
    );
  }
  Container _nutrientDrop() {
    return Container (
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          hint: Text("Deficiencia de nutrientes: "),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ), //TextStyle
          value: nutrientChoose,
          onChanged: (newValue){
            setState(() {
              nutrientChoose = newValue;
            });
          },
          items: nutrientList.map((valueItem){
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