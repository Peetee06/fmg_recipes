import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String headline,
    required String descriptionMarkdown,
    required int difficulty,
    required String imagePath,
    required String name,
    required String prepTime,
    required String totalTime,
    required List<Cuisines> cuisines,
    required List<Ingredients> ingredients,
    required List<Tags> tags,
    required String steps,
    required String yields_json,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class Cuisines with _$Cuisines {
  const factory Cuisines({
    required Cuisine cuisines,
  }) = _Cuisines;

  factory Cuisines.fromJson(Map<String, dynamic> json) =>
      _$CuisinesFromJson(json);
}

@freezed
class Cuisine with _$Cuisine {
  const factory Cuisine({
    required String id,
    required String name,
    required String iconPath,
    required String type,
  }) = _Cuisine;

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);
}

@freezed
class Ingredients with _$Ingredients {
  const factory Ingredients({
    required Ingredient ingredients,
  }) = _Ingredients;

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String id,
    required String name,
    required String? imagePath,
    required String type,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@freezed
class Tags with _$Tags {
  const factory Tags({
    required Tag tags,
  }) = _Tags;

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
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

@freezed
class Images with _$Images {
  const factory Images({
    required String path,
    required String caption,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
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

// @freezed
// class Steps with _$Steps {
//   const factory Steps({
//     required List<Step> steps,
//   }) = _Steps;

//   factory Steps.fromJson(Map<String, dynamic> json) => _$StepsFromJson(json);
// }
