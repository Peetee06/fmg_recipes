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
              // leading: const Icon(Icons.image),
              leading: Image.network(
                  'https://img.hellofresh.com/w_300/hellofresh_s3${recipe.imagePath}'), // Assuming images are hosted online
              onTap: () {
                // Navigate to recipe detail view when tapped
                String path = '/recipe/${recipe.id}';
                Beamer.of(context).beamToNamed(path);
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
