// nutrition_item.dart

class NutritionItem {
  final String name;
  final double calories;
  final double servingSize;
  final double fatTotal;
  final double fatSaturated;
  final double protein;
  final double sodium;
  final double potassium;
  final double cholesterol;
  final double carbohydratesTotal;
  final double fiber;
  final double sugar;

  NutritionItem({
    required this.name,
    required this.calories,
    required this.servingSize,
    required this.fatTotal,
    required this.fatSaturated,
    required this.protein,
    required this.sodium,
    required this.potassium,
    required this.cholesterol,
    required this.carbohydratesTotal,
    required this.fiber,
    required this.sugar,
  });

  factory NutritionItem.fromJson(Map<String, dynamic> json) {
    return NutritionItem(
      name: json['name'] ?? '',
      calories: (json['calories'] ?? 0.0).toDouble(),
      servingSize: (json['serving_size_g'] ?? 0.0).toDouble(),
      fatTotal: (json['fat_total_g'] ?? 0.0).toDouble(),
      fatSaturated: (json['fat_saturated_g'] ?? 0.0).toDouble(),
      protein: (json['protein_g'] ?? 0.0).toDouble(),
      sodium: (json['sodium_mg'] ?? 0.0).toDouble(),
      potassium: (json['potassium_mg'] ?? 0.0).toDouble(),
      cholesterol: (json['cholesterol_mg'] ?? 0.0).toDouble(),
      carbohydratesTotal: (json['carbohydrates_total_g'] ?? 0.0).toDouble(),
      fiber: (json['fiber_g'] ?? 0.0).toDouble(),
      sugar: (json['sugar_g'] ?? 0.0).toDouble(),
    );
  }
}
