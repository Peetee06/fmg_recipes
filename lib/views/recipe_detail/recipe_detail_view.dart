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
              child: ListView.builder(
                itemCount: recipe.ingredients.length,
                itemBuilder: (context, index) {
                  if (index == 0)
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
                        Text('Preparation Time: ${recipe.prepTime}'),
                        const SizedBox(height: 8.0),
                        Text('Total Time: ${recipe.totalTime}'),
                        const SizedBox(height: 16.0),
                        const Text('Description:'),
                        const SizedBox(height: 8.0),
                        Text(recipe.descriptionMarkdown),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                CircleAvatar(),
                                SizedBox(height: 8.0),
                                Text('Difficulty'),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(),
                                SizedBox(height: 8.0),
                                Text('prepTime\n+ totalTime'),
                                Text('10'),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print('pressed');
                              },
                              child: Text('Show Steps'),
                            ),
                          ],
                        )
                      ],
                    );
                  if (recipe.ingredients.isEmpty)
                    return const Text('No ingredients found');
                  return ListTile(
                    leading: const Icon(Icons.image),
                    title: Text(recipe.ingredients[index].ingredients.name),
                  );
                },
              ));
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
