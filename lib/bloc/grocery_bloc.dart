import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery101/model/Item.dart';
import 'package:grocery101/service/api.dart';
import 'package:grocery101/db/service.dart';

import 'dart:convert';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final _apiService = ApiServiceProvider();
  final _service = Service();
  List history = [];
  List historyLoad = [];
  GroceryBloc() : super(GroceryInitial()) {
    on<GroceryFetchEvent>((event, emit) async {
      emit(GroceryLoading());
      try {
        final activity = await _apiService.fetchActivity();
        await _service.readItem().then((val) => {
              history = val,
            });

        historyLoad = Item.histList(history);
        emit(GrocerySuccess(itemss: activity!, history: historyLoad));
      } catch (e) {
        emit(GroceryInitial());
      }
    });

    on<HistoryEvent>((event, emit) => {
          if (!historyLoad.contains(event.data))
            {
              // _service.wipeDate(),
              historyLoad.add(event.data),
              event.data.addItem = 1,
              _service.saveItem(event.data),
            }
        });
  }
}
