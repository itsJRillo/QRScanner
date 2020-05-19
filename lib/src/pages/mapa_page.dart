import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrscanner/src/models/scan_model.dart';

import 'package:latlong/latlong.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Coordendas QR"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.my_location),
            onPressed: (){},
            ),
        ],
      ),
      body: _crearFlutterMap(scan)
    );
  }

  Widget _crearFlutterMap(ScanModel scan){
    return FlutterMap(

      options: MapOptions(
       center: scan.getLatLng(),
       zoom: 10,

      ),
      layers: [
        _crearMapa()
      ],

    );
  }

  _crearMapa(  ) {

    return TileLayerOptions(

      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        "accessToken": "pk.eyJ1IjoiczNraXJvIiwiYSI6ImNrYWU1Z29oNTAwZWMyc3A4ODAwOGszMHEifQ.ZeX4JcmnBWePIQBNCOp1sg",
        "id": "mapbox.streets"
      }


    );

  }
}
