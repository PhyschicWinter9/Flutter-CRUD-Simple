import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;
  final formkey = GlobalKey<FormState>();

  // Getting value from TextField widget.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Initial Selected Value
  String user_typevalue = 'ผู้ใช้ทั่วไป';

  // List of items in our dropdown menu
  var items = [
    'ผู้ใช้ทั่วไป',
    'ผู้ช่วย',
    'ผู้ดูแลระบบ',
    'เจ้าของ',
  ];

  Future RegShow() async {
    print(usernameController.text);
    print(passwordController.text);
  }

  Future Register() async {
    var url = "https://meloned.relaxlikes.com/api/v0/register.php";

    var response = await http.post(Uri.parse(url), body: {
      'username': usernameController.text,
      'password': passwordController.text,
    });

    var jsonData = json.decode(response.body);
    print(jsonData);

    if (jsonData == "Error") {
      Fluttertoast.showToast(
        msg: "ชื่อผู้ใช้งานซ้ำ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "สมัครสมาชิกสำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สร้างบัญชี',
          style: GoogleFonts.kanit(),
        ),
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
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกชื่อผู้ใช้'),
                      MinLengthValidator(6,
                          errorText:
                              'ชื่อผู้ใช้ต้องมีความยาวอย่างน้อย 6 ตัวอักษร'),
                      MaxLengthValidator(20,
                          errorText:
                              'ชื่อผู้ใช้ต้องมีความยาวไม่เกิน 20 ตัวอักษร'),
                    ]),
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'ชื่อผู้ใช้',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'กรุณากรอกรหัสผ่าน'),
                      MinLengthValidator(6,
                          errorText:
                              'รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร'),
                      MaxLengthValidator(20,
                          errorText:
                              'รหัสผ่านต้องมีความยาวไม่เกิน 20 ตัวอักษร'),
                    ]),
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: visible,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(
                      'สร้างบัญชี',
                      style: GoogleFonts.kanit(),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          // visible = true;
                          Register();
                          // RegShow();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
