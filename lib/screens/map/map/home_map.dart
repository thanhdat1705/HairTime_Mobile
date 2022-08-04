import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'dart:ui' as ui;

// import 'package:permission/permission.dart';

class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  final Set<Polyline> polyline = {};

  GoogleMapController _controller;

  List<Marker> allMarkers = [
    Marker(
      markerId: MarkerId('origin'),
      position: LatLng(10.841079, 106.810746),
    ),
  ];
  List<LatLng> routeCoords = new List<LatLng>();
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyDafTmJ4GGiS2rf76lXBHL_EGT5yn9qWg0");

  getsomePoints() async {
    // var permissions =
    //     await Permission.getPermissionsStatus([PermissionName.Location]);
    // if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
    //   var askpermissions =
    //       await Permission.requestPermissions([PermissionName.Location]);
    // } else {

    // }
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
      origin: LatLng(10.843243, 106.807171),
      destination: LatLng(10.839386, 106.811280),
      mode: RouteMode.driving,
    );
    // routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
    //   origin: LatLng(40.6782, -73.9442),
    //   destination: LatLng(40.6944, -73.9212),
    //   mode: RouteMode.driving,
    // );
  }

  getaddressPoints() async {
    routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(
      origin: '55 Kingston Ave Brooklyn NY 11213',
      destination: '8007 Cypress Ave Glendale NY 11385',
      mode: RouteMode.driving,
    );
  }

  Future<Uint8List> getBytesFromAsset(
      String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Future<void> _showLocationBasedOnZone() async {
    final Uint8List brandIcon =
        await getBytesFromAsset('assets/markerStore.png', 100, 100);
    setState(() {
      allMarkers.add(
        Marker(
          markerId: MarkerId('store'),
          infoWindow: InfoWindow(title: 'Barber'),
          position: LatLng(10.853350, 106.789050),
          icon: BitmapDescriptor.fromBytes(brandIcon),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showLocationBasedOnZone();
    // getsomePoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        polylines: polyline,
        markers: Set.from(allMarkers),
        initialCameraPosition:
            CameraPosition(target: LatLng(10.853948, 106.795248), zoom: 14.2),
        mapType: MapType.normal,
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      polyline.add(
        Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: [
            LatLng(10.841079, 106.810746),
            LatLng(10.840844, 106.810515),
            LatLng(10.840660, 106.810201),
            LatLng(10.840491, 106.810049),
            LatLng(10.853527, 106.796171),
            LatLng(10.853948, 106.795248),
            LatLng(10.855392, 106.789905),
            LatLng(10.856045, 106.789186),
            LatLng(10.855563, 106.788258),
            LatLng(10.855352, 106.788012),
            LatLng(10.854741, 106.787282),
            LatLng(10.854625, 106.787320),
            LatLng(10.853714, 106.787089),
            LatLng(10.853404, 106.788736),
            LatLng(10.853259, 106.788734),
            LatLng(10.853380, 106.789036),
            LatLng(10.853350, 106.789050),
          ],
          width: 4,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap,
        ),
      );
    });
  }
}

// class MapUtils {
//   MapUtils._();

//   static Future<void> openMap(double latitude, double longitude) async {
//     String googleUrl =
//         'https://www.google.com/maps/place/442+L%C3%AA+V%C4%83n+Vi%E1%BB%87t,+T%C4%83ng+Nh%C6%A1n+Ph%C3%BA+A,+Qu%E1%BA%ADn+9,+Th%C3%A0nh+ph%E1%BB%91+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam';
//     if (await canLaunch(googleUrl)) {
//       await launch(googleUrl);
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
// }
