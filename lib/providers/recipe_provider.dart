import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recipes/models/recipe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recipeProvider = FutureProvider<List<Recipe>>((ref) async {
  return await fetchRecipes();
});

Future<List<Recipe>> fetchRecipes() async {
  // Load the parsed JSON file
  final String jsonString =
      await rootBundle.loadString('assets/example_my_recipe.json');
  final List<dynamic> jsonList = json.decode(jsonString)['data']['recipes'];
  return jsonList.map((json) => Recipe.fromJson(json)).toList();
}
