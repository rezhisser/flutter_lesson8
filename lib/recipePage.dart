import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lesson8/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(recipe.imgUrl)),
            Text(recipe.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(recipe.cookingTime, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(recipe.description, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
