import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trial/JobsListView.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: JobsListView(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//  // GoogleMapController mapController;
//   //for List View
//   List list = List();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //initalize list
//     list.add("nr.1");
//     list.add("nr.2");
//     list.add("nr.3");
//     list.add("nr.4");
//     list.add("nr.5");
//     list.add("nr.6");
//   }

//   /*//final LatLng _center = const LatLng(27.6477079, 85.3446311);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
// */
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(

//           title: Text('Naxa Map Demo'),
//           backgroundColor: Colors.brown[700],
//         ),
//      body: Center(
//        child: JobsListView()
//      ),
//     /* GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),*/
//       ),
//     );
//   }
}

