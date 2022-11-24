import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({super.key});

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(38.89971241258084, -77.0486537922262);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
      ),
      // body: ListView(
      //   children: const [
      //     CommonSwiper(),
      //     IndexNavigator(),
      //     // IndexRecommand(),
      //     // Info(showTitle: true),
      //   ],
      // ),
    );
  }
}


