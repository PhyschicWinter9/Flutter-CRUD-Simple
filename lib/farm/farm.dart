import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meloned/farm/period/period.dart';


class FarmHomeScreen extends StatelessWidget {
  const FarmHomeScreen({Key? key}) : super(key: key);

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 100, 10, 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/meloned_logo2.png'),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return PeriodScreen();
                      })));
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      'รอบการปลูก',
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                      ),
                    )),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: ((context) {
              //           return LoginScreen();
              //         })));
              //       },
              //       icon: Icon(Icons.login),
              //       label: Text(
              //         'เข้าสู่ระบบ',
              //         style: GoogleFonts.kanit(
              //           fontSize: 20,
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: ((context) {
              //           return EditProfileScreen();
              //         })));
              //       },
              //       icon: Icon(Icons.edit),
              //       label: Text(
              //         'แก้ไขข้อมูลส่วนตัว',
              //         style: GoogleFonts.kanit(
              //           fontSize: 20,
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: ((context) {
              //           return DeleteProfileScreen();
              //         })));
              //       },
              //       icon: Icon(Icons.delete),
              //       label: Text(
              //         'ลบบัญชีผู้ใช้',
              //         style: GoogleFonts.kanit(
              //           fontSize: 20,
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton.icon(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: ((context) {
              //           return ViewProfileScreen();
              //         })));
              //       },
              //       icon: Icon(Icons.person),
              //       label: Text(
              //         'แสดงข้อมูลสมาชิก',
              //         style: GoogleFonts.kanit(
              //           fontSize: 20,
              //         ),
              //       )),
              // )
            ],
          ),
        ),
      ),
    );
  }

}