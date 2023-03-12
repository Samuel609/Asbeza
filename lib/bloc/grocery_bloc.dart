import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery101/model/Item.dart';
import 'package:grocery101/service/api.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final _apiService = ApiServiceProvider();
  List history = [];
  GroceryBloc() : super(GroceryInitial()) {
    on<GroceryFetchEvent>((event, emit) async {
      emit(GroceryLoading());
      try {
        final activity = await _apiService.fetchActivity();
        emit(GrocerySuccess(itemss: activity!, history: history));
      } catch (e) {
        emit(GroceryInitial());
      }
    });

    on<HistoryEvent>((event, emit) => {history.add(event.data)});
  }
}
