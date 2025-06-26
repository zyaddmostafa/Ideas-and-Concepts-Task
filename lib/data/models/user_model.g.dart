// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  name: json['name'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  birthday: json['birthday'] as String?,
  isMale: json['isMale'] as bool?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'birthday': instance.birthday,
  'isMale': instance.isMale,
  'imageUrl': instance.imageUrl,
};
