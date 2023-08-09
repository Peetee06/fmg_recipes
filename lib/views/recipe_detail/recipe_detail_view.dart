import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/providers/recipe_provider.dart';

class RecipeDetailView extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailView({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsyncValue = ref.watch(recipeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Details')),
      body: recipesAsyncValue.when(
        data: (recipes) {
          final recipe = recipes.firstWhere((r) => r.id == recipeId);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    recipe.imagePath), // Assuming images are hosted online
                const SizedBox(height: 16.0),
                Text(recipe.name,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Text('Preparation Time: ${recipe.prepTime}'),
                const SizedBox(height: 8.0),
                Text('Total Time: ${recipe.totalTime}'),
                const SizedBox(height: 16.0),
                const Text('Description:'),
                const SizedBox(height: 8.0),
                Text(recipe.description),
                // Add more details like ingredients, steps, etc. as needed
              ],
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
