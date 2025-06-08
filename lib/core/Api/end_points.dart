class EndPoints {
  // static const String baseUrl = 'http://192.168.0.161';
  static const String baseUrl =
      'https://known-richard-fri-play.trycloudflare.com/api/';
  // :3020/
  static const String login = 'auth/signin';
  static const String register = 'auth/signup';
  static const String refreshAccessToken = "refresh-token";
  static const String userData = 'user/data';
  static const String userProfile = "user/profile";
  static const String purchaseCredits = "user/purchase-credits";
  static const String chnagePassword = "user/change-password";
  static const String getUserAllVideos = "user/videos";
  static const String generateScript = "scripts/generate";
  static const String generateVideo = 'videos/generate';
  static const String getAiAvtar = "aiAvatar/listing";
  static const String generateAiAvtarVideo = "videos/generate-avatar";
  static const String generateUrlVideo = "videos/generate-ad";
  static const String generateScriptAd = "scripts/generate-ad-script";
  //videos/generate-avatar

  static String getGeneratedVideo(String jobId) => 'renders/$jobId';
}
