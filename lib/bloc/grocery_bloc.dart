import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery101/service/api.dart';
import 'package:meta/meta.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final _apiService = ApiServiceProvider();
  GroceryBloc() : super(GroceryInitial()) {
    on<GroceryEvent>((event, emit) async {
      emit(GroceryLoading());
      try {
        final activity = await _apiService.fetchActivity();
        emit(GrocerySuccess(itemss: activity!));
      } catch (e) {
        emit(GroceryInitial());
      }
    });
  }
}
