import 'package:flutter/material.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('CONTROL'),
                accountEmail: Text('CULTIVOS HASS'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fes%2Fsearch%3Fq%3Daguacate%2Bnegro%2By%2Bblanco&psig=AOvVaw0FaABeFKMBUdAnTJD6Z6SX&ust=1694019884993000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMCF3IL6k4EDFQAAAAAdAAAAABAX',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Principal'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Formulario'),
              onTap: () => Navigator.pushNamed(context, '/form'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () => print('config'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Ayuda'),
              onTap: () => print('help'),
            ),
          ],
        ),
      );
  }
}