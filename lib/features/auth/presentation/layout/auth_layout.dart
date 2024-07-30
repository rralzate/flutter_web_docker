import 'package:flutter/material.dart';
import 'package:flutter_web_docker/features/auth/presentation/layout/custom_title.dart';
import 'package:flutter_web_docker/features/auth/presentation/widgets/background_movies.dart';

import '../../../../core/theme/colors.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
          child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ? _DesktopBody(
                  child: child,
                )
              : _MobileBody(
                  child: child,
                ),
        ],
      )),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: primaryColor,
      child: Row(
        children: [
          const Expanded(
            child: BackgroundMovies(),
          ),
          SizedBox(
            width: 600,
            height: double.infinity,
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const CustomTitle(),
              Expanded(
                child: child,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomTitle(),
          SizedBox(
            //width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundMovies(),
          )
        ],
      ),
    );
  }
}
