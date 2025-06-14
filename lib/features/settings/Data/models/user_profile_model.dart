import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({required super.user, required super.payments});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      user: User.fromJson(json['user']),
      payments:
          (json['payments'] as List)
              .map((paymentJson) => Payments.fromJson(paymentJson))
              .toList(),
    );
  }
}

class User extends UserEntity {
  User({
    required super.sId,
    required super.name,
    required super.email,
    required super.aiCredits,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      sId: json['_id'],
      name: json['name'],
      email: json['email'],
      aiCredits: json['aiCredits'],
    );
  }
}

class Payments extends PaymentEntity {
  Payments({
    required super.credits,
    required super.egpAmount,
    required super.paymentProvider,
    required super.paymentReference,
    required super.status,
    required super.createdAtfinal,
  });

  factory Payments.fromJson(Map<String, dynamic> json) {
    return Payments(
      credits: json['credits'],
      egpAmount: json['egpAmount'],
      paymentProvider: json['paymentProvider'],
      paymentReference: json['paymentReference'],
      status: json['status'],
      createdAtfinal: json['createdAt'],
    );
  }
}
