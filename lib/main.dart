import 'package:flutter/material.dart';
import 'package:meloned/membership/membership.dart';


void main(){
  runApp(Meloned());
}


class Meloned  extends StatelessWidget {
  const Meloned ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeMembership(),
    );
  }
}