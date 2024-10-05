import 'package:blott_assessment/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static PageRoute<HomePage> route() =>
      MaterialPageRoute(builder: (context) => const HomePage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

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
                l10n.homeTitle('Tomiwa'),
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 130,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) => const NewsCard(),
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SizedBox(
      height: 132,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          const Gap(20),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'THE ECONOMIC TIMES',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '12 June 2021',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    r'''Markets FTSE slides almost 2pc as sterling sinks to $1.38''',
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension ContextEx on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
