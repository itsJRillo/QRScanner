import 'package:flutter/material.dart';
import 'package:qrscanner/src/models/scan_model.dart';

import 'package:qrscanner/src/pages/direcciones_page.dart';
import 'package:qrscanner/src/pages/mapas_page.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrscanner/src/providers/db_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.delete_forever),
            onPressed: (){})
        ],
      ),

    body:_callPage(currentIndex),
          bottomNavigationBar: _createBNB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: _scanQR,
            child: Icon(Icons.filter_center_focus)),
        );
      }

      Widget _createBNB() {
        return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){

         setState(() {
           currentIndex = index;
         });
        },
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Mapas"),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            title: Text("Direcciones")
            )
        ]
      );
      }

      Widget _callPage(int paginaActual) {


      switch(paginaActual){

          case 0: return MapasPage();
          case 1: return DirectionPage();

          default:
          return MapasPage();
        }
      }

      _scanQR() async{ 
        
        //https://github.com/GeoDashup
        //geo:40.7242333047051705,-69.00731459101564


        String futureString = "https://github.com/GeoDashup";

        // try {

        //   futureString = await BarcodeScanner.scan();
        // } catch( e ) {

        //   futureString = e.toString();
        // }

        // print( "Future String: $futureString" );

        if( futureString != null ) {
          
          final scan = ScanModel(valor: futureString);

          DBProvider.db.nuevoScan(scan);
        }

      }
}
  

