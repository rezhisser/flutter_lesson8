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

final List<Recipe> _data = [
  Recipe(
      imgUrl: '/storage/emulated/0/Download/strudel.jpg',
      name: 'ШТРУДЕЛЬ ІЗ КУРЯТИНОЮ, ГРИБАМИ ТА СИРОМ',
      cookingTime: 'Час приготування - 100 хв',
      description: 'Запашний штрудель із курятиною та грибами — ситна версія популярної страви, яку подарували світу австрійці. Соковита пропечена начинка, загорнута в тонке хрустке тісто: цей апетитний пиріг — ідеальний до обіду чи на перекус.'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/Malinoviy_tort.jpg',
      name: 'НІЖНИЙ МАЛИНОВИЙ ТОРТ ІЗ МОРОЗИВОМ',
      cookingTime: 'Час приготування - 100 хв',
      description: 'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.'

  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/child-cookie.jpg',
      name: 'ПРОСТЕ ПЕЧИВО З ЛИСТКОВОГО ТІСТА',
      cookingTime: 'Час приготування - 100 хв',
      description: 'Щасливе дитинство важко уявити без аромату свіжої домашньої випічки. Якщо колись для випікання смаколиків доводилося годинами стояти на кухні, сучасний темп життя диктує інші правила.'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/oatmeal.jpg',
      name: 'ВІВСЯНА КАША З ЯГОДАМИ, ПЕРЕТЕРТИМИ ІЗ ЦУКРОМ',
      cookingTime: 'Час приготування - 100 хв',
      description: 'Вівсяна каша — мабуть, найкращий вибір для дитячого сніданку. Вона містить повільні вуглеводи, які, поступово засвоюючись, забезпечують організм енергією. Фосфор і кальцій зміцнюють опорну систему, йод підвищує розумову активність.'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/frittata.jpg',
      name: 'ОМЛЕТ З ОВОЧАМИ ТА ЗЕЛЕННЮ',
      cookingTime: 'Час приготування - 100 хв',
      description: 'Пишний, з ніжним молочним смаком і соковитою овочевою начинкою, омлет — король сніданків. Потіште своїх дітей цією поживною стравою зранку — в ній багато білку і цілий комплекс вітамінів, які заряджають енергією, дозволяючи довго не відчувати голоду. А якщо хочеться додати страві оригінальності, готуйте омлет в духовці у формочках для кексів.'
  ),
  Recipe(
      imgUrl: '/storage/emulated/0/Download/mushrooms.jpg',
      // imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWthvP78Ij2eg7Aag6LMhkI9RESHg886RwG5ho-2ED&s',
      name: 'ЦВІТНА КАПУСТА З ГРИБАМИ І СИРОМ У ДУХОВЦІ',
      cookingTime: 'Час приготування - 150 хв',
      description: 'Запечена цвітна капуста з грибами достатньо ситна страва, тому її можна подавати і самостійно, і як гарнір до м’яса чи риби.'
  ),
  // ... додайте стільки елементів, скільки вам потрібно
];


class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
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
          Expanded(child: _showListView ? _buildListView() : _buildGridView()),
        ],
      ),
    );
  }
  }

ListView _buildListView() {
  return ListView.builder(
    itemCount: _data.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Image.file(File(_data[index].imgUrl)), // Зображення з URL
        title: Text(_data[index].name),
        subtitle: Text(_data[index].cookingTime),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailPage(recipe: _data[index]),
            ),
          );
        },
      );
    },
  );
}
/*
ListView _buildListView() {
  return ListView.builder(
    itemCount: _data.length,
    itemBuilder: (context, index) {
      final item = _data[index];
      return Dismissible(
        key: ValueKey(item.imgUrl),  // Важливо: Кожен Dismissible повинен мати унікальний ключ
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),  // Фон під ListTile при свайпі
        direction: DismissDirection.startToEnd, // Свайп тільки зліва направо
        onDismissed: (direction) {
          setState(() {
            _data.removeAt(index);
          });
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
*/
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