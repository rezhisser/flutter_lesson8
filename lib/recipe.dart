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
}