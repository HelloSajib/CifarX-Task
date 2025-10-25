import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {

  // ANSI Color Codes
  static const String reset = '\x1B[0m'; // Reset color
  static const String green = '\x1B[32m'; // Green for Created
  static const String blue = '\x1B[34m'; // Blue for State Change
  static const String cyan = '\x1B[36m'; // Cyan for Transition
  static const String red = '\x1B[31m'; // Red for Errors
  static const String yellow = '\x1B[33m'; // Yellow for Bloc Close

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('$green🟢 Bloc Created: ${bloc.runtimeType}$reset', name: 'BLoC');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('$blue🔄 State Changed in ${bloc.runtimeType}: $change$reset', name: 'BLoC');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('$cyan🔀 Transition in ${bloc.runtimeType}: $transition$reset', name: 'BLoC');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('$red❌ Error in ${bloc.runtimeType}: $error$reset',
        name: 'BLoC',
        error: error,
        stackTrace: stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('$yellow🔴 Bloc Closed: ${bloc.runtimeType}$reset', name: 'BLoC');
  }
}
