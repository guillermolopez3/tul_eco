import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_eco/api/repository/home_repository.dart';
import 'package:tul_eco/modules/home/bloc/home_bloc.dart';
import 'package:tul_eco/modules/home/widgets/home_products_list.dart';
import 'package:tul_eco/widgets/button_cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomePage(),
        settings: const RouteSettings(name: 'Home'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(repository: HomeRepository())
        ..add(const HomeEventFetchProducts()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEventFetchProducts());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeStateInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeStateSuccess) {
            return HomeProductsList(lista: state.products);
          }
          if (state is HomeStateFailure) {
            return const Center(
              child: Text('Error al obtener los datos'),
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: const ButtonCart(),
    );
  }
}
