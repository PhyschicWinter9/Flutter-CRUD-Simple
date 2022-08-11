import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meloned/membership/membership.dart';

class ViewProfileScreen extends StatefulWidget {
  ViewProfileScreen({Key? key}) : super(key: key);

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  Future getProfile() async {
    var url = "https://meloned.relaxlikes.com/api/view.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลผู้ใช้งาน'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: FutureBuilder(
            future: getProfile(),
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
                      leading: Icon(Icons.person),
                      title: Text(snapshot.data[index]['username'],
                          style: GoogleFonts.kanit(
                              fontSize: 20, fontWeight: FontWeight.w200)),
                    );
                  },
                );
              }
            },
          ),

          //
        ),
      ),
    );
  }
}
