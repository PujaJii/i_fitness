import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Coming soon...', style: TextStyle(fontSize: 20,color: Colors.blue)),
        ),
      ),
    );
  }
}
