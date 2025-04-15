// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:trego_app/core/helpers/service_locator.dart';
// import 'package:trego_app/core/routing/routes_arguments.dart';
// import 'package:trego_app/features/Accommodation%20Booking/Bloc/accommodation_booking_process_bloc/accommodation_booking_process_bloc.dart';
// import 'package:trego_app/features/Accommodation%20Booking/Bloc/accommodation_booking_process_bloc/accommodation_booking_process_state.dart';
// import 'package:trego_app/features/Accommodation%20Booking/Domain/Entities/all_accommodation_info.dart';
// import 'package:trego_app/features/Accommodation%20Booking/Presentation/Screens/successful_accommodation_booking_screen.dart';
// import 'package:trego_app/features/Accomodations%20Search/Bloc/accommodation_details_cubit/accommodation_details_cubit.dart';
// import 'package:trego_app/features/Accomodations%20Search/Bloc/accommodations_search_bloc/accommodations_search_event.dart';
// import 'package:trego_app/features/Accommodation%20Booking/Presentation/Screens/accommodation_booking_proccess_screen.dart';
// import 'package:trego_app/features/Accomodations%20Search/Bloc/acommodation_details_by_id_cubit/accommodation_details_by_id_cubit.dart';
// import 'package:trego_app/features/Accomodations%20Search/Domain/UseCases/get_accommodation_details_by_id_use_case.dart';
// import 'package:trego_app/features/Accomodations%20Search/Domain/UseCases/get_accommodations_list_use_case.dart';
// import 'package:trego_app/features/Accomodations%20Search/Presentation/Screens/accommodation_filter_screen.dart';
// import 'package:trego_app/features/Accomodations%20Search/Presentation/Screens/accommodation_finding_screen.dart';
// import 'package:trego_app/features/Accomodations%20Search/Presentation/Screens/accommodations_search_screen.dart';
// import 'package:trego_app/features/Accomodations%20Search/Presentation/Widgets/accommodation_finding__widgets/accommodation_date_choosing_screen.dart';
// import 'package:trego_app/features/Accomodations%20Search/Presentation/Screens/accomodations_details_screen.dart';
// import 'package:trego_app/features/Auth/Delete%20Account/Domain/Use%20Cases/delete_account_use_case.dart';
// import 'package:trego_app/features/Auth/Delete%20Account/Presentation/delete_account_screen.dart';
// import 'package:trego_app/features/Auth/Delete%20Account/bloc/delete_account_bloc.dart';
// import 'package:trego_app/features/Auth/Forget%20Password/Domain/Use%20Cases/generate_otp_use_case.dart';
// import 'package:trego_app/features/Auth/Forget%20Password/Domain/Use%20Cases/reset_password_with_otp_use_case.dart';
// import 'package:trego_app/features/Auth/Forget%20Password/Domain/Use%20Cases/verify_otp_use_case.dart';
// import 'package:trego_app/features/Auth/Forget%20Password/bloc/reset_password_bloc.dart';
// import 'package:trego_app/features/Auth/Forget%20Password/presentation/Screens/check_otp_password.dart';
// import 'package:trego_app/features/Auth/Login/Bloc/login_bloc.dart';
// import 'package:trego_app/features/Auth/Login/Domain/Use%20Cases/login_with_apple_use_case.dart';
// import 'package:trego_app/features/Auth/Login/Domain/Use%20Cases/login_with_email_use_case.dart';
// import 'package:trego_app/features/Auth/Login/Domain/Use%20Cases/login_with_google_use_case.dart';
// import 'package:trego_app/features/Auth/Register/Domain/Use%20Cases/otp_use_case.dart';
// import 'package:trego_app/features/Auth/Register/Domain/Use%20Cases/register_with_email_use_case.dart';
// import 'package:trego_app/features/Auth/Register/Presentation/Screens/otp_screen.dart';
// import 'package:trego_app/features/Auth/Register/Presentation/Screens/register_page_view.dart';
// import 'package:trego_app/features/Auth/Register/Presentation/Screens/sign_up_method_screen.dart';
// import 'package:trego_app/features/Auth/Register/bloc/register_bloc.dart';
// import 'package:trego_app/features/Auth/Register/register_data_cubit/register_data_cubit.dart';
// import 'package:trego_app/features/Auth/Register/register_pages_cubit/register_pages_cubit.dart';
// import 'package:trego_app/features/Home/Bloc/most_popular_cubit/most_popular_cubit.dart';
// import 'package:trego_app/features/Home/Bloc/services_cubit/cubit/services_cubit.dart';
// import 'package:trego_app/features/Home/Domain/UseCase/get_most_popular_use_case.dart';
// import 'package:trego_app/features/Home/Domain/UseCase/get_services_use_case.dart';
// import 'package:trego_app/features/Main%20Layout/Bloc/main_layout_bloc.dart';
// import 'package:trego_app/features/Main%20Layout/Presentation/Screens/main_layout_screen.dart';
// import 'package:trego_app/features/Notifications/Domain/Use%20Cases/notification_use_case.dart';
// import 'package:trego_app/features/Notifications/Presentation/Screens/notifications_screen.dart';
// import 'package:trego_app/features/Notifications/bloc/notifications_bloc.dart';
// import 'package:trego_app/features/Notifications/bloc/notifications_event.dart';
// import 'package:trego_app/features/Onboarding/Bloc/onboarding_bloc.dart';
// import 'package:trego_app/features/Onboarding/Presentation/Screens/onboarding_screen.dart';
// import 'package:trego_app/features/Profile/Bloc/preferences_cubit/preferences_cubit.dart';
// import 'package:trego_app/features/Profile/Bloc/terms_and_conditions_cubit/cubit/terms_and_conditions_cubit.dart';
// import 'package:trego_app/features/Profile/Bloc/update_profile_Bloc/update_profile_bloc.dart';
// import 'package:trego_app/features/Profile/Domain/UseCases/get_preferences_use_case.dart';
// import 'package:trego_app/features/Profile/Domain/UseCases/get_terms_and_conditions_use_case.dart';
// import 'package:trego_app/features/Profile/Domain/UseCases/update_email_use_case.dart';
// import 'package:trego_app/features/Profile/Domain/UseCases/update_phone_use_case.dart';
// import 'package:trego_app/features/Profile/Domain/UseCases/update_preference_use_case.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/FAQ/FAQ_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/about_us/aboutUs_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/contact_us/contactUs_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/Domain/Use%20Cases/connect_socket_use_case.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/Domain/Use%20Cases/disconnect_socket_use_case.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/Domain/Use%20Cases/send_message_use_case.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/Domain/Use%20Cases/submit_rating_use_case.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/bloc/customer_support_bloc.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/bloc/customer_support_event.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/customer_support/presentation/screens/customer_support_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/loyalty_points/loyalty_points_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/notifications/profile_notifications.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/profile/profile_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/refer_freind/refer_friend_screen.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/retrive_booking/retrieve_booking.dart';
// import 'package:trego_app/features/Profile/Presentation/Screens/terms_conditions/terms_conditions_screen.dart';
// import 'package:trego_app/features/Tickets/Bloc/get_reservation_seats_cubit/cubit/get_reservation_seats_cubit.dart';
// import 'package:trego_app/features/Tickets/Domain/use_cases/get_reservation_seats_use_case.dart';
// import 'package:trego_app/features/Tickets/Presentation/Screens/remove_seats_screen.dart';
// import 'package:trego_app/features/Tickets/Presentation/Widgets/upcoming_tickets/upcoming_ticket_details_screen.dart';
// import 'package:trego_app/features/Trip%20Finding/Bloc/calendar%20bloc/calendar_bloc.dart';
// import 'package:trego_app/features/Trip%20Finding/Bloc/cities%20bloc/get_all_cities_bloc.dart';
// import 'package:trego_app/features/Trip%20Finding/Bloc/cities%20bloc/get_all_cities_event.dart';
// import 'package:trego_app/features/Trip%20Finding/Domain/use%20cases/get_all_cities_use_case.dart';
// import 'package:trego_app/features/Trip%20Finding/Presentation/Screens/date_choosing_screen.dart';
// import 'package:trego_app/features/Trip%20Finding/Presentation/Screens/trip_finding_screen.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/booking%20process%20bloc/booking_process_state.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/get_bus_seats_bloc/get_bus_seats_bloc.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/reservation_reminder_cubit/cubit/reservation_reminder_cubit.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/reserve_seats_cubit/cubit/reserve_seats_cubit.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/seats_pages_cubit/seats_pages_cubit.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/timer_bloc/cubit/timer_cubit.dart';
// import 'package:trego_app/features/Trips%20Booking/Data/Models/check_payment_status_model.dart';
// import 'package:trego_app/features/Trips%20Booking/Domain/UseCases/cancel_reservation_use_case.dart';
// import 'package:trego_app/features/Trips%20Booking/Domain/UseCases/diable_reminder_use_case.dart';
// import 'package:trego_app/features/Trips%20Booking/Domain/UseCases/enable_reminder_use_case.dart';
// import 'package:trego_app/features/Trips%20Booking/Domain/UseCases/get_bus_seats_use_case.dart';
// import 'package:trego_app/features/Trips%20Booking/Domain/UseCases/reserve_seats_use_case.dart';
// import 'package:trego_app/features/Trips%20Booking/Presentation/Screens/payment_web_view_screen.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Bloc/bus%20trips%20search%20bloc/bus_trips_search_bloc.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Bloc/chosen%20trips%20bloc/chosen_trips_cubit.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Domain/Enitities/all_trip_info_entity.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Domain/UseCases/get_bus_trips_use_case.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Presentation/Screens/bus_trips_filter_screen.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Presentation/Screens/bus_trips_search_results_screen.dart';
// import 'package:trego_app/features/Trips%20Booking/Presentation/Screens/seats_selection_screen.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/services/bus_trips_filteration_service.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Trains/Domain/UseCases/get_train_trips_use_case.dart';
// import 'package:trego_app/features/wishlist/bloc/wishlist_cubit.dart';
// import 'package:trego_app/features/wishlist/domain/use_case/add_item_to_wishlist_use_case.dart';
// import 'package:trego_app/features/wishlist/domain/use_case/add_trip_to_wishlist_use_case.dart';
// import 'package:trego_app/features/wishlist/domain/use_case/get_wishlist_use_case.dart';
// import 'package:trego_app/features/wishlist/domain/use_case/remove_item_from_wishlist_usecase.dart';
// import '../../features/Accommodation Booking/Bloc/accomodations_pages_bloc/accommodations_pages_bloc.dart';
// import '../../features/Accomodations Search/Bloc/accommodations_search_bloc/accommodations_search_bloc.dart';
// import '../../features/Accomodations Search/Presentation/Widgets/accommodation_finding__widgets/accommodation_travellers_number_choosing_screen.dart';
// import '../../features/Auth/Forget Password/presentation/Screens/finish_reset_screen.dart';
// import '../../features/Auth/Forget Password/presentation/Screens/forget_password_by_email.dart';
// import '../../features/Auth/Forget Password/presentation/Screens/reset_password.dart';
// import '../../features/Auth/Login/Domain/Use Cases/login_as_guest_use_case.dart';
// import '../../features/Auth/Login/Presentation/Screens/login_screen.dart';
// import '../../features/Feature Not Ready/not_ready_screen.dart';
// import '../../features/Trip Finding/Bloc/trip details cubit/trip_details_cubit.dart';
// import '../../features/Trip Finding/Presentation/Screens/station_choosing_screen.dart';
// import '../../features/Trip Finding/Presentation/Screens/travellers_number_choosing_screen.dart';
// import '../../features/Trips Booking/Bloc/booking pages bloc/booking_pages_bloc.dart';
// import '../../features/Trips Booking/Bloc/booking process bloc/booking_process_bloc.dart';
// import '../../features/Trips Booking/Bloc/traveller info cubit/traveller_info_cubit.dart';
// import '../../features/Trips Booking/Presentation/Screens/booking_process_screen.dart';
// import '../../features/Trips Booking/Presentation/Screens/great_news_screen.dart';
// import '../../features/Trips Booking/Presentation/Screens/successful_booking_screen.dart';
// import '../../features/Trips Booking/Presentation/Widgets/payment_widgets/payment_success_screen.dart';
// import '../../features/Trips Search Results/Trains/Bloc/chosen_train_trips/chosen_trips_cubit.dart';
// import '../../features/Trips Search Results/Trains/Bloc/train_trips_search_bloc/train_trips_search_bloc.dart';
// import '../../features/Trips Search Results/Trains/Presentation/Screens/train_trips_filter_screen.dart';
// import '../../features/Trips Search Results/Trains/Presentation/Screens/train_trips_search_results_screen.dart';
// import '../helpers/enums.dart';
// import 'routes.dart';

// class AppRouter {
//   Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.loginScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => LoginBloc(
//               loginWithAppleUseCase: getIt.get<LoginWithAppleUseCase>(),
//               loginAsGuestUseCase: getIt<LoginAsGuestUseCase>(),
//               loginWithEmailUseCase: getIt<LoginWithEmailUseCase>(),
//               loginWithGoogleUseCase: getIt<LoginWithGoogleUseCase>(),
//               // loginWithPhoneUseCase: getIt<LoginWithPhoneUseCase>(),
//             )..removeTokens(),
//             child: const LoginScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.signUpScreen:
//         final args = settings.arguments as SignUpMethod;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => RegisterDataCubit(args),
//               ),
//               BlocProvider(
//                 create: (context) => RegisterPagesCubit(),
//               ),
//               BlocProvider(
//                 create: (context) => RegisterBloc(
//                   getIt.get<GenerateOtpUseCase>(),
//                   getIt.get<RegisterWithEmailUseCase>(),
//                   // getIt.get<RegisterWithPhoneUseCase>(),
//                 ),
//               ),
//             ],
//             child: const RegisterPageView(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.tripFindingScreen:
//         final args = settings.arguments as TripFindingRouteArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => TripDetailsCubit(
//                   vehicleType: args.vehicleType,
//                   serviceId: args.serviceId,
//                 )..chooseTripDistinationFromHome(args.toCity),
//               ),
//               BlocProvider(
//                 create: (context) => GetAllCitiesBloc(
//                   getAllCitiesUseCase: getIt.get<GetAllCitiesUseCase>(),
//                 )..add(
//                     GetCitiesEvent(
//                       type: args.type,
//                       toCityId: args.toCity?.id,
//                       fromCityId: null,
//                     ),
//                   ),
//               ),
//             ],
//             child: TripFindingScreen(
//               vehicleAsset: args.image,
//               bGAsset: args.bGAsset,
//               tripTitle: args.title,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommodationFindingScreen:
//         final args = settings.arguments as AccommodationFindingRouteArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => AccommodationDetailsCubit(),
//               ),
//               BlocProvider(
//                 create: (context) => GetAllCitiesBloc(getAllCitiesUseCase: getIt.get<GetAllCitiesUseCase>())
//                   ..add(GetCitiesEvent(type: args.type)),
//               ),
//             ],
//             child: AccommodationFindingScreen(
//               vehicleAsset: args.image,
//               bGAsset: args.bGAsset,
//               tripTitle: args.title,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommodationSearchScreen:
//         final args = settings.arguments as AccommodationSearchRouteArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => AccommodationsSearchBloc(
//                   getAccommodationsListUseCase: getIt.get<GetAccommodationsListUseCase>(),
//                 )..add(
//                     GetAccommodationsListEvent(
//                       fromDate: args.accommodationDetails.checkInDate!,
//                       toCity: args.accommodationDetails.to!.nameEn,
//                       toDate: args.accommodationDetails.checkOutDate!,
//                     ),
//                   ),
//               ),
//               BlocProvider(
//                 create: (context) => WishListCubit(
//                   getWishlistUseCase: getIt.get<GetWishListUseCase>(),
//                   addItemToWishListUseCase: getIt.get<AddItemToWishListUseCase>(),
//                   removeItemFromWishListUseCase: getIt.get<RemoveItemFromWishListUseCase>(),
//                   addTripToWishListUseCase: getIt.get<AddTripToWishListUseCase>(),
//                 ),
//               ),
//             ],
//             child: AccommodationsSearchScreen(
//               accommodationDetails: args.accommodationDetails,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommodationsFiltersScreen:
//         final args = settings.arguments as AccommodationsSearchBloc;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args,
//             child: const AccommodationsFilteringScreen(),
//           ),
//           type: PageTransitionType.bottomToTop,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.bookingProcessScreen:
//         final args = settings.arguments as AllTripInfo;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => TripBookingPagesBloc(
//                   tripInfo: args,
//                 ),
//               ),
//               BlocProvider(
//                 create: (context) => TravellerInfoCubit(),
//               ),
//               BlocProvider(
//                 create: (context) => TripBookingProcessBloc(args),
//               ),
//               BlocProvider(
//                 create: (context) => TimerCubit(),
//               ),
//               BlocProvider(
//                 create: (context) => AddReservationCubit(
//                   cancelReservationUseCase: getIt.get<CancelReservationUseCase>(),
//                   reserveSeatsUseCase: getIt.get<ReserveSeatsUseCase>(),
//                 ),
//               ),
//             ],
//             child: BookingProcessScreen(
//               tripsInfo: args,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.busTripsSearchScreen:
//         final args = settings.arguments as TripsSearchResultsScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => BusTripsSearchBloc(
//                   tripDetails: args.tripDetails,
//                   busTripsFilterationService: BusTripsFilterationService(),
//                   getBusTripsUseCase: getIt.get<GetBusTripsUseCase>(),
//                 )
//                   ..chooseDepartureTimeFromTo(args.tripDetails.periodOfDepartureTime)
//                   ..chooseArrivalTimeFromTo(args.tripDetails.periodOfArrivalTime),
//               ),
//               BlocProvider(
//                 create: (context) => ChosenBusTripsCubit(args.tripDetails.tripType),
//               ),
//               BlocProvider(
//                 create: (context) => WishListCubit(
//                   getWishlistUseCase: getIt.get<GetWishListUseCase>(),
//                   addItemToWishListUseCase: getIt.get<AddItemToWishListUseCase>(),
//                   removeItemFromWishListUseCase: getIt.get<RemoveItemFromWishListUseCase>(),
//                   addTripToWishListUseCase: getIt.get<AddTripToWishListUseCase>(),
//                 ),
//               ),
//             ],
//             child: BusTripsSearchResultsScreen(
//               backgroundAsset: args.backgroundAsset,
//               cardAsset: args.cardAsset,
//               tripDetails: args.tripDetails,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.trainTripsSearchScreen:
//         final args = settings.arguments as TrainTripsSearchResultsScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(create: (context) => TrainTripsSearchBloc(getIt.get<GetTrainTripsUseCase>())),
//               BlocProvider(
//                 create: (context) => ChosenTrainTripsCubit(args.tripDetails.tripType),
//               ),
//               BlocProvider(
//                 create: (context) => WishListCubit(
//                   getWishlistUseCase: getIt.get<GetWishListUseCase>(),
//                   addItemToWishListUseCase: getIt.get<AddItemToWishListUseCase>(),
//                   removeItemFromWishListUseCase: getIt.get<RemoveItemFromWishListUseCase>(),
//                   addTripToWishListUseCase: getIt.get<AddTripToWishListUseCase>(),
//                 ),
//               ),
//             ],
//             child: TrainTripsSearchResultsScreen(
//               backgroundAsset: args.backgroundAsset,
//               cardAsset: args.cardAsset,
//               tripDetails: args.tripDetails,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.stationChoosingScreen:
//         final args = settings.arguments as StationChoosingScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args.getAllCitiesBloc,
//             child: StationChoosingScreen(
//               title: args.title,
//               hintText: args.hintText,
//               prefixAsset: args.prefixAsset,
//               onChoosingStation: args.onSelectStation,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.tripDateChoosingScreen:
//         final args = settings.arguments as DateChoosingScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => CalendarBloc(),
//               ),
//               BlocProvider.value(
//                 value: args.tripDetailsCubit,
//               ),
//             ],
//             child: DateChoosingScreen(
//               title: args.title,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommodationDateChoosingScreen:
//         final args = settings.arguments as AccommodationDateChoosingScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => CalendarBloc(),
//               ),
//               BlocProvider.value(
//                 value: args.accommodationDetailsCubit,
//               ),
//             ],
//             child: AccommodationDateChoosingScreen(
//               title: args.title,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.travellersNumberChoosingScreen:
//         final args = settings.arguments as TravellersNumberChoosingScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args.tripDetailsCubit,
//             child: TravellersNumberChoosingScreen(
//               title: args.title,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommodationTravellersNumberChoosingScreen:
//         final args = settings.arguments as AccommodationTravellersNumberChoosingScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args.accommodationDetailsCubit,
//             child: AccommodationTravellersNumberChoosingScreen(
//               title: args.title,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.busTripsFiltersScreen:
//         final args = settings.arguments as BusTripsFiltersScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args.busTripsSearchBloc,
//             child: BusTripsFilteringScreen(
//               chosenBusTrips: args.chosenBusTrips,
//               isReturnTrip: args.isReturnTrip,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.trainTripsFiltersScreen:
//         final args = settings.arguments as TrainTripsSearchBloc;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args,
//             child: const TrainTripsFilteringScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.getStartRoute:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => OnboardingBloc(),
//             child: const OnboardingScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.mainLayoutScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => MainLayoutBloc(),
//               ),
//               BlocProvider(
//                 create: (context) => PreferencesCubit(
//                     updatePreferencesUseCase: getIt.get<UpdatePreferencesUseCase>(),
//                     getPreferencesUseCase: getIt.get<GetPreferencesUseCase>()),
//               ),
//               BlocProvider(
//                 create: (context) => ServicesCubit(
//                   getServicesUseCase: getIt.get<GetServicesUseCase>(),
//                 )..getServices(),
//               ),
//             ],
//             child: const MainLayoutScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.forgetPasswordScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => ResetPasswordBloc(
//               getIt.get<ResetPasswordWithOtpUseCase>(),
//               getIt.get<GenerateOtpUseCasePasword>(),
//               getIt.get<VerifyOtpUseCase>(),
//             ),
//             child: const ForgetPasswordByEmailScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       // case Routes.forgetPassByPhone:
//       //   return PageTransition(isIos: Platform.isIOS,
//       //     child: BlocProvider(
//       //       create: (context) => ResetPasswordBloc(
//       //         getIt.get<ResetPasswordWithOtpUseCase>(),
//       //         getIt.get<GenerateOtpUseCasePasword>(),
//       //         getIt.get<VerifyOtpUseCase>(),
//       //       ),
//       //       child: const ForgetPasswordByPhone(),
//       //     ),
//       //     type: PageTransitionType.theme,
//       //     alignment: Alignment.center,
//       //     settings: settings,
//       //   );
//       case Routes.resetPasswordScreen:
//         final args = settings.arguments as ResetPasswordScreenArguments;

//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args.resetPasswordBloc,
//             child: ResetPasswordScreen(
//               identifier: args.identifier,
//               otp: args.otp,
//               type: args.type,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.checkOTPPasswordScreen:
//         final args = settings.arguments as ResetPasswordWithIdentifierArgument;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args.resetPasswordBloc,
//             child: CheckOTPPassword(
//               timer: args.timer,
//               identifier: args.identifier,
//               type: args.type,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.finishReset:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const FinishResetScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.signUpMethod:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const SignUpMethodScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.checkOTPScreen:
//         final args = settings.arguments as OTPScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider.value(
//                 value: args.registerDataCubit,
//               ),
//               BlocProvider.value(
//                 value: args.registerPagesCubit,
//               ),
//               BlocProvider.value(
//                 value: args.registerBloc,
//               ),
//             ],
//             child: OtpScreen(
//               identifier: args.identifier,
//               type: args.type,
//               timer: args.timer,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.profileScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => UpdateProfileBloc(
//                 generateOtpUseCase: getIt.get<GenerateOtpUseCase>(),
//                 updateEmailUseCase: getIt.get<UpdateEmailUseCase>(),
//                 updatePhoneUseCase: getIt.get<UpdatePhoneUseCase>()),
//             child: const ProfileScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.termsAndConditions:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => TermsAndConditionsCubit(
//               getTermsAndConditionsUseCase: getIt.get<GetTermsAndConditionsUseCase>(),
//             )..getTermsAndConditions(),
//             child: const TermsAndConditionsScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.notificationsProfile:
//         final args = settings.arguments as PreferencesCubit;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider.value(
//             value: args,
//             child: const ProfileNotifications(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.loyaltyPointsScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const LoyaltyPointsScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.faqScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const FaqsScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.referFriend:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const ReferFriendScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.retrieveBooking:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: RetrieveBooking(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.customerSupport:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => CustomerSupportBloc(
//               submitRatingUseCase: getIt.get<SubmitRatingUseCase>(),
//               connectSocketUseCase: getIt.get<ConnectSocketUseCase>(),
//               disconnectSocketUseCase: getIt.get<DisconnectSocketUseCase>(),
//               sendMessageUseCase: getIt.get<SendMessageUseCase>(),
//             )..add(ConnectEvent()),
//             child: const CustomerSupportScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.aboutTregoScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const AboutusScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.contactUsScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const ContactusScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.paymentSuccessScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: PaymentSuccessScreen(
//             tripsBookingData: settings.arguments as TripsBookingData,
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.notReadyScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: const NotReadyScreen(),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.greatNewsScreen:
//         final args = settings.arguments as AllTripInfo;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: GreatNewsScreen(
//             tripsInfo: args,
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.bookingSuccessScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => ReservationReminderCubit(
//               diableReminderUseCase: getIt.get<DiableReminderUseCase>(),
//               enableReminderUseCase: getIt.get<EnableReminderUseCase>(),
//             ),
//             child: SuccessfulBusBookingScreen(
//               data: settings.arguments as CheckPaymentStatusModel,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommdationDetailsScreeen:
//         final args = settings.arguments as AccommodationDetailsScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                   create: (context) => AccommodationDetailsByIdCubit(
//                       getAccommodationDetailsByIdUseCase: getIt.get<GetAccommodationDetailsByIdUseCase>())
//                     ..getAccommodationDetailsById(
//                         id: args.accommodationEntity.id,
//                         fromDate: args.accommodationDetails.checkInDate!,
//                         toDate: args.accommodationDetails.checkOutDate!)),
//               BlocProvider(
//                 create: (context) => WishListCubit(
//                   getWishlistUseCase: getIt.get<GetWishListUseCase>(),
//                   addItemToWishListUseCase: getIt.get<AddItemToWishListUseCase>(),
//                   removeItemFromWishListUseCase: getIt.get<RemoveItemFromWishListUseCase>(),
//                   addTripToWishListUseCase: getIt.get<AddTripToWishListUseCase>(),
//                 ),
//               )
//             ],
//             child: AccommodationsDetailsScreen(
//               accommodationDetails: args.accommodationDetails,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.accommodationsBookingProcess:
//         final args = settings.arguments as AllAccommodationInfo;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => AccommodationsPagesBloc(),
//               ),
//               BlocProvider(
//                 create: (context) => TravellerInfoCubit(),
//               ),
//               BlocProvider(
//                 create: (context) => AccommodationBookingProcessBloc(args),
//               ),
//             ],
//             child: const AccommodationBookingProcessScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.deleteAccount:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => DeleteAccountBloc(
//               getIt.get<DeleteAccountUseCase>(),
//             ),
//             child: const DeleteAccountScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.seatsSelectionScreen:
//         final args = settings.arguments as SeatsSelectionScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => GetBusSeatsBloc(getIt.get<GetBusSeatsUseCase>()),
//               ),
//               BlocProvider.value(
//                 value: args.tripBookingProcessBloc,
//               ),
//               BlocProvider(
//                 create: (context) => SeatsPagesCubit(args.initialIndex),
//               ),
//             ],
//             child: const SeatsSelectionScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.upComingTicketScreen:
//         final args = settings.arguments as UpcomingTicketDetailsArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => ReservationReminderCubit(
//               diableReminderUseCase: getIt.get<DiableReminderUseCase>(),
//               enableReminderUseCase: getIt.get<EnableReminderUseCase>(),
//             ),
//             child: UpcomingTicketDetailsScreen(
//               trip: args.trip,
//               userReservationsContext: args.userReservationsContext,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );

//       case Routes.notificationsScreen:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => NotificationsBloc(notificationUserUseCase: getIt.get<NotificationUseCase>())
//               ..add(
//                 GetNotificationsEvent(),
//               ),
//             child: const NotificationsScreen(),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );

//       case Routes.successfulAccommodationBookingScreen:
//         final args = settings.arguments as AccommodationBookingData;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: SuccessfulAccommodationBookingScreen(
//             data: args,
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.paymentWebViewScreen:
//         final args = settings.arguments as PaymentWebViewScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider.value(
//                 value: args.timerCubit,
//               ),
//               BlocProvider.value(
//                 value: args.reservationPaymentCubit,
//               ),
//             ],
//             child: PaymentWebViewScreen(
//               key: UniqueKey(),
//               controller: args.controller,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );
//       case Routes.removeSeatsScreen:
//         final args = settings.arguments as RemoveSeatsScreenArguments;
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: BlocProvider(
//             create: (context) => GetReservationSeatsCubit(
//               reservationSeatsContractRepo: getIt.get<GetReservationSeatsUseCase>(),
//             )..getReservationSeats(reservationId: args.trip.id),
//             child: RemoveSeatsScreen(
//               upcomingDetailsContext: args.upcomingDetailsContext,
//               userReservationsContext: args.userReservationsContext,
//               trip: args.trip,
//             ),
//           ),
//           type: PageTransitionType.theme,
//           alignment: Alignment.center,
//           settings: settings,
//         );

//       default:
//         return PageTransition(
//           isIos: Platform.isIOS,
//           child: Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//           type: PageTransitionType.theme,
//           duration: const Duration(milliseconds: 200),
//           alignment: Alignment.center,
//           settings: settings,
//         );
//     }
//   }
// }
