import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/gen/assets.gen.dart';
import 'package:blott_assessment/l10n/l10n.dart';
import 'package:blott_assessment/presentation/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static PageRoute<NotificationPage> route() =>
      MaterialPageRoute(builder: (context) => const NotificationPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.images.chatIcon.svg(),
                      const Gap(30),
                      Text(
                        l10n.notificationTitle,
                        style: textTheme.titleLarge,
                      ),
                      const Gap(10),
                      Text(
                        l10n.notificationSubtitle,
                        textAlign: TextAlign.center,
                        style: textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Permission.notification.request(),
                //Navigator.of(context).push(HomePage.route()),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, 60),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  l10n.continueBtnText,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
