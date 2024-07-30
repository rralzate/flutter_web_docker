import '../bloc/home_bloc.dart';
import '../../../../injection_container.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/sidebar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key, required this.child});

  final Widget child;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  final homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    super.initState();
    HomeBloc.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700)
                  Sidebar(
                    homeBloc: homeBloc,
                  ),
                Expanded(
                  child: Column(
                    children: [
                      //Navbar
                      Navbar(
                        homeBloc: homeBloc,
                      ),
                      //View
                      Expanded(child: widget.child),
                    ],
                  ),
                ),
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                  animation: HomeBloc.menuController,
                  builder: (context, _) => Stack(
                        children: [
                          if (homeBloc.state.isOpen)
                            Opacity(
                              opacity: HomeBloc.opacity.value,
                              child: GestureDetector(
                                onTap: () => homeBloc.add(CloseMenuEvent()),
                                child: Container(
                                  width: size.width,
                                  height: size.height,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          Transform.translate(
                            offset: Offset(
                              HomeBloc.movement.value,
                              0,
                            ),
                            child: Sidebar(
                              homeBloc: homeBloc,
                            ),
                          ),
                        ],
                      )),
          ],
        ));
  }
}
