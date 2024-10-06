import 'package:blott_assessment/injector.dart';
import 'package:blott_assessment/presentation/home/home.dart';
import 'package:blott_assessment/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static PageRoute<HomePage> route() =>
      MaterialPageRoute(builder: (context) => const HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MarketNewsCubit(getMarketNewsUsecase: getIt())..getMarketNews(),
      child: const HomeView(),
    );
  }
}
