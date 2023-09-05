import 'package:flutter/material.dart';
import 'package:form_hass/widgets/NavBar.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text('HASS'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20.0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text('Bienvenido', style: TextStyle(color: Colors.black87, fontSize: 25),),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Monitor', style: TextStyle(color: Colors.black, fontSize: 40),),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ) ,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text('Pendientes de hoy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

