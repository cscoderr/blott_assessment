import 'package:blott_assessment/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppOverlayLoader extends StatefulWidget {
  const AppOverlayLoader({
    required this.child,
    required this.isLoading,
    super.key,
  });

  final Widget child;
  final bool isLoading;

  @override
  State<AppOverlayLoader> createState() => _AppOverlayLoaderState();
}

class _AppOverlayLoaderState extends State<AppOverlayLoader> {
  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: _key, child: widget.child);
    return widget.isLoading
        ? PopScope(
            canPop: false,
            child: Stack(
              children: [
                child,
                const Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black38,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SpinKitWave(
                    size: 60,
                    duration: const Duration(milliseconds: 1000),
                    itemBuilder: (BuildContext context, int index) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : child;
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.color = AppColors.primaryColor,
    this.value,
    this.dimension = 20,
    this.strokeWidth = 4.0,
    this.useAdaptive = false,
  });

  final Color color;
  final double? value;
  final double dimension;
  final double strokeWidth;
  final bool useAdaptive;

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox.square(
          dimension: dimension,
          child: useAdaptive
              ? CircularProgressIndicator.adaptive(
                  value: value,
                  strokeWidth: strokeWidth,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                )
              : CircularProgressIndicator(
                  value: value,
                  strokeWidth: strokeWidth,
                  color: color,
                ),
        ),
      );
}
