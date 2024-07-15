import 'package:flutter/material.dart';

class Capa extends Widget {
  const Capa({super.key});

  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 20,
      color: Colors.blue,
    );
  }
  
  @override
  Element createElement() {
    throw UnimplementedError();
  }
}