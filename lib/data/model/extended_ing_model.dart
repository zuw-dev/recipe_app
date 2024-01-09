// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExtendedIngredients {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  ExtendedIngredients({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
  });

  ExtendedIngredients copyWith({
    int? id,
    String? aisle,
    String? image,
    String? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalName,
    double? amount,
    String? unit,
  }) {
    return ExtendedIngredients(
      id: id ?? this.id,
      aisle: aisle ?? this.aisle,
      image: image ?? this.image,
      consistency: consistency ?? this.consistency,
      name: name ?? this.name,
      nameClean: nameClean ?? this.nameClean,
      original: original ?? this.original,
      originalName: originalName ?? this.originalName,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'aisle': aisle,
      'image': image,
      'consistency': consistency,
      'name': name,
      'nameClean': nameClean,
      'original': original,
      'originalName': originalName,
      'amount': amount,
      'unit': unit,
    };
  }

  factory ExtendedIngredients.fromMap(Map<String, dynamic> map) {
    return ExtendedIngredients(
      id: map['id'] != null ? map['id'] as int : null,
      aisle: map['aisle'] != null ? map['aisle'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      consistency:
          map['consistency'] != null ? map['consistency'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nameClean: map['nameClean'] != null ? map['nameClean'] as String : null,
      original: map['original'] != null ? map['original'] as String : null,
      originalName:
          map['originalName'] != null ? map['originalName'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtendedIngredients.fromJson(String source) =>
      ExtendedIngredients.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExtendedIngredients(id: $id, aisle: $aisle, image: $image, consistency: $consistency, name: $name, nameClean: $nameClean, original: $original, originalName: $originalName, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(covariant ExtendedIngredients other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.aisle == aisle &&
        other.image == image &&
        other.consistency == consistency &&
        other.name == name &&
        other.nameClean == nameClean &&
        other.original == original &&
        other.originalName == originalName &&
        other.amount == amount &&
        other.unit == unit;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        aisle.hashCode ^
        image.hashCode ^
        consistency.hashCode ^
        name.hashCode ^
        nameClean.hashCode ^
        original.hashCode ^
        originalName.hashCode ^
        amount.hashCode ^
        unit.hashCode;
  }
}
