part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeEventFetchProducts extends HomeEvent {
  const HomeEventFetchProducts();

  @override
  List<Object?> get props => [];
}
