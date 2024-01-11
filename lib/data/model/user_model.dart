// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:recipe_app/data/model/post_model.dart';
import 'package:recipe_app/data/model/recipe_info_model.dart';

class UserModel {
  String? id;
  List<RecipeInfo>? saved;
  List<PostModel>? posts;
  UserModel({
    this.id,
    this.saved,
    this.posts,
  });

  UserModel copyWith({
    String? id,
    List<RecipeInfo>? saved,
    List<PostModel>? posts,
  }) {
    return UserModel(
      id: id ?? this.id,
      saved: saved ?? this.saved,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'saved': saved?.map((x) => x.toMap()).toList(),
      'posts': posts!.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      saved: (map['saved'] as List<dynamic>?)?.map<RecipeInfo>((x) {
        if (x is Map<String, dynamic>) {
          return RecipeInfo.fromMap(x);
        }
        return RecipeInfo();
      }).toList(),
      posts: ((map['posts'] ?? []) as List<dynamic>?)?.map<PostModel>((x) {
        if (x is Map<String, dynamic>) {
          return PostModel.fromMap(x);
        }
        return PostModel();
      }).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(id: $id, saved: $saved, posts: $posts)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.saved, saved) &&
        listEquals(other.posts, posts);
  }

  @override
  int get hashCode => id.hashCode ^ saved.hashCode ^ posts.hashCode;
}
