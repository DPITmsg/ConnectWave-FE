import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickerPage extends StatefulWidget {
  final Function(String) onLocationConfirmed;

  LocationPickerPage({Key? key, required this.onLocationConfirmed})
      : super(key: key);

  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  String selectedAddress = '';

  void handleLocationSelected(String? selectedLocation) {
    if (selectedLocation != null) {
      setState(() {
        selectedAddress = selectedLocation ?? '';
      });

      widget.onLocationConfirmed(selectedAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Location'),
      ),
      body: Container(
        child: Stack(
          children: [
            MapLocationPicker(
              apiKey: 'AIzaSyBRFiip8ji8vQQpDmui1Rc1ln3I5h9SJfo',
              currentLatLng: LatLng(0,-160),
              onNext: (GeocodingResult? result) {
                handleLocationSelected(result?.formattedAddress);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
