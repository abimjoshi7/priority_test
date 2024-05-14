import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('Bloc:${bloc.runtimeType}');
    log('Current State: ${change.currentState}');
    log('Next State: ${change.nextState}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('Bloc:${bloc.runtimeType}');
    log('Error: $error');
    log('Stacktrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}