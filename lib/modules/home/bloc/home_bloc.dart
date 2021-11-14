import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/api/repository/home_repository.dart';
import 'package:tul_eco/models/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(const HomeStateInitial()) {
    on<HomeEventFetchProducts>(_onHomeEventFetchProducts);
  }

  Future<void> _onHomeEventFetchProducts(
      HomeEventFetchProducts event, Emitter emit) async {
    try {
      emit(const HomeStateInProgress());
      final products = await _repository.getProducts();
      emit(HomeStateSuccess(products));
    } catch (e) {
      emit(const HomeStateFailure('Error al consultar los datos'));
    }
  }
}
