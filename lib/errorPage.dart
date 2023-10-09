import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('HUMAN Школа'),
          elevation: 3, // Встановіть значення елевації, яке вам потрібно
          shadowColor: Colors.blueGrey
      ),
      body: Center(
        child: Text('Щось пішло не так'),

        // Інші елементи списку
      ),
    );
  }

}