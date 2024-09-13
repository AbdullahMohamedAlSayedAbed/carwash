import 'package:carwash/Features/profile_and_stander_wash/domin/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({super.carType, super.name,  super.email,  super.uId, super.image});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      image: user.photoURL ?? '',

    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['username'],
      email: json['email'],
      uId: json['uid'],
      image: json['image'],
      carType: json['carType'],
    );
  }
}

