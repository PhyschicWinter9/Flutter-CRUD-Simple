import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meloned/membership/membership.dart';
import 'package:meloned/membership/editUser.dart';


class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  Future editprofile (String farmer_ID, String username, String password) async {
    try {
      String url = "https://meloned.relaxlikes.com/api/v0/update.php";
      var response = await http.post(Uri.parse(url), body: {
        'farmer_ID': farmer_ID,
        'username': username,
        'password': password,

      });
      var data = json.decode(response.body);
      print(data);
      if (data == "Success") {
        Fluttertoast.showToast(
          msg: "แก้ไขข้อมูลสำเร็จ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
        // getdata();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DeleteProfileScreen()),
        // );
        setState(() {});
      } else {
        Fluttertoast.showToast(
          msg: "แก้ไขข้อมูลไม่สำเร็จ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future getdata() async {
    var url = "https://meloned.relaxlikes.com/api/v0/view.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูลสมาชิก',style: GoogleFonts.kanit(),),
        centerTitle: true,
        
      ),
      body: Container(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FutureBuilder(
              future: getdata(),
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
                      List list = snapshot.data;
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(snapshot.data[index]['username'],
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w200
                            )),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editprofile(snapshot.data[index]['farmer_ID'], snapshot.data[index]['username'], snapshot.data[index]['password']);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser(
                              list: list,
                              index: index,
                            )));
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          
          ),
        ),
    );
  }
}