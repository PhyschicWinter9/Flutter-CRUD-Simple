import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PeriodScreen extends StatelessWidget {
  const PeriodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รอบการปลูก',
          style: GoogleFonts.kanit(),
        ),
      ),
      body: Container(),
    );
  }
}
