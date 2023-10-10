import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'errorPage.dart';
import 'main.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Рецепти'),
          elevation: 3, // Встановіть значення елевації, яке вам потрібно
          shadowColor: Colors.blueGrey
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Запит дозволу на читання зовнішнього сховища
            final status = await Permission.photos.request();
            if (status.isGranted) {
              // Перехід на другий екран при натисканні на кнопку
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
            } else {
              // Перехід на другий екран помилки
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ErrorPage(),
              ));
            }
          },
          child: Text('Запитати дозвіл на читання зовнішнього сховища'),
        ),

        // Інші елементи списку
      ),
    );
  }

}