import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meloned/membership/membership.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = false;
  final formkey = GlobalKey<FormState>();

  //Getting value from TextField widget.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future ShowLogin() async {
    print(usernameController.text);
    print(passwordController.text);
  }

  Future Login() async {
    var url = "https://meloned.relaxlikes.com/api/login.php";
    var response = await http.post(Uri.parse(url), body: {
      'username': usernameController.text,
      'password': passwordController.text,
    });
    var data = json.decode(response.body);
    print(data);

    if (data['status'] == "Success") {
      // data['user_type'];
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
          context, MaterialPageRoute(builder: (context) => HomeMembership()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ลงชื่อเข้าใช้ระบบ'),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'ชื่อผู้ใช้',
                      hintText: 'ชื่อผู้ใช้',
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกชื่อผู้ใช้'),
                      MinLengthValidator(3,
                          errorText: 'ชื่อผู้ใช้ต้องมีอย่างน้อย 3 ตัวอักษร'),
                      MaxLengthValidator(20,
                          errorText: 'ชื่อผู้ใช้ต้องมีอย่างน้อย 20 ตัวอักษร'),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                      hintText: 'รหัสผ่าน',
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกรหัสผ่าน'),
                      MinLengthValidator(6,
                          errorText: 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'),
                      MaxLengthValidator(20,
                          errorText: 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(
                      'เข้าสู่ระบบ',
                      style: GoogleFonts.kanit(),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          // visible = true;
                          // Register();
                          // RegShow();
                          Login();
                          // ShowLogin();
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: visible,
                    child: CircularProgressIndicator(),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}
