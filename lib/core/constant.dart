import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/date_format.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';


import 'theming/assets.dart';

/// <------------------------ ONBOARDING CONSTANTS ------------------------->

List<Color> onboardingPagesColors = [
  const Color(0xFFFFB737),
  const Color(0xFF7667F6),
  const Color(0xFFFF6000),
  const Color(0xFF7667F6),
];

List<String> onboardingPagesTitles = [
  "Book with ease, explore With Confidence.",
  "Seamless travel, all your rides in one place.",
  "Travel confidently, with your trusted companion.",
  "Discover Even More Beyond the Basics",
];
List<String> onboardingPagesDescriptions = [
  "Discover a hassle free travel experience and a smooth booking in-app process.",
  "Experience the convenience of booking bus, train, plane, and care rides all in one app.",
  "Enjoy peace of mind with top-notch security and round-the-clock assistance for all your travel needs.",
  "Discover personalised travel guides, exclusive deals with top transport companies, and everything you need for a seamless journey."
];
// List<String> onboardingPagesImages = [
//   Assets.onboardingImage1,
//   Assets.onboardingImage2,
//   Assets.onboardingImage3,
//   Assets.onboardingImage4,
// ];

/// <------------------------ NAV BAR CONSTANTS ------------------------->

// List<String> navBarIcons = [
//   Assets.homeIcon,
//   Assets.ticketIcon,
//   Assets.wishListIcon,
//   Assets.profileIcon
// ];

/// <------------------------ HOME CONSTANTS ------------------------->

// List<String> howItWorksImages = [
//   Assets.searchImage,
//   Assets.compareImage,
//   Assets.bookImage,
// ];

List<String> howItWorksTitles = [
  "search",
  "compare",
  "book",
];
List<String> howItWorksDescriptions = [
  "Search for your wanted destination among a wide variety of locations.",
  "Choose the fastest and the cheapest trip offered from our transportation partnerships.",
  "Book your trips wherever you are.",
];

List<Color> howItWorksColors = [
  AppColors.orangeColor,
  AppColors.yellowColor,
  AppColors.purpleColor,
];

// List<String> bookingPagesIcons = [
//   Assets.seatsIcon,
//   Assets.profileIcon,
//   Assets.policyAndInstructionsIcon,
//   Assets.tripSummaryIcon,
//   Assets.paymentIcon,
// ];
List<String> bookingPagesTitles = [
  "Seating",
  "Traveller Information",
  "Policy & Instructions",
  "Trip Summary",
  "Payment",
];

List<String> accommodationsPagesTitles = [
  "Select Rooms",
  "Traveller Information",
  "Policy & Instructions",
  "Booking Summary",
  "Payment",
];
// List<String> accommodationsPageIcon = [
//   Assets.bedIcon,
//   Assets.profileIcon,
//   Assets.policyAndInstructionsIcon,
//   Assets.tripSummaryIcon,
//   Assets.paymentIcon,
// ];
void printLargeText(String text) {
  const int chunkSize = 800; // Adjust this size based on your needs
  int start = 0;
  while (start < text.length) {
    int end =
        (start + chunkSize < text.length) ? start + chunkSize : text.length;
    printDebug(text.substring(start, end));
    start = end;
  }
}
void printDebug(dynamic text) {
  if (kDebugMode) {
    print(text.toString());
  }
  
}
List<Breakpoint> tregoBreakpoints = const [
    Breakpoint(start: 0, end: 380, name: MOBILE),
    Breakpoint(start: 381, end: 500, name: PHONE),
    Breakpoint(start: 501, end: 850, name: TABLET),
    Breakpoint(start: 851, end: 1200, name: DESKTOP),
];

const List<Map<String, String>> faqList = [
    {
      "question": "Can I use Trego for international travel bookings?",
      "answer":
      "Currently, Trego is focused on the Egyptian market with plans to expand internationally in the near future. For now, you can use the app to book domestic travel."
    },
    {
      "question": "how does the booking process work in the Trego app?",
      "answer":
      "Booking through the Trego app is simple and user-friendly. Users can search for travel options by entering their departure and arrival locations, selecting dates, and comparing available options. Once you find the desired travel option, you can proceed to book directly within the app by entering payment details"
    },
    {
      "question":
          "How do you ensure the security of user data?",
      "answer":
      "At Trego Tech, the security of our users is a top priority. We implement industry-standard security measures, including encryption, to protect personal and payment information. Additionally, we regularly update our systems to guard against potential vulnerabilities and ensure a secure user experience."
    },
    {
      "question": "Can I contribute feedback or suggest features for the Trego app?",
      "answer":
       "Absolutely! We value feedback from our users as it helps us improve. You can suggest new features or improvements directly through the app or by contacting our support team at support@tregotech.com. We're committed to building a platform that meets the needs of our users."
    },
    {
      "question":
          "Is there a customer support feature in the Trego app?",
      "answer":
       "Yes, the Trego app includes a customer support feature to assist users with any questions or issues they may encounter. You can access support directly through the app, and our team is committed to providing timely assistance."
    },
    {
      "question":
          "Will there be any loyalty programs or discounts available?",
      "answer":
      "We plan to introduce loyalty programs and promotional discounts to reward our users. More details will be available upon the app's launch, so keep an eye out for announcements on our website and social media."
     },
      {
      "question":
          "How does Trego Tech ensure quality in its software products?",
      "answer":
      "We prioritize quality at every stage of development at Trego Tech. Our team follows best practices in software engineering, including rigorous testing, code reviews, and continuous integration."
     },
  ];

String formatMessagesDate(DateTime date,BuildContext context) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final difference =
      today.difference(DateTime(date.year, date.month, date.day)).inDays;

  if (difference == 0) {
    return "Today".tr();
  } else if (difference == 1) {
    return "Yesterday".tr();
  }  else {
    return CustomDateFormat.weekDayDayMonth(theTime: date.toString(),context:context );
  }
}

//  Future.delayed(Duration.zero, () {
//                           showDialog(
//                             context: context,
//                             barrierDismissible: false,
//                             builder:
//                                 (context) => BlocBuilder<
//                                   GenerateVideoCubit,
//                                   GenerateVideoState
//                                 >(
//                                   builder: (context, state) {
//                                     if (state is GenerateVideoStatusLoading ||
//                                         state
//                                             is GenerateVideoStatusInProgress) {
//                                       return const AlertDialog(
//                                         content: SizedBox(
//                                           width: 300,
//                                           height: 300,
//                                           child: Center(
//                                             child: CircularProgressIndicator(),
//                                           ),
//                                         ),
//                                       );
//                                     } else if (state
//                                         is GenerateVideoStatusCompleted) {
//                                       final videoUrl =
//                                           state
//                                               .videoStatus
//                                               .video
//                                               ?.videoSource
//                                               .secureUrl;
//                                       if (videoUrl != null) {
//                                         return AlertDialog(
//                                           content: SizedBox(
//                                             width: 300,
//                                             height: 300,
//                                             child: VideoDialogContent(
//                                               videoUrl: videoUrl,
//                                             ),
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               onPressed:
//                                                   () =>
//                                                       Navigator.of(
//                                                         context,
//                                                       ).pop(),
//                                               child: const Text("Close"),
//                                             ),
//                                           ],
//                                         );
//                                       } else {
//                                         return const AlertDialog(
//                                           title: Text("Error"),
//                                           content: Text(
//                                             "Video URL not available.",
//                                           ),
//                                         );
//                                       }
//                                     } else if (state
//                                         is GenerateVideoStatusError) {
//                                       return AlertDialog(
//                                         title: const Text("Error"),
//                                         content: Text(
//                                           state.message ??
//                                               "Unknown error occurred.",
//                                         ),
//                                         actions: [
//                                           TextButton(
//                                             onPressed:
//                                                 () =>
//                                                     Navigator.of(context).pop(),
//                                             child: const Text("Close"),
//                                           ),
//                                         ],
//                                       );
//                                     } else if (state
//                                         is GenerateVideoStatusTimeout) {
//                                       return AlertDialog(
//                                         title: const Text("Timeout"),
//                                         content: const Text(
//                                           "Video generation timed out. Please try again later.",
//                                         ),
//                                         actions: [
//                                           TextButton(
//                                             onPressed:
//                                                 () =>
//                                                     Navigator.of(context).pop(),
//                                             child: const Text("Close"),
//                                           ),
//                                         ],
//                                       );
//                                     }

//                                     return const SizedBox.shrink(); // No matching state
//                                   },
//                                 ),
//                           );
//                         });