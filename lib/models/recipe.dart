import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String headline,
    required String description,
    required String difficulty,
    required String imagePath,
    required String name,
    required String prepTime,
    required String totalTime,
    required List<Cuisine> cuisines,
    required List<Ingredient> ingredients,
    required List<Tag> tags,
    required String steps,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class Cuisine with _$Cuisine {
  const factory Cuisine({
    required String id,
    required String name,
    required String imagePath,
    required String type,
  }) = _Cuisine;

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String id,
    required String name,
    required String imagePath,
    required String type,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String id,
    required String name,
    required String type,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

// @freezed
// class Step with _$Step {
//   const factory Step({
//     required int index,
//     required String instructionsMarkdown,
//     required List<String> ingredients,
//     required List<Images> images,
//     // You can add more fields like images if necessary
//   }) = _Step;
//   factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
// }

@freezed
class Images with _$Images {
  const factory Images({
    required String path,
    required String caption,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
