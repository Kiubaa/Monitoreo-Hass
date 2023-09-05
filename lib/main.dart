import 'package:flutter/material.dart';
import 'package:form_hass/widgets/DropDownInput.dart';
import 'package:form_hass/widgets/DropBugs.dart';
import 'package:form_hass/widgets/DropSick.dart';
import 'package:form_hass/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Formulario de monitoreo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material app',
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/form':(context) => FormDropDown(),
        '/bug':(context) => BugsForm(),
        '/sick':(context) => SickForm(),
      },
    );
  }
}
