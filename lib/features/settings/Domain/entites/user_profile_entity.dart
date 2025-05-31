class UserProfileEntity {
  final UserEntity user;
  List<PaymentEntity> payments;

  UserProfileEntity({required this.user, required this.payments});
}

class UserEntity {
  final String sId;
  final String name;
  final String email;
  final int aiCredits;

  UserEntity({
    required this.sId,
    required this.name,
    required this.email,
    required this.aiCredits,
  });
}

class PaymentEntity {
  final int credits;
  final String egpAmount;
  final String paymentProvider;
  final String paymentReference;
  final String status;
  final String createdAtfinal;

  PaymentEntity({
    required this.credits,
    required this.egpAmount,
    required this.paymentProvider,
    required this.paymentReference,
    required this.status,
    required this.createdAtfinal,
  });
}
