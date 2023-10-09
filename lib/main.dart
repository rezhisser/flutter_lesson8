import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lesson8/recipe.dart';
import 'permissionPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 8',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      //home:  MyHomePage(),
      home: PermissionPage(),
    );
  }
}

final List<Recipe> _data = [
  Recipe(
      imgUrl: '/storage/emulated/0/Download/strudel.jpg',
      name: 'ШТРУДЕЛЬ ІЗ КУРЯТИНОЮ, ГРИБАМИ ТА СИРОМ',
      cookingTime: 'Час приготування - 100 хв'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/Malinoviy_tort.jpg',
      name: 'НІЖНИЙ МАЛИНОВИЙ ТОРТ ІЗ МОРОЗИВОМ',
      cookingTime: 'Час приготування - 100 хв'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/child-cookie.jpg',
      name: 'ПРОСТЕ ПЕЧИВО З ЛИСТКОВОГО ТІСТА',
      cookingTime: 'Час приготування - 100 хв'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/oatmeal.jpg',
      name: 'ВІВСЯНА КАША З ЯГОДАМИ, ПЕРЕТЕРТИМИ ІЗ ЦУКРОМ',
      cookingTime: 'Час приготування - 100 хв'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/frittata.jpg',
      name: 'ОМЛЕТ З ОВОЧАМИ ТА ЗЕЛЕННЮ',
      cookingTime: 'Час приготування - 100 хв'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/mushrooms.jpg',
      // imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWthvP78Ij2eg7Aag6LMhkI9RESHg886RwG5ho-2ED&s',
      name: 'ЦВІТНА КАПУСТА З ГРИБАМИ І СИРОМ У ДУХОВЦІ',
      cookingTime: 'Час приготування - 150 хв'
  ),
  // ... додайте стільки елементів, скільки вам потрібно
];



class MyHomePage extends StatelessWidget {
  bool _showListView = true;

   MyHomePage({super.key});

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
      //body: _buildGridView()
      body: _showListView ? _buildListView() : _buildGridView(),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    setState(() {
    _showListView = !_showListView;
    });
    },
    child: Icon(
    _showListView ? Icons.grid_on : Icons.list,
    ),
    ),
      //_buildListView()
          /*
      ListView(
        children: <Widget>[
          ListTile(
            leading: Image.file(File('/storage/emulated/0/Download/091a1b0-fish-original.png')),
            title: Text('ШТРУДЕЛЬ ІЗ КУРЯТИНОЮ, ГРИБАМИ ТА СИРОМ'.toLowerCase()),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Час приготування - 100 хв'),
              ],
            ),
          ),
          ListTile(
            leading: Image.file(File('/storage/emulated/0/Download/mushrooms.jpg')),

          //  leading: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWthvP78Ij2eg7Aag6LMhkI9RESHg886RwG5ho-2ED&s'), // Вставте URL зображення товару
            title: Text('МАЛИНОВИЙ ТОРТ-МОРОЗИВО РЕЦЕПТ'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Час приготування - 150 хв'),
              ],
            ), // Підзаголовок з двома описами
          ),

          // Інші елементи списку
        ],
      ),
      */
    );
  }

  void setState(Null Function() param0) {}

}

ListView _buildListView() {
  return ListView.builder(
    itemCount: _data.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Image.file(File(_data[index].imgUrl)), // Зображення з URL
        title: Text(_data[index].name),
        subtitle: Text(_data[index].cookingTime),
      );
    },
  );
}

GridView _buildGridView() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) {
      return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.file(File(_data[index].imgUrl), height: 100, width: 100,)), // Зображення з URL
            Text(_data[index].name),
            Text(_data[index].cookingTime),
          ],
        ),
      );
    },
    itemCount: _data.length,
  );
}