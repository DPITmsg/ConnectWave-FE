import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class RegularMap extends StatelessWidget {
  LatLng location;

  RegularMap(this.location);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        zoom:4,
        target: location,
      ),
      markers: {
        Marker(
          markerId: MarkerId("activity"),
          position: location,
        )
      },
    );
  }
}

