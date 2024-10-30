import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swap/core/di/swap_router.dart';
import 'package:swap/core/layout/swap_layout.dart';
import 'package:swap/core/state/place_type.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> _markers = [];
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(35.680810987673006, 139.77255363060334);

//35.00499879888781, 135.76110637931163

  @override
  void initState() {
    super.initState();
    _addMarkers(); // 마커 추가 메서드 호출
  }

  void _addMarkers() {
    // 여러 개의 마커 추가
    _markers.add(
      Marker(
        markerId: const MarkerId("1"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.one.title,
            "image": PlaceType.one.image,
          },
        ),
        position: const LatLng(35.68194759828659, 139.77033489976512),
      ),
    );
    //35.00497644882776, 135.76173866488756
    _markers.add(
      Marker(
        markerId: const MarkerId("2"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.two.title,
            "image": PlaceType.two.image,
          },
        ),
        position: const LatLng(35.682546907632634, 139.7719044530368),
      ),
    );
    //35.00488154621454, 135.7609731218375
    _markers.add(
      Marker(
        markerId: const MarkerId("3"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.three.title,
            "image": PlaceType.three.image,
          },
        ),
        position: const LatLng(35.67966117019675, 139.7699343994598),
      ),
    );
    //35.004950513297324, 135.76091922819037
    _markers.add(
      Marker(
        markerId: const MarkerId("4"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.four.title,
            "image": PlaceType.four.image,
          },
        ),
        position: const LatLng(35.67904045886668, 139.7718604925504),
      ),
    );
    //35.00429090380644, 135.76282445210512
    _markers.add(
      Marker(
        markerId: const MarkerId("5"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.five.title,
            "image": PlaceType.five.image,
          },
        ),
        position: const LatLng(35.68088348022258, 139.77445771378402),
      ),
    );
    //35.00281745314185, 135.75870227171382
    _markers.add(
      Marker(
        markerId: const MarkerId("6"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.six.title,
            "image": PlaceType.six.image,
          },
        ),
        position: const LatLng(35.682894625602344, 139.7743218103923),
      ),
    );
    //35.004838663255626, 135.75705723345075
    _markers.add(
      Marker(
        markerId: const MarkerId("7"),
        draggable: true,
        onTap: () => context.push(
          "/placeDetail",
          extra: {
            "title": PlaceType.seven.title,
            "image": PlaceType.seven.image,
          },
        ),
        position: const LatLng(35.68052455932838, 139.77466240802758),
      ),
    );
    //35.004488200594274, 135.76271865622326
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SwapLayout(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16.0,
        ),
        markers: Set.from(_markers), // 마커 세트 추가
      ),
    );
  }
}
