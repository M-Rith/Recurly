import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_model.g.dart';  // For Hive adapter generation

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
  final String providerId;  // Combine providerData into a single field

  @HiveField(9)
  final String? providerDisplayName;

  @HiveField(10)
  final String? providerEmail;

  @HiveField(11)
  final String? providerPhoneNumber;

  @HiveField(12)
  final String? providerPhotoURL;

  @HiveField(13)
  final DateTime? creationTime;

  @HiveField(14)
  final DateTime? lastSignInTime;

  // Constructor for UserModel
  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    required this.isEmailVerified,
    required this.isAnonymous,
    this.phoneNumber,
    this.photoURL,
    required this.refreshToken,
    required this.providerId,
    this.providerDisplayName,
    this.providerEmail,
    this.providerPhoneNumber,
    this.providerPhotoURL,
    this.creationTime,
    this.lastSignInTime,
  });

  // Factory constructor to convert FirebaseUser to UserModel
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
      providerId: user.providerData.isNotEmpty ? user.providerData[0].providerId : '',
      providerDisplayName: user.providerData.isNotEmpty ? user.providerData[0].displayName : '',
      providerEmail: user.providerData.isNotEmpty ? user.providerData[0].email : '',
      providerPhoneNumber: user.providerData.isNotEmpty ? user.providerData[0].phoneNumber : '',
      providerPhotoURL: user.providerData.isNotEmpty ? user.providerData[0].photoURL : '',
      creationTime: user.metadata.creationTime,
      lastSignInTime: user.metadata.lastSignInTime,
    );
  }

  // Method to store user data in Hive
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'isEmailVerified': isEmailVerified,
      'isAnonymous': isAnonymous,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'refreshToken': refreshToken,
      'providerId': providerId,
      'providerDisplayName': providerDisplayName,
      'providerEmail': providerEmail,
      'providerPhoneNumber': providerPhoneNumber,
      'providerPhotoURL': providerPhotoURL,
      'creationTime': creationTime?.toIso8601String(),
      'lastSignInTime': lastSignInTime?.toIso8601String(),
    };
  }
}

