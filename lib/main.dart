import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new JobsListView(title: 'Details'),
    );
  }

  @override
  State<StatefulWidget> createState() => throw UnimplementedError();
}

class JobsListView extends StatefulWidget {
  JobsListView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _JobsListViewState createState() => new _JobsListViewState();
}

class _JobsListViewState extends State<JobsListView> {
  Future<List<Details>> _getDetails() async {
    var data = await http.get("https://reqres.in/api/users?page=1");
    var jsonData = json.decode(data.body);
    List<Details> details = [];
    for (var n in jsonData) {
      Details detail = Details(
          n["id"], n["first_name"], n["second_name"], n["email"], n["avatar"]);
      details.add(detail);
    }
    print(details.length);
    return details;
  }
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                     leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].picture
                        ),
                      ),
                    title: Text(snapshot.data[index].firstname),

                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
class DetailPage extends StatelessWidget {

  final Details details;

  DetailPage(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(details.firstname),
        )
    );
  }
}

class Details {
  final int id;
  final String email;
  final String firstname;
  final String secondname;
  final String avatar;

  Details(this.id,  this.email,this.firstname, this.secondname, this.avatar);
}
