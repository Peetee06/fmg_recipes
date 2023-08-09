import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:recipes/views/home/home_view.dart';
import 'package:recipes/views/recipe_detail/recipe_detail_view.dart';

final beamerRouter = BeamerDelegate(
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      Locations(),
    ],
  ),
);

class Locations extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/', '/recipe/:recipeId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('home'),
        child: HomeView(),
      ),
      if (state.uri.pathSegments.contains('recipe') &&
          state.pathParameters.containsKey('recipeId'))
        BeamPage(
          key: ValueKey('recipe-${state.pathParameters['recipeId']}'),
          child: RecipeDetailView(
            recipeId: state.pathParameters['recipeId']!,
          ),
        ),
    ];
  }
}
