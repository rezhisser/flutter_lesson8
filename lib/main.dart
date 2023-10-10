import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lesson8/recipe.dart';
import 'permissionPage.dart';
import 'recipePage.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RecipeManager manager = RecipeManager();

  @override
  void initState() {
    super.initState();
    manager.initializeDefaultRecipes();

  }

  bool _showListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Рецепти'),
          elevation: 3, // Встановіть значення елевації, яке вам потрібно
          shadowColor: Colors.blueGrey),
      //body: _buildGridView()
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _showListView = !_showListView;
                    });
                  },
                  child: Icon(
                    _showListView ? Icons.grid_on : Icons.list,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: _showListView
                  ? _buildListView(manager)
                  : _buildGridView(manager)),
        ],
      ),
    );
  }
}

ListView _buildListView(RecipeManager manager) {
  return ListView.builder(
    itemCount: manager.recipes.length,
    itemBuilder: (context, index) {
      final item = manager.recipes[index];
      return Dismissible(
        key: ValueKey(item.id),
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        // Фон під ListTile при свайпі
        direction: DismissDirection.startToEnd,
        // Свайп тільки зліва направо
        onDismissed: (direction) {
          manager.deleteRecipeById(item.id); // Видаляємо рецепт за ID
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Рецепт ${item.name} видалено")),
          );
        },
        child: ListTile(
          leading: Image.file(File(item.imgUrl)), // Зображення з URL
          title: Text(item.name),
          subtitle: Text(item.cookingTime),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailPage(recipe: item),
              ),
            );
          },
        ),
      );
    },
  );
}

GridView _buildGridView(RecipeManager manager) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
    ),
    itemBuilder: (context, index) {
      return Card(
        child: Column(
          children: [
            Image.file(File(manager.recipes[index].imgUrl)),
            // Expanded(child: Image.file(File(manager.recipes[index].imgUrl), height: 180, width: 180,)),
            Text(manager.recipes[index].name),
            Text(manager.recipes[index].cookingTime),
          ],
        ),
      );
    },
    itemCount: manager.recipes.length,
  );
}
