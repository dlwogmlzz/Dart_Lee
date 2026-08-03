import 'package:flutter_bloc/flutter_bloc.dart';

// sealed - 상속받을 수 있는 자식 클래스의 종류를 같은 파일안으로 제한하는 클래스
// 화면의 상태나 이벤트를 안전하게 관리할때 쓰임.
sealed class CounterEvent {}

final class CounterUpEvent extends CounterEvent {}

final class CounterDownEvent extends CounterEvent {}

class BlocCounterState {
  int count = 0;
  BlocCounterState({required this.count});
}

class CounterBloc extends Bloc<CounterEvent, BlocCounterState> {
  // CounterBloc(super.initialState);
  CounterBloc() : super(BlocCounterState(count: 0)) {
    on<CounterUpEvent>((event, emit) {
      emit(BlocCounterState(count: state.count + 1)); // emit - 데이터를 방출한다.
    });
    on<CounterDownEvent>((event, emit) {
      emit(BlocCounterState(count: state.count - 1));
      if (state.count < 0) {
        emit(BlocCounterState(count: state.count = 0)); // emit - 데이터를 방출한다.
      }
    });
  }
}
