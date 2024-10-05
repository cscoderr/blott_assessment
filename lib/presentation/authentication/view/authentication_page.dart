import 'package:blott_assessment/injector.dart';
import 'package:blott_assessment/presentation/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  static PageRoute<AuthenticationPage> route() =>
      MaterialPageRoute(builder: (context) => const AuthenticationPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
        registerUsecase: getIt(),
      ),
      child: const AuthenticationView(),
    );
  }
}
