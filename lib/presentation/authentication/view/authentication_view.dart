import 'dart:convert';

import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/gen/assets.gen.dart';
import 'package:blott_assessment/injector.dart';
import 'package:blott_assessment/l10n/l10n.dart';
import 'package:blott_assessment/presentation/authentication/authentication.dart';
import 'package:blott_assessment/presentation/authentication/bloc/register_bloc.dart';
import 'package:blott_assessment/presentation/notification/view/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final state = context.watch<RegisterBloc>().state;

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          getIt<InAppMemory>().write(
            'user',
            jsonEncode(state.user!.toModel().toJson()),
          );
          Navigator.of(context).push(NotificationPage.route());
        }
      },
      child: AppOverlayLoader(
        isLoading: state.status.isInProgress,
        child: Scaffold(
          backgroundColor: AppColors.secondaryBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.authenticationHeaderTitle,
                    style: textTheme.titleLarge,
                  ),
                  const Gap(30),
                  Text(
                    l10n.authenticationHeaderSubtitle,
                    style: textTheme.titleSmall,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Gap(30),
                        TextField(
                          style: textTheme.bodyLarge,
                          onChanged: (firstName) => context
                              .read<RegisterBloc>()
                              .add(RegisterFirstNameChanged(firstName)),
                          decoration: InputDecoration(
                            hintText: l10n.firstName,
                          ),
                        ),
                        const Gap(20),
                        TextField(
                          style: textTheme.bodyLarge,
                          onChanged: (lastName) => context
                              .read<RegisterBloc>()
                              .add(RegisterLastNameChanged(lastName)),
                          decoration: InputDecoration(
                            hintText: l10n.lastName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: state.isValid
                          ? () => context
                              .read<RegisterBloc>()
                              .add(const RegisterSubmitted())
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Theme.of(context).primaryColor,
                        fixedSize: const Size(60, 60),
                      ),
                      child: Assets.images.chevronRight.svg(),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
