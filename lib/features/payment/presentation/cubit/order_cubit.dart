import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class OrderCubit extends Cubit<int> with HydratedMixin {
  OrderCubit() : super(0);

  @override
  int? fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return json["value"] as int;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    log(state.toString());
    return {"value": state};
  }
}
