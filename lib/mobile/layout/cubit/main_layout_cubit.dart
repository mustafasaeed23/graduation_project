import 'package:bloc/bloc.dart';

class MainLayoutCubit extends Cubit<int> {
  MainLayoutCubit() : super(0);

  void changeTab(int index) => emit(index);
}
