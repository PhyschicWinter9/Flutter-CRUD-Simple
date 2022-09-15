import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meloned/membership/membership.dart';
import 'package:meloned/membership/edit.dart';

class EditUser extends StatefulWidget {
  final List list;
  final int index;

  EditUser({Key? key, required this.index, required this.list})
      : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  //Getting the data from the database
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController farmer_IDController = new TextEditingController();


  //Edit Mode
  bool editMode = false;

  //formkey
  final formkey = GlobalKey<FormState>();

  Future ShowEdit() async{
    print(farmer_IDController.text);
    print(usernameController.text);
    print(passwordController.text);
  }

  // Future editUser() async {
  //   if (editMode) {
  //     var url = 'https://meloned.relaxlikes.com/api/update.php';

  //     http.post(Uri.parse(url), body: {
  //       'farmer_ID': farmer_IDController.text,
  //       'username': usernameController.text,
  //       'password': passwordController.text,
  //     });
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => EditProfileScreen(),
  //       ),
  //     );
  //   }
  // }

  Future editUserv1() async{
    if (editMode) {
      var url = 'https://meloned.relaxlikes.com/api/v0/update.php';
      var response = await http.post(Uri.parse(url), body: {
        'farmer_ID': farmer_IDController.text,
        'username': usernameController.text,
        'password': passwordController.text,
      });
      var data = json.decode(response.body);
      print(data);
      if (data['status'] == "Success") {
        Fluttertoast.showToast(
          msg: "สำเร็จ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
      } else {
        Fluttertoast.showToast(
          msg: "ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      farmer_IDController.text = widget.list[widget.index]['farmer_ID'];
      usernameController.text = widget.list[widget.index]['username'];
      passwordController.text = widget.list[widget.index]['password'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูลผู้ใช้งาน'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: farmer_IDController,
                  decoration: InputDecoration(
                    labelText: 'รหัสผู้ใช้งาน',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                ),
                SizedBox(
                  height: 10,
                )

                ,TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'ชื่อผู้ใช้งาน',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'กรุณากรอกชื่อผู้ใช้งาน'),
                      MinLengthValidator(3,
                          errorText:
                              'ชื่อผู้ใช้งานต้องมีความยาวอย่างน้อย 3 ตัวอักษร'),
                      MaxLengthValidator(10,
                          errorText:
                              'ชื่อผู้ใช้งานต้องมีความยาวอย่างน้อย 10 ตัวอักษร'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: 'กรุณากรอกรหัสผ่าน'),
                      MinLengthValidator(3,
                          errorText:
                              'รหัสผ่านต้องมีความยาวอย่างน้อย 3 ตัวอักษร'),
                      MaxLengthValidator(10,
                          errorText:
                              'รหัสผ่านต้องมีความยาวอย่างน้อย 10 ตัวอักษร'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  child: Text(
                    'บันทึก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ShowEdit();
                      editUserv1();
                    });

                    ;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
