import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_model.g.dart';  // The generated file for Hive

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String uid;
  
  @HiveField(1)
  final String email;

  @HiveField(2)
  final String? displayName;

  @HiveField(3)
  final bool isEmailVerified;

  @HiveField(4)
  final bool isAnonymous;

  @HiveField(5)
  final String? phoneNumber;

  @HiveField(6)
  final String? photoURL;

  @HiveField(7)
  final String refreshToken;

  @HiveField(8)
  final UserMetadata metadata;

  @HiveField(9)
  final List<UserInfo> providerData;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    required this.isEmailVerified,
    required this.isAnonymous,
    this.phoneNumber,
    this.photoURL,
    required this.refreshToken,
    required this.metadata,
    required this.providerData,
  });

  // Factory constructor to convert Firebase User to UserModel
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      isEmailVerified: user.emailVerified,
      isAnonymous: user.isAnonymous,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
      refreshToken: user.refreshToken ?? '',
      metadata: user.metadata,
      providerData: user.providerData,
    );
  }
}

