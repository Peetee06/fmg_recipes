import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/providers/recipe_provider.dart';

class RecipeDetailView extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailView({super.key, required this.recipeId});

  double getYieldAmountForIngredient(
      List<dynamic> yields, String ingredientId) {
    for (var yield in yields) {
      for (var ingredient in yield['ingredients']) {
        if (ingredient['id'] == ingredientId) {
          return ingredient['amount'] == null
              ? -1.0
              : ingredient['amount'].toDouble();
        }
      }
    }
    return -1.0; // return default value if ingredient id is not found
  }

  int parseTime(String timeString) {
    final time = timeString.substring(2, timeString.length - 1);
    return int.parse(time);
  }

  Icon getDifficultyIcon(int difficulty) {
    switch (difficulty) {
      case 0:
        return const Icon(Icons.star, color: Colors.green);
      case 1:
        return const Icon(Icons.star, color: Colors.green);
      case 2:
        return const Icon(Icons.star, color: Colors.yellow);
      default:
        return const Icon(Icons.star, color: Colors.red);
    }
  }

  void _showStepsModal(BuildContext context, List<dynamic> steps) {
    showModalBottomSheet(
      showDragHandle: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.image),
              subtitle: Text(steps[index]['instructionsMarkdown']),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsyncValue = ref.watch(recipeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Details')),
      body: recipesAsyncValue.when(
        data: (recipes) {
          final recipe = recipes.firstWhere((r) => r.id == recipeId);
          final yields = json.decode(recipe.yields_json);

          final prepTime = parseTime(recipe.prepTime);
          final totalTime = parseTime(recipe.totalTime);
          final fullTime = prepTime + totalTime;

          final difficultyIcon = getDifficultyIcon(recipe.difficulty);

          final steps = json.decode(recipe.steps);

          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: recipe.ingredients.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.image),
                        // Image.network(
                        //     recipe.imagePath), // Assuming images are hosted online
                        const SizedBox(height: 16.0),
                        Text(recipe.name,
                            style: const TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8.0),
                        Text(recipe.headline),
                        const SizedBox(height: 8.0),
                        Text(recipe.descriptionMarkdown),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                difficultyIcon,
                                const SizedBox(height: 8.0),
                                const Text('Difficulty'),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.timer),
                                const SizedBox(height: 8.0),
                                Text(fullTime.toString()),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showStepsModal(context, steps);
                              },
                              child: const Text('Show Steps'),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                  if (recipe.ingredients.isEmpty) {
                    return const Text('No ingredients found');
                  }
                  return ListTile(
                      leading: const Icon(Icons.image),
                      title: Text(recipe.ingredients[index].ingredients.name),
                      subtitle: Text(
                        getYieldAmountForIngredient(yields,
                                recipe.ingredients[index].ingredients.id)
                            .toString(),
                      ));
                },
              ));
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
