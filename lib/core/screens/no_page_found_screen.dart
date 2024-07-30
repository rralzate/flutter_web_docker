import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundScreen extends StatefulWidget {
  const NoPageFoundScreen({super.key});

  @override
  State<NoPageFoundScreen> createState() => _NoPageFoundScreenState();
}

class _NoPageFoundScreenState extends State<NoPageFoundScreen> {
  final homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    super.initState();
    homeBloc.add(const SetCurrentScreenEvent(currentScreen: '/404'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider.value(
        value: homeBloc,
        child: Text(
          '404 - Page not found',
          style: GoogleFonts.montserratAlternates(
              fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
