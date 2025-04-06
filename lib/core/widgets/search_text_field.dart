// import 'dart:async';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:trego_app/features/Accomodations%20Search/Bloc/accommodations_search_bloc/accommodations_search_bloc.dart';
// import 'package:trego_app/features/Accomodations%20Search/Bloc/accommodations_search_bloc/accommodations_search_event.dart';
// import 'package:trego_app/features/Accomodations%20Search/Bloc/accommodations_search_bloc/accommodations_search_state.dart';

// import '../theming/colors.dart';
// import 'custom_text_form_field.dart';

// class SearchTextField extends StatelessWidget {
//   SearchTextField({super.key, required this.controller});

//   final TextEditingController controller;
//   final Debouncer _debouncer =
//       Debouncer(milliseconds: 800); // Set debounce delay
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AccommodationsSearchBloc, AccommodationsSearchState>(
//       builder: (context, state) {
//         var accommodationsSearchBloc = context.read<AccommodationsSearchBloc>();
//         return CustomTextFormField(
//           onChanged: (s) {
//             _debouncer.run(() {
//               accommodationsSearchBloc.add(
//                 FilterAccommodationsListEvent(
//                   text: s,
//                   lowerPrice:
//                       accommodationsSearchBloc.filters["lowerPrice"] ?? 0.0,
//                   upperPrice: accommodationsSearchBloc.filters["upperPrice"] ??
//                       double.infinity,
//                   numberOfRooms:
//                       accommodationsSearchBloc.filters["numberOfRooms"] ??
//                           <int>[],
//                   numberOfBathrooms:
//                       accommodationsSearchBloc.filters["numberOfBathrooms"] ??
//                           <int>[],
//                   numberOfBeds:
//                       accommodationsSearchBloc.filters["numberOfBeds"] ??
//                           <int>[],
//                   lowerRating:
//                       accommodationsSearchBloc.filters["lowerRating"] ?? 0.0,
//                   upperRating:
//                       accommodationsSearchBloc.filters["upperRating"] ??
//                           double.infinity,
//                   freeCancellation:
//                       accommodationsSearchBloc.filters["freeCancellation"] ??
//                           false,
//                 ),
//               );
//             });
//           },
//           controller: controller,
//           borderRadius: BorderRadius.circular(15.r),
//           hintText: "Search".tr(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
//           textSize: 14.r,
//           textColor: AppColors.purpleColor,
//           borderColor: AppColors.purpleColor,
//           textWeight: FontWeight.w600,
//           borderWidth: 1,
//         );
//       },
//     );
//   }
// }

// class Debouncer {
//   final int milliseconds;
//   late VoidCallback? action;
//   Timer? _timer;

//   Debouncer({required this.milliseconds});

//   run(VoidCallback action) {
//     if (_timer != null) {
//       _timer!.cancel();
//     }
//     _timer = Timer(Duration(milliseconds: milliseconds), action);
//   }
// }
