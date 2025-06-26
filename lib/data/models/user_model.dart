import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? birthday;
  final bool? isMale;
  final String? imageUrl;

  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.birthday,
    this.isMale,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
