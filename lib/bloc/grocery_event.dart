part of 'grocery_bloc.dart';

class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class GroceryFetchEvent extends GroceryEvent {
  const GroceryFetchEvent();

  @override
  List<Object> get props => [];
}

class HistoryEvent extends GroceryEvent {
  final Item itemss;
  const HistoryEvent({required this.itemss});

  @override
  List<Object> get props => [];

  get data => itemss;
}
