import 'package:flutter/material.dart';

class Heading1 extends StatelessWidget {
  String str;

  Heading1({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 6, 20, 88),
      ),
    );
  }
}
