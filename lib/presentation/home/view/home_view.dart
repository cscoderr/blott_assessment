import 'dart:convert';

import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/injector.dart';
import 'package:blott_assessment/l10n/l10n.dart';
import 'package:blott_assessment/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final userJson = getIt<InAppMemory>().read('user') as String;
    final user =
        UserModel.fromJson(jsonDecode(userJson) as Map<String, dynamic>);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 181,
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
              decoration: const BoxDecoration(
                color: Color(0xFF05021B),
              ),
              child: Text(
                l10n.homeTitle(user.firstName),
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 130,
            child: BlocBuilder<MarketNewsCubit, MarketNewsState>(
              builder: (context, state) {
                if (state is MarketNewsSuccess) {
                  return RefreshIndicator(
                    onRefresh: () => context
                        .read<MarketNewsCubit>()
                        .getMarketNews(isRefresh: true),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) => NewsCard(
                        data: state.data[index],
                      ),
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: state.data.length,
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
