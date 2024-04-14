import 'package:bloc/bloc.dart';
part 'BottomNaviEvent.dart';

class BottomNaviBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNaviBloc() : super(0) {
    on<BottomNavigationEvent>((event, emit) {
      switch (event) {
        case BottomNavigationEvent.Home:
          emit(0);
          break;

        case BottomNavigationEvent.Settings:
          emit(1);
          break;

        case BottomNavigationEvent.Profile:
          emit(2);
          break;
      }
    });
  }
}
