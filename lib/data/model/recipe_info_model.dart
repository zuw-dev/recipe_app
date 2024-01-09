// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/model/extended_ing_model.dart';

class RecipeInfo {
  int? id;
  String? title;
  List<ExtendedIngredients>? extendedIngredients;
  String? instructions;
  String? image;
  String? imageType;
  int? readyInMinutes;
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  int? servings;
  RecipeInfo({
    this.id,
    this.title,
    this.extendedIngredients,
    this.instructions,
    this.image,
    this.imageType,
    this.readyInMinutes,
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.servings,
  });

  RecipeInfo copyWith({
    int? id,
    String? title,
    List<ExtendedIngredients>? extendedIngredients,
    String? instructions,
    String? image,
    String? imageType,
    int? readyInMinutes,
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    int? servings,
  }) {
    return RecipeInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      extendedIngredients: extendedIngredients ?? this.extendedIngredients,
      instructions: instructions ?? this.instructions,
      image: image ?? this.image,
      imageType: imageType ?? this.imageType,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      vegetarian: vegetarian ?? this.vegetarian,
      vegan: vegan ?? this.vegan,
      glutenFree: glutenFree ?? this.glutenFree,
      servings: servings ?? this.servings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'extendedIngredients':
          extendedIngredients!.map((x) => x.toMap()).toList(),
      'instructions': instructions,
      'image': image,
      'imageType': imageType,
      'readyInMinutes': readyInMinutes,
      'vegetarian': vegetarian,
      'vegan': vegan,
      'glutenFree': glutenFree,
      'servings': servings,
    };
  }

  factory RecipeInfo.fromMap(Map<String, dynamic> map) {
    return RecipeInfo(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      extendedIngredients: map['extendedIngredients'] != null
          ? List<ExtendedIngredients>.from(
              ((map['extendedIngredients'] ?? []) as List<dynamic>)
                  .map<ExtendedIngredients?>(
                (x) => ExtendedIngredients.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      instructions:
          map['instructions'] != null ? map['instructions'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      imageType: map['imageType'] != null ? map['imageType'] as String : null,
      readyInMinutes:
          map['readyInMinutes'] != null ? map['readyInMinutes'] as int : null,
      vegetarian: map['vegetarian'] != null ? map['vegetarian'] as bool : null,
      vegan: map['vegan'] != null ? map['vegan'] as bool : null,
      glutenFree: map['glutenFree'] != null ? map['glutenFree'] as bool : null,
      servings: map['servings'] != null ? map['servings'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeInfo.fromJson(String source) =>
      RecipeInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecipeInfo(id: $id, title: $title, extendedIngredients: $extendedIngredients, instructions: $instructions, image: $image, imageType: $imageType, readyInMinutes: $readyInMinutes, vegetarian: $vegetarian, vegan: $vegan, glutenFree: $glutenFree, servings: $servings)';
  }

  @override
  bool operator ==(covariant RecipeInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        listEquals(other.extendedIngredients, extendedIngredients) &&
        other.instructions == instructions &&
        other.image == image &&
        other.imageType == imageType &&
        other.readyInMinutes == readyInMinutes &&
        other.vegetarian == vegetarian &&
        other.vegan == vegan &&
        other.glutenFree == glutenFree &&
        other.servings == servings;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        extendedIngredients.hashCode ^
        instructions.hashCode ^
        image.hashCode ^
        imageType.hashCode ^
        readyInMinutes.hashCode ^
        vegetarian.hashCode ^
        vegan.hashCode ^
        glutenFree.hashCode ^
        servings.hashCode;
  }
}
