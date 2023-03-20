import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:location/location.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController controller;
  final Location _location = Location();
  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
            target: LatLng(event.latitude!.toDouble(),event.longitude!.toDouble()),
            zoom: 15
          ),

        ),
      );
    });
  }

  final LatLng _initialCameraPosition = const LatLng(20.5937, 78.9629);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialCameraPosition),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 60,left: 10,bottom: 40,top: 40),
                    child: MaterialButton(
                      onPressed: (){},
                      color: primaryColor,
                      shape: const StadiumBorder(),
                      child: TextWidget(text: "Set Location",),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
