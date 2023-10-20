import 'package:flutter/material.dart';

class SampleWidget extends StatefulWidget {
  const SampleWidget({super.key});

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data'),
      ],
    );
  }
}
