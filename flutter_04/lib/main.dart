import 'package:flutter/material.dart';
import 'package:flutter_04/bloc/bloc_counter_app.dart';
import 'package:flutter_04/bloc/counter_bloc.dart';
import 'package:flutter_04/riverpod/riverpod_counter_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // State 기반
  // runApp(const StateCounterApp());

  // MVVM
  // runApp(const MvvmChangeNotifierApp());

  // MVVM - Provider, pubspec.yaml에 dependencies에 provider를 주입을 시켜야함.
  // runApp(
  //   ChangeNotifierProvider<CounterViewmodel>(
  //     create: (context) {r
  //       return CounterViewmodel();
  //     },
  //     child: const MvvmProviderCounterApp(),
  //   ),
  // );

  // Getx - 이것도 flutter getx 검색해서 가져와야 함. (viewmodel, 데이터와 로직이 한곳에)
  // runApp(GetMaterialApp(home: GetxCounterApp()));

  // riverpod
  // runApp(const RiverpodCounterApp());
  // runApp(const ProviderScope(child: RiverpodCounterApp()));

  // bloc
  runApp(const BlocCounterApp());
}
