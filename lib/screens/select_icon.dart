import 'package:flutter/material.dart';

class SelectIcon extends StatelessWidget {
  const SelectIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 65, 58, 161),
      body: Center(
        child: Column(
          children: [
            Image.asset('asset/images/logo.png'),
          ],
        ),
      ),
    );
  }
}