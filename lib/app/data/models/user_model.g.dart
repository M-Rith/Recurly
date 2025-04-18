// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      uid: fields[0] as String,
      email: fields[1] as String,
      displayName: fields[2] as String?,
      isEmailVerified: fields[3] as bool,
      isAnonymous: fields[4] as bool,
      phoneNumber: fields[5] as String?,
      photoURL: fields[6] as String?,
      refreshToken: fields[7] as String,
      providerId: fields[8] as String,
      providerDisplayName: fields[9] as String?,
      providerEmail: fields[10] as String?,
      providerPhoneNumber: fields[11] as String?,
      providerPhotoURL: fields[12] as String?,
      creationTime: fields[13] as DateTime?,
      lastSignInTime: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.isEmailVerified)
      ..writeByte(4)
      ..write(obj.isAnonymous)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.photoURL)
      ..writeByte(7)
      ..write(obj.refreshToken)
      ..writeByte(8)
      ..write(obj.providerId)
      ..writeByte(9)
      ..write(obj.providerDisplayName)
      ..writeByte(10)
      ..write(obj.providerEmail)
      ..writeByte(11)
      ..write(obj.providerPhoneNumber)
      ..writeByte(12)
      ..write(obj.providerPhotoURL)
      ..writeByte(13)
      ..write(obj.creationTime)
      ..writeByte(14)
      ..write(obj.lastSignInTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
