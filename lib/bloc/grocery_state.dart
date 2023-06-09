part of 'grocery_bloc.dart';

abstract class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GrocerySuccess extends GroceryState {
  final List itemss;
  final List history;
  const GrocerySuccess({required this.itemss, required this.history});
}
