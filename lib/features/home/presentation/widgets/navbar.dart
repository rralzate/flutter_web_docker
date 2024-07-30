import '../bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notifications_indicator.dart';
import 'search_text.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
    required this.homeBloc,
  });

  final HomeBloc homeBloc;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: widget.homeBloc.authBloc,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: builBoxDecoraion(),
        child: Row(
          children: [
            if (size.width <= 700)
              IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () => widget.homeBloc.add(OpenMenuEvent()),
              ),
            const SizedBox(
              width: 5,
            ),
            if (size.width > 300)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: const SearchText(),
              ),
            const Spacer(),
            const NotificationsIndicator(),
            const SizedBox(
              width: 10,
            ),
            //const NavbarAvatar(),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration builBoxDecoraion() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
