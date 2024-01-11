// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  String? imgUrl = "";
  String? title;
  String? instructions;
  PostModel({
    this.imgUrl,
    this.title,
    this.instructions,
  });

  PostModel copyWith({
    String? imgUrl,
    String? title,
    String? instructions,
  }) {
    return PostModel(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgUrl': imgUrl,
      'title': title,
      'instructions': instructions,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      imgUrl: map['imgUrl'] != null ? map['imgUrl'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      instructions:
          map['instructions'] != null ? map['instructions'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PostModel(imgUrl: $imgUrl, title: $title, instructions: $instructions)';

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.imgUrl == imgUrl &&
        other.title == title &&
        other.instructions == instructions;
  }

  @override
  int get hashCode => imgUrl.hashCode ^ title.hashCode ^ instructions.hashCode;
}
