class Recipe {
  final int id;
  final String imgUrl;
  final String name;
  final String cookingTime;
  final String description;


  Recipe({required this.id, required this.imgUrl, required this.name, required this.cookingTime, required this.description});

}

class RecipeManager {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  // Додати рецепт до списку
  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
  }

  // Видалити рецепт зі списку за ID
  void deleteRecipeById(int id) {
    _recipes.removeWhere((recipe) => recipe.id == id);
  }

  // Додати кілька рецептів одразу
  void addMultipleRecipes(List<Recipe> recipesList) {
    _recipes.addAll(recipesList);
  }
  // Ініціалізація деяких стандартних рецептів
  void initializeDefaultRecipes() {
    Recipe recipe1 = Recipe(
        id: 1,
        imgUrl: '/storage/emulated/0/Download/strudel.jpg',
        name: 'ШТРУДЕЛЬ ІЗ КУРЯТИНОЮ, ГРИБАМИ ТА СИРОМ',
        cookingTime: 'Час приготування - 100 хв',
        description:
        'Запашний штрудель із курятиною та грибами — ситна версія популярної страви, яку подарували світу австрійці. Соковита пропечена начинка, загорнута в тонке хрустке тісто: цей апетитний пиріг — ідеальний до обіду чи на перекус.');
    Recipe recipe2 = Recipe(
        id: 2,
        imgUrl: '/storage/emulated/0/Download/Malinoviy_tort.jpg',
        name: 'НІЖНИЙ МАЛИНОВИЙ ТОРТ ІЗ МОРОЗИВОМ',
        cookingTime: 'Час приготування - 100 хв',
        description:
        'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.');
    Recipe recipe3 = Recipe(
        id: 3,
        imgUrl: '/storage/emulated/0/Download/child-cookie.jpg',
        name: 'ПРОСТЕ ПЕЧИВО З ЛИСТКОВОГО ТІСТА',
        cookingTime: 'Час приготування - 100 хв',
        description:
        'Щасливе дитинство важко уявити без аромату свіжої домашньої випічки. Якщо колись для випікання смаколиків доводилося годинами стояти на кухні, сучасний темп життя диктує інші правила.');
    Recipe recipe4 = Recipe(
        id: 4,
        imgUrl: '/storage/emulated/0/Download/oatmeal.jpg',
        name: 'ВІВСЯНА КАША З ЯГОДАМИ, ПЕРЕТЕРТИМИ ІЗ ЦУКРОМ',
        cookingTime: 'Час приготування - 100 хв',
        description:
        'Вівсяна каша — мабуть, найкращий вибір для дитячого сніданку. Вона містить повільні вуглеводи, які, поступово засвоюючись, забезпечують організм енергією. Фосфор і кальцій зміцнюють опорну систему, йод підвищує розумову активність.');
    Recipe recipe5 = Recipe(
        id: 5,
        imgUrl: '/storage/emulated/0/Download/frittata.jpg',
        name: 'ОМЛЕТ З ОВОЧАМИ ТА ЗЕЛЕННЮ',
        cookingTime: 'Час приготування - 100 хв',
        description:
        'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.');
    Recipe recipe6 = Recipe(
        id: 6,
        imgUrl: '/storage/emulated/0/Download/mushrooms.jpg',
        name: 'ЦВІТНА КАПУСТА З ГРИБАМИ І СИРОМ У ДУХОВЦІ',
        cookingTime: 'Час приготування - 100 хв',
        description:
        'Малиновий торт-морозиво — це вишукане поєднання ніжного вершкового морозива й ароматної малини на основі з хрусткого пісочного печива. Прекрасний варіант, коли хочеться кинути виклик традиційним десертам і приготувати щось незвичайне! Десерт не тільки легкий і чудово освіжає, але й має ефектний вигляд: улюблені ягоди на білосніжній подушці з морозива створюють неймовірно апетитний контраст кольорів.');

    addMultipleRecipes([recipe1, recipe2, recipe3, recipe4, recipe5, recipe6]);
  }
}