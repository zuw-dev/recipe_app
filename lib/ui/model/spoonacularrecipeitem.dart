class RecipeModel {
  final int id;
  final String title;
  final String image;
  final String imageType;
  final int servings;
  final int readyInMinutes;
  final String license;
  final String sourceName;
  final String sourceUrl;
  final String spoonacularSourceUrl;
  final double healthScore;
  final double spoonacularScore;
  final double pricePerServing;
  final List<String> analyzedInstructions;
  final bool cheap;
  final String creditsText;
  final List<String> cuisines;
  final bool dairyFree;
  final List<String> diets;
  final String gaps;
  final bool glutenFree;
  final String instructions;
  final bool ketogenic;
  final bool lowFodmap;
  final List<String> occasions;
  final bool sustainable;
  final bool vegan;
  final bool vegetarian;
  final bool veryHealthy;
  final bool veryPopular;
  final bool whole30;
  final int weightWatcherSmartPoints;
  final List<String> dishTypes;
  final List<ExtendedIngredient> extendedIngredients;
  final String summary;
  final WinePairing winePairing;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.servings,
    required this.readyInMinutes,
    required this.license,
    required this.sourceName,
    required this.sourceUrl,
    required this.spoonacularSourceUrl,
    required this.healthScore,
    required this.spoonacularScore,
    required this.pricePerServing,
    required this.analyzedInstructions,
    required this.cheap,
    required this.creditsText,
    required this.cuisines,
    required this.dairyFree,
    required this.diets,
    required this.gaps,
    required this.glutenFree,
    required this.instructions,
    required this.ketogenic,
    required this.lowFodmap,
    required this.occasions,
    required this.sustainable,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    required this.whole30,
    required this.weightWatcherSmartPoints,
    required this.dishTypes,
    required this.extendedIngredients,
    required this.summary,
    required this.winePairing,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      imageType: json['imageType'] ?? '',
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      license: json['license'] ?? '',
      sourceName: json['sourceName'] ?? '',
      sourceUrl: json['sourceUrl'] ?? '',
      spoonacularSourceUrl: json['spoonacularSourceUrl'] ?? '',
      healthScore: json['healthScore'] ?? 0.0,
      spoonacularScore: json['spoonacularScore'] ?? 0.0,
      pricePerServing: json['pricePerServing'] ?? 0.0,
      analyzedInstructions:
          List<String>.from(json['analyzedInstructions'] ?? []),
      cheap: json['cheap'] ?? false,
      creditsText: json['creditsText'] ?? '',
      cuisines: List<String>.from(json['cuisines'] ?? []),
      dairyFree: json['dairyFree'] ?? false,
      diets: List<String>.from(json['diets'] ?? []),
      gaps: json['gaps'] ?? '',
      glutenFree: json['glutenFree'] ?? false,
      instructions: json['instructions'] ?? '',
      ketogenic: json['ketogenic'] ?? false,
      lowFodmap: json['lowFodmap'] ?? false,
      occasions: List<String>.from(json['occasions'] ?? []),
      sustainable: json['sustainable'] ?? false,
      vegan: json['vegan'] ?? false,
      vegetarian: json['vegetarian'] ?? false,
      veryHealthy: json['veryHealthy'] ?? false,
      veryPopular: json['veryPopular'] ?? false,
      whole30: json['whole30'] ?? false,
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] ?? 0,
      dishTypes: List<String>.from(json['dishTypes'] ?? []),
      extendedIngredients: List<ExtendedIngredient>.from(
        (json['extendedIngredients'] as List).map(
          (ingredient) => ExtendedIngredient.fromJson(ingredient),
        ),
      ),
      summary: json['summary'] ?? '',
      winePairing: WinePairing.fromJson(json['winePairing'] ?? {}),
    );
  }
}

class ExtendedIngredient {
  final String aisle;
  final double amount;
  final String consitency;
  final int id;
  final String image;
  final Measure measures;
  final List<String> meta;
  final String name;
  final String original;
  final String originalName;
  final String unit;

  ExtendedIngredient({
    required this.aisle,
    required this.amount,
    required this.consitency,
    required this.id,
    required this.image,
    required this.measures,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredient(
      aisle: json['aisle'] ?? '',
      amount: json['amount'] ?? 0.0,
      consitency: json['consitency'] ?? '',
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      measures: Measure.fromJson(json['measures'] ?? {}),
      meta: List<String>.from(json['meta'] ?? []),
      name: json['name'] ?? '',
      original: json['original'] ?? '',
      originalName: json['originalName'] ?? '',
      unit: json['unit'] ?? '',
    );
  }
}

class Measure {
  final Metric metric;
  final Us us;

  Measure({
    required this.metric,
    required this.us,
  });

  factory Measure.fromJson(Map<String, dynamic> json) {
    return Measure(
      metric: Metric.fromJson(json['metric'] ?? {}),
      us: Us.fromJson(json['us'] ?? {}),
    );
  }
}

class Metric {
  final double amount;
  final String unitLong;
  final String unitShort;

  Metric({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      amount: json['amount'] ?? 0.0,
      unitLong: json['unitLong'] ?? '',
      unitShort: json['unitShort'] ?? '',
    );
  }
}

class Us {
  final double amount;
  final String unitLong;
  final String unitShort;

  Us({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  });

  factory Us.fromJson(Map<String, dynamic> json) {
    return Us(
      amount: json['amount'] ?? 0.0,
      unitLong: json['unitLong'] ?? '',
      unitShort: json['unitShort'] ?? '',
    );
  }
}

class WinePairing {
  final List<String> pairedWines;
  final String pairingText;
  final List<ProductMatch> productMatches;

  WinePairing({
    required this.pairedWines,
    required this.pairingText,
    required this.productMatches,
  });

  factory WinePairing.fromJson(Map<String, dynamic> json) {
    return WinePairing(
      pairedWines: List<String>.from(json['pairedWines'] ?? []),
      pairingText: json['pairingText'] ?? '',
      productMatches: List<ProductMatch>.from(
        (json['productMatches'] as List).map(
          (product) => ProductMatch.fromJson(product),
        ),
      ),
    );
  }
}

class ProductMatch {
  final int id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final double averageRating;
  final double ratingCount;
  final double score;
  final String link;

  ProductMatch({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.averageRating,
    required this.ratingCount,
    required this.score,
    required this.link,
  });

  factory ProductMatch.fromJson(Map<String, dynamic> json) {
    return ProductMatch(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      averageRating: json['averageRating'] ?? 0.0,
      ratingCount: json['ratingCount'] ?? 0.0,
      score: json['score'] ?? 0.0,
      link: json['link'] ?? '',
    );
  }
}
