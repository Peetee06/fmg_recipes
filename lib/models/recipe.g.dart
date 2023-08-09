// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as String,
      headline: json['headline'] as String,
      descriptionMarkdown: json['descriptionMarkdown'] as String,
      difficulty: json['difficulty'] as int,
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      prepTime: json['prepTime'] as String,
      totalTime: json['totalTime'] as String,
      cuisines: (json['cuisines'] as List<dynamic>)
          .map((e) => Cuisines.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: json['steps'] as String,
      yields_json: json['yields_json'] as String,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'descriptionMarkdown': instance.descriptionMarkdown,
      'difficulty': instance.difficulty,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'prepTime': instance.prepTime,
      'totalTime': instance.totalTime,
      'cuisines': instance.cuisines,
      'ingredients': instance.ingredients,
      'tags': instance.tags,
      'steps': instance.steps,
      'yields_json': instance.yields_json,
    };

_$_Cuisines _$$_CuisinesFromJson(Map<String, dynamic> json) => _$_Cuisines(
      cuisines: Cuisine.fromJson(json['cuisines'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CuisinesToJson(_$_Cuisines instance) =>
    <String, dynamic>{
      'cuisines': instance.cuisines,
    };

_$_Cuisine _$$_CuisineFromJson(Map<String, dynamic> json) => _$_Cuisine(
      id: json['id'] as String,
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_CuisineToJson(_$_Cuisine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'type': instance.type,
    };

_$_Ingredients _$$_IngredientsFromJson(Map<String, dynamic> json) =>
    _$_Ingredients(
      ingredients:
          Ingredient.fromJson(json['ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_IngredientsToJson(_$_Ingredients instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
    };

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'type': instance.type,
    };

_$_Tags _$$_TagsFromJson(Map<String, dynamic> json) => _$_Tags(
      tags: Tag.fromJson(json['tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TagsToJson(_$_Tags instance) => <String, dynamic>{
      'tags': instance.tags,
    };

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

_$_Images _$$_ImagesFromJson(Map<String, dynamic> json) => _$_Images(
      path: json['path'] as String,
      caption: json['caption'] as String,
    );

Map<String, dynamic> _$$_ImagesToJson(_$_Images instance) => <String, dynamic>{
      'path': instance.path,
      'caption': instance.caption,
    };
