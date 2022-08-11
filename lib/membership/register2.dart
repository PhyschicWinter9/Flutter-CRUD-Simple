import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
      appBar: AppBar(title: Text('User Registration Form')),
      body: Center(
        child: RegisterUser()
        )
      )
    );
}
}

class RegisterUser extends StatefulWidget {

RegisterUserState createState() => RegisterUserState();

}

class RegisterUserState extends State {

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;
  final formkey = GlobalKey<FormState>();

  // Getting value from TextField widget.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  // final passwordController = TextEditingController();

  String user_typevalue = 'ผู้ใช้ทั่วไป';

  // List of items in our dropdown menu
  var items = [
    'ผู้ใช้ทั่วไป',
    'ผู้ช่วย',
    'ผู้ดูแลระบบ',
    'เจ้าของ',
  ];

Future Registration() async{


  // Showing CircularProgressIndicator.
  setState(() {
  visible = true ; 
  });
  

  // Getting value from Controller
  String username = usernameController.text;
  String password = passwordController.text;
  // String password = passwordController.text;

  // SERVER API URL
  var url = 'https://meloned.relaxlikes.com/php/register.php';

  // Store all data with Param Name.
  var data = {'username': username, 'password': password, 'user_type' : user_typevalue};

  // Starting Web API Call.
  var response = await http.post(Uri.parse(url), body: json.encode(data));

  // Getting Server response into variable.
  var message = jsonDecode(response.body);

  // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
  setState(() {
    visible = false; 
  });
}

  // Showing Alert Dialog with Response JSON Message.
  showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text(message),
      actions: <Widget>[
        TextButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
  );

}

@override
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
                  DropdownButtonFormField(
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        user_typevalue = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'ประเภทผู้ใช้',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                      // setState(() {
                      //   visible = true;
                      //   Register();
                      // });
                      // Register();
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          visible = true;
                          Registration();
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