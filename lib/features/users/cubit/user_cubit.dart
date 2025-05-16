import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/users/model/user_model.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null);

  void setUser(UserModel user) {
    emit(user);
  }

  void clearUser() {
    emit(null);
  }
}