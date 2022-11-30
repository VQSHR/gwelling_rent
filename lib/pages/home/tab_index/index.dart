import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';
import 'package:geocoding/geocoding.dart';

import '../../room_manage/operation.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({super.key});

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(38.89971241258084, -77.0486537922262);

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    var rooms = await Firestore.getAllEntries();
    setState(() {
      _markers.clear();
    });
    for (final room in rooms) {
      List<Location> locations = await locationFromAddress(room.location, localeIdentifier: 'en_US');
      var lat = locations[0].latitude;
      var lng = locations[0].longitude;
      //CommonToast.showToast("$lat, $lng");
      final marker = Marker(
        markerId: MarkerId(room.title),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: room.title,
          snippet: room.price.toString()+'USD/month',
        ),
      );
      setState(() {
        _markers[room.title] = marker;
      });
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          inputValue: '',
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}


