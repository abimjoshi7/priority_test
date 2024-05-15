import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'filter_state.dart';
part 'filter_cubit.freezed.dart';

class FilterCubit extends Cubit<FilterState> with HydratedMixin {
  FilterCubit() : super(const FilterState.initial()) {
    hydrate();
  }
  int getCount() {
    return [
      state.colorType,
      state.genderType,
      state.endPrice,
      state.startPrice,
      state.isHighestReview,
      state.isLowestPrice,
      state.isMostRecent
    ].where((element) => element != null).length;
  }

  void resetFilter() {
    emit(const FilterState.initial());
  }

  void applyFilter(
    bool isLowestPrice,
    bool isHighestReview,
    bool isMostRecent,
    int? genderType,
    int? colorType,
    double? startPrice,
    double? endPrice,
  ) {
    emit(
      FilterState.initial(
        colorType: colorType,
        genderType: genderType,
        startPrice: startPrice,
        endPrice: endPrice,
        isHighestReview: isHighestReview,
        isLowestPrice: isLowestPrice,
        isMostRecent: isMostRecent,
      ),
    );
  }

  void sortLowestPrice(bool isLowestPrice) {
    emit(
      FilterState.initial(
        isLowestPrice: isLowestPrice,
        isHighestReview: false,
        isMostRecent: false,
        startPrice: state.startPrice,
        endPrice: state.endPrice,
        colorType: state.colorType,
        genderType: state.genderType,
      ),
    );
  }

  void sortHighestReview(bool isHighestReview) {
    emit(
      FilterState.initial(
        isHighestReview: isHighestReview,
        isLowestPrice: false,
        isMostRecent: false,
        startPrice: state.startPrice,
        endPrice: state.endPrice,
        colorType: state.colorType,
        genderType: state.genderType,
      ),
    );
  }

  void isMostRecent(bool isMostRecent) {
    emit(
      FilterState.initial(
        isMostRecent: isMostRecent,
        isHighestReview: false,
        isLowestPrice: false,
        startPrice: state.startPrice,
        endPrice: state.endPrice,
        colorType: state.colorType,
        genderType: state.genderType,
      ),
    );
  }

  void filterGenderType(int type) {
    emit(
      FilterState.initial(
        genderType: type,
        startPrice: state.startPrice,
        colorType: state.colorType,
        endPrice: state.endPrice,
        isHighestReview: state.isHighestReview,
        isLowestPrice: state.isHighestReview,
        isMostRecent: state.isMostRecent,
      ),
    );
  }

  void filterColorType(int type) {
    emit(
      FilterState.initial(
        colorType: type,
        startPrice: state.startPrice,
        endPrice: state.endPrice,
        isHighestReview: state.isHighestReview,
        isLowestPrice: state.isHighestReview,
        isMostRecent: state.isMostRecent,
        genderType: state.genderType,
      ),
    );
  }

  void filterPrice(double? startPrice, double? endPrice) {
    emit(
      FilterState.initial(
        startPrice: startPrice,
        endPrice: endPrice,
        isHighestReview: state.isHighestReview,
        isLowestPrice: state.isHighestReview,
        isMostRecent: state.isMostRecent,
        genderType: state.genderType,
        colorType: state.colorType,
      ),
    );
  }

  @override
  FilterState? fromJson(Map<String, dynamic> json) {
    return FilterState.initial(
      isLowestPrice: json['isLowestPrice'],
      isHighestReview: json['isHighestReview'],
      isMostRecent: json['isMostRecent'],
      genderType: json['genderType'],
      colorType: json['colorType'],
      startPrice: json['startPrice'],
      endPrice: json['endPrice'],
    );
  }

  @override
  Map<String, dynamic>? toJson(FilterState state) {
    return {
      'isLowestPrice': state.isLowestPrice,
      'isHighestReview': state.isHighestReview,
      'isMostRecent': state.isMostRecent,
      'genderType': state.genderType,
      'colorType': state.colorType,
      'startPrice': state.startPrice,
      'endPrice': state.endPrice,
    };
  }
}
