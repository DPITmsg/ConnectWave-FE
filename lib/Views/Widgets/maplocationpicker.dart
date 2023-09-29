import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/Styles/Colors.dart';

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
            Align(
              alignment: Alignment.topRight,
              child:
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color_Blue,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextButton(
                    onPressed: (){
                      handleLocationSelected("63G22222+22");
                      Navigator.of(context).pop();
                    },
                    child: Text("Online", style: TextStyle(color: Color_White),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
