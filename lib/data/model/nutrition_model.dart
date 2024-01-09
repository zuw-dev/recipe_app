// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

// nutrition_item.dart

class NutritionModel {
  final String name;
  final double calories;
  final double serving_size_g;
  final double fat_total_g;
  final double fat_saturated_g;
  final double protein_g;
  final double sodium_mg;
  final double potassium_mg;
  final double cholesterol_mg;
  final double carbohydrates_total_g;
  final double fiber_g;
  final double sugar_g;
  NutritionModel({
    required this.name,
    required this.calories,
    required this.serving_size_g,
    required this.fat_total_g,
    required this.fat_saturated_g,
    required this.protein_g,
    required this.sodium_mg,
    required this.potassium_mg,
    required this.cholesterol_mg,
    required this.carbohydrates_total_g,
    required this.fiber_g,
    required this.sugar_g,
  });

  NutritionModel copyWith({
    String? name,
    double? calories,
    double? serving_size_g,
    double? fat_total_g,
    double? fat_saturated_g,
    double? protein_g,
    double? sodium_mg,
    double? potassium_mg,
    double? cholesterol_mg,
    double? carbohydrates_total_g,
    double? fiber_g,
    double? sugar_g,
  }) {
    return NutritionModel(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      serving_size_g: serving_size_g ?? this.serving_size_g,
      fat_total_g: fat_total_g ?? this.fat_total_g,
      fat_saturated_g: fat_saturated_g ?? this.fat_saturated_g,
      protein_g: protein_g ?? this.protein_g,
      sodium_mg: sodium_mg ?? this.sodium_mg,
      potassium_mg: potassium_mg ?? this.potassium_mg,
      cholesterol_mg: cholesterol_mg ?? this.cholesterol_mg,
      carbohydrates_total_g:
          carbohydrates_total_g ?? this.carbohydrates_total_g,
      fiber_g: fiber_g ?? this.fiber_g,
      sugar_g: sugar_g ?? this.sugar_g,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'calories': calories,
      'serving_size_g': serving_size_g,
      'fat_total_g': fat_total_g,
      'fat_saturated_g': fat_saturated_g,
      'protein_g': protein_g,
      'sodium_mg': sodium_mg,
      'potassium_mg': potassium_mg,
      'cholesterol_mg': cholesterol_mg,
      'carbohydrates_total_g': carbohydrates_total_g,
      'fiber_g': fiber_g,
      'sugar_g': sugar_g,
    };
  }

  factory NutritionModel.fromMap(Map<String, dynamic> map) {
    return NutritionModel(
      name: map['name'] as String,
      calories: map['calories'] as double,
      serving_size_g: map['serving_size_g'] as double,
      fat_total_g: map['fat_total_g'] as double,
      fat_saturated_g: map['fat_saturated_g'] as double,
      protein_g: map['protein_g'] as double,
      sodium_mg: map['sodium_mg'] as double,
      potassium_mg: map['potassium_mg'] as double,
      cholesterol_mg: map['cholesterol_mg'] as double,
      carbohydrates_total_g: map['carbohydrates_total_g'] as double,
      fiber_g: map['fiber_g'] as double,
      sugar_g: map['sugar_g'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory NutritionModel.fromJson(String source) =>
      NutritionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NutritionModel(name: $name, calories: $calories, serving_size_g: $serving_size_g, fat_total_g: $fat_total_g, fat_saturated_g: $fat_saturated_g, protein_g: $protein_g, sodium_mg: $sodium_mg, potassium_mg: $potassium_mg, cholesterol_mg: $cholesterol_mg, carbohydrates_total_g: $carbohydrates_total_g, fiber_g: $fiber_g, sugar_g: $sugar_g)';
  }

  @override
  bool operator ==(covariant NutritionModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.calories == calories &&
        other.serving_size_g == serving_size_g &&
        other.fat_total_g == fat_total_g &&
        other.fat_saturated_g == fat_saturated_g &&
        other.protein_g == protein_g &&
        other.sodium_mg == sodium_mg &&
        other.potassium_mg == potassium_mg &&
        other.cholesterol_mg == cholesterol_mg &&
        other.carbohydrates_total_g == carbohydrates_total_g &&
        other.fiber_g == fiber_g &&
        other.sugar_g == sugar_g;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        calories.hashCode ^
        serving_size_g.hashCode ^
        fat_total_g.hashCode ^
        fat_saturated_g.hashCode ^
        protein_g.hashCode ^
        sodium_mg.hashCode ^
        potassium_mg.hashCode ^
        cholesterol_mg.hashCode ^
        carbohydrates_total_g.hashCode ^
        fiber_g.hashCode ^
        sugar_g.hashCode;
  }
}
