import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/providers/recipe_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsyncValue = ref.watch(recipeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hallo user')),
      body: recipesAsyncValue.when(
        data: (recipes) => ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return ListTile(
              title: Text(recipe.name),
              subtitle: Text(recipe.headline),
              leading: Image.network(
                  recipe.imagePath), // Assuming images are hosted online
              onTap: () {
                // Navigate to recipe detail view when tapped
                Beamer.of(context).beamToNamed('/recipe/${recipe.id}');
              },
            );
          },
        ),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
