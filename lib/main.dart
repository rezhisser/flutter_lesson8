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
    Recipe recipe1 = Recipe(
        id: 1,
        imgUrl: '/storage/emulated/0/Download/strudel.jpg',
        name: 'ШТРУДЕЛЬ ІЗ КУРЯТИНОЮ, ГРИБАМИ ТА СИРОМ',
        cookingTime: 'Час приготування - 100 хв',
        description: 'Запашний штрудель із курятиною та грибами — ситна версія популярної страви, яку подарували світу австрійці. Соковита пропечена начинка, загорнута в тонке хрустке тісто: цей апетитний пиріг — ідеальний до обіду чи на перекус.'
    );
    Recipe recipe2 = Recipe(
        id: 2,
        imgUrl: '/storage/emulated/0/Download/Malinoviy_tort.jpg',
        name: 'НІЖНИЙ МАЛИНОВИЙ ТОРТ ІЗ МОРОЗИВОМ',
        cookingTime: 'Час приготування - 100 хв',
        description: 'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.'
    );
    Recipe recipe3 = Recipe(
        id: 3,
        imgUrl: '/storage/emulated/0/Download/child-cookie.jpg',
        name: 'ПРОСТЕ ПЕЧИВО З ЛИСТКОВОГО ТІСТА',
        cookingTime: 'Час приготування - 100 хв',
        description: 'Щасливе дитинство важко уявити без аромату свіжої домашньої випічки. Якщо колись для випікання смаколиків доводилося годинами стояти на кухні, сучасний темп життя диктує інші правила.'
    );
    Recipe recipe4 = Recipe(
        id: 4,
        imgUrl: '/storage/emulated/0/Download/oatmeal.jpg',
        name: 'ВІВСЯНА КАША З ЯГОДАМИ, ПЕРЕТЕРТИМИ ІЗ ЦУКРОМ',
        cookingTime: 'Час приготування - 100 хв',
        description: 'Вівсяна каша — мабуть, найкращий вибір для дитячого сніданку. Вона містить повільні вуглеводи, які, поступово засвоюючись, забезпечують організм енергією. Фосфор і кальцій зміцнюють опорну систему, йод підвищує розумову активність.'
    );
    Recipe recipe5 = Recipe(
        id: 2,
        imgUrl: '/storage/emulated/0/Download/Malinoviy_tort.jpg',
        name: 'НІЖНИЙ МАЛИНОВИЙ ТОРТ ІЗ МОРОЗИВОМ',
        cookingTime: 'Час приготування - 100 хв',
        description: 'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.'
    );
    Recipe recipe6 = Recipe(
        id: 2,
        imgUrl: '/storage/emulated/0/Download/Malinoviy_tort.jpg',
        name: 'НІЖНИЙ МАЛИНОВИЙ ТОРТ ІЗ МОРОЗИВОМ',
        cookingTime: 'Час приготування - 100 хв',
        description: 'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.'
    );

    manager.addRecipe(recipe1);
    manager.addRecipe(recipe2);
    manager.addRecipe(recipe3);
    manager.addRecipe(recipe4);
    manager.addRecipe(recipe5);
    manager.addRecipe(recipe6);  }
  bool _showListView = true;

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
          Expanded(child: _showListView ? _buildListView(manager) : _buildGridView(manager)),
        ],
      ),
    );
  }
  }

  /*
ListView _buildListView(RecipeManager manager) {

  return ListView.builder(
    itemCount: manager.recipes.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Image.file(File(manager.recipes[index].imgUrl)), // Зображення з URL
        title: Text(manager.recipes[index].name),
        subtitle: Text(manager.recipes[index].cookingTime),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailPage(recipe: manager.recipes[index]),
            ),
          );
        },
      );
    },
  );
}


   */

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
        ),  // Фон під ListTile при свайпі
        direction: DismissDirection.startToEnd, // Свайп тільки зліва направо
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
    ),
    itemBuilder: (context, index) {
      return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.file(File(manager.recipes[index].imgUrl), height: 180, width: 180,)),
            Text(manager.recipes[index].name),
            Text(manager.recipes[index].cookingTime),
          ],
        ),
      );
    },
    itemCount: manager.recipes.length,
  );
}