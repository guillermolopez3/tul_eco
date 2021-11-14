part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();

  @override
  List<Object?> get props => [];
}

class HomeStateInProgress extends HomeState {
  const HomeStateInProgress();

  @override
  List<Object?> get props => [];
}

class HomeStateSuccess extends HomeState {
  final List<Product> products;
  const HomeStateSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class HomeStateFailure extends HomeState {
  final String message;
  const HomeStateFailure(this.message);

  @override
  List<Object?> get props => [message];
}
