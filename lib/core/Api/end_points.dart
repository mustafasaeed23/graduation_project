class EndPoints {
  // static const String baseUrl = 'http://192.168.0.161';
  static const String baseUrl = 'https://api.tregotech.com/';
  // :3020/
  static const String emailSignIn = 'auth/api/signin';
  static const String phoneSignIn = 'auth/api/signin/phone';
  static const String guestSignIn = 'notif/devices/continue/as/guest';
  static const String googleSignIn = 'auth/google/callback';
  static const String appleSignIn = 'auth/auth/apple';
  static const String generateOtpSignUp = 'auth/otp/generate-otp-signup';
  static const String verifyOtp = 'auth/otp/verify-otp';
  static const String registerEmail = 'auth/api/register';
  static const String registerPhone = 'auth/api/register/phone';
  static const String getProfileData = 'auth/profile';
  static const String logout = 'auth/api/signout';
  static const String updateEmail = 'auth/update-email';
  static const String updatePhone = 'auth/update-phone';
  static const String refreshAccessToken = 'auth/api/refresh-token';
  static const String resetPasswordWithOTP = 'auth/password/reset-password';
  static const String generateOTP = "auth/otp/generate-otp";
  static const String deleteAccount = "auth/delete";

  // cities
  static const String getCities = 'company/getCities';
  static const String getMostPopularCities = 'company/trips/mostPopular';

  // company :3030/
  // Bus Trips
  static const String getBusSeats = 'company/bus/external';
  static const String getBusTrips = 'company/trips/getTrips';
  // Train Trips
  static const String getTrainTrips = 'company/trips/getTrainTrips';

  // Accommodations
  static const String getAccommodations = 'accommodation/search-listings';
  static const String getAccommodationById = 'accommodation/listing-by-id';
  static const String getHotelRooms = 'accommodation/listings-addr';
  //notifs  :3040/
  // Notifications
  static const String getNotifications = 'notif/notifs/get/notifs/user';
  static const String getPreferences = 'notif/prefs/get-pref';
  static const String updatePreferences = 'notif/prefs/update-pref';

  /// Customer Support
  static const String customerSupportURL = 'wss://api.tregotech.com';
  static const String submitRating = 'customer/chats/rate-chat';
  // static const String customerSupportURL = 'ws://192.168.0.161:3080';

  /// Wish List
  static const String addTripToWishlist = 'auth/wishlist/addWishlistTrip';
  static const String addItemToWishlist = 'auth/wishlist/addWishlistItem';
  static const String removeFromWishlist = 'auth/wishlist/deleteWishlistItem';
  static const String getWishlist = 'auth/wishlist/getWishlistItems';

  /// :3050/
  /// Reservations
  static const String getAllServices = 'reservations/serviceproviders/getall';
  static const String reserveSeats = 'reservations/reservations/addreservation';
  static const String getReservationUserInfo = 'reservations/userInfo/getUserInfo';
  static const String addReservationUserInfo = 'reservations/userInfo/createInfo';
  static const String getReservationPolicies = 'reservations/acceptedPolicy/getReservationPoliciesByResToken';
  static const String acceptReservationPolicies = 'reservations/acceptedPolicy/acceptPolicy';
  static const String addReservationPayment = 'reservations/payments/addpayment';
  static const String cancelReservationByReservationByToken = 'reservations/reservations/cancelReservation';
  static const String getBusReservationSummary = 'reservations/reservations/getUserReservationsByToken';
  static const String checkPaymentStatus = 'reservations/payments/getStatus';
  static const String getReservations = 'reservations/reservations/getUserReservations';
  static const String cancelReservationByReservationId = 'reservations/cancelations/addcancelation';
  static const String getBusDetails = 'reservations/reservations/getBusDetails';
  static const String getNotCompletedReservation = 'reservations/reservations/getReservationStep';
  static const String validateCoupon = 'reservations/discounts/validateCoupon';
  static const String enableReminder = 'reservations/reservations/enableReservationReminder';
  static const String disableReminder = 'reservations/reservations/disableReservationReminder';

  // :3010/
  /// Terms And Conditions
  static const String getTermsAndConditions = 'tr/admin/terms/getVisibleTerms';
}
