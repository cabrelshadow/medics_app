import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

import '../constant/geoLocation.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  BitmapDescriptor markerIcons=BitmapDescriptor.defaultMarker;
  @override
  void initState(){
    AddCustomIcon();
    super.initState();
    rootBundle.loadString('assets/image/map_style.txt').then((String){
      _mapStyle=String;

    });
  }
  void AddCustomIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration(),l2).then(
        (icon){
          setState(() {
            markerIcons=icon;
          });
        }
    );
  }

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  GoogleMapController? myMapController;
  String? _mapStyle;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(CamerounDoualaLatitude, CamerounDoualaLongitude),
    zoom: 14.4746,
  );


  static final Marker _kLakeMarker=Marker(markerId: MarkerId('_kLakeMarker '),
    infoWindow: InfoWindow(title: 'lake plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position:LatLng(CamerounDoualaLatitude, CamerounDoualaLongitude),
  );
  static const CameraPosition _kLake = CameraPosition(

      target:LatLng(CamerounDoualaLatitude, CamerounDoualaLongitude),

      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      leading: Icon(Icons.arrow_back_ios_new),
      title: Text("Ambulance",style: GoogleFonts.montserrat(
         fontWeight:FontWeight.bold
      ),),
    ),
      body:Stack(
         children: [
           GoogleMap
             (
             mapType: MapType.normal,
             markers: {
               Marker(
                   markerId: MarkerId('_kGooglrplex'),
                   infoWindow: InfoWindow(title: 'Nyalla'),
                   icon: markerIcons,
                   position: LatLng(CamerounDoualaLatitude, CamerounDoualaLongitude),
                   draggable: true
               ),

             },
             initialCameraPosition: _kGooglePlex,
             onMapCreated: (GoogleMapController controller) {
               _controller.complete(controller);
               myMapController!.setMapStyle(_mapStyle);
             },



           ),
           //==========================search  bo**************************
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 20),
               height: 50,
               width: 370,
               decoration: BoxDecoration(
                 color: AppColor.placeholder,
                 borderRadius: BorderRadius.circular(25)
               ),
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextField(
                 decoration: InputDecoration(
                   hintText: 'Search location,zip code', // Texte d'indication
                   hintStyle: TextStyle(color:AppColor.secondaryText), // Couleur du texte d'indication
                   prefixIcon: Icon(IconlyLight.search,color: AppColor.secondaryText,), // Icône de recherche à gauche
                   border: InputBorder.none, // Pas de bordure par défaut
                   contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Rembourrage du texte
                 ),
               ),
             ),
           ),
           Positioned(
             bottom: 20,
               left: 30,
               right: 30,
               child:Container(
                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  height: 200,
                 width: 300,
                 decoration: BoxDecoration(
                   color: AppColor.placeholder,
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Confirm your adress", textAlign:TextAlign.start, style: GoogleFonts.montserrat(
                        fontWeight:FontWeight.bold,
                       fontSize: 15

                     ),),
                   Divider( color: AppColor.secondaryText,height: 20, thickness: 1,),
                     SizedBox(height: 15,),
                     Row(
                       children: [
                         Icon(IconlyBold.location,color: Colors.red,size: 30,),
                         SizedBox(width: 5,),
                         AutoSizeText(
                             "Nyall quartier haoussa #210 Eglise ECC,\n Lycee de nyalla",style: GoogleFonts.montserrat(
                           fontSize: 10
                         ),

                           overflow: TextOverflow.ellipsis,
                         )

                       ],
                     ),
                     SizedBox(height: 15,),
                     Center(
                       child: Container(
                         width: 270,
                         height: 50,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color: AppColor.primary,

                         ),
                         child: Center(child: Text("Confirm Location",style: GoogleFonts.montserrat(
                             fontWeight: FontWeight.bold,
                             color: AppColor.white
                         ),),),
                       ),
                     )
                   ],
                 ),
               ) 
           
           
           )
         ],
      ),
    /*  floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}