import '../../../../core/services/navigation_service.dart';
import '../../../../core/routes/routes_constants.dart';

import '../../../../core/widgets/text_separator.dart';
import '../bloc/home_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors.dart';

import 'logo.dart';
import 'menu_item.dart';
import 'internal_menu.dart';
import 'sub_menu_item.dart';
import 'internal_sub_menu.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    required this.homeBloc,
  });

  final HomeBloc homeBloc;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isVisibleMenuItemDevices = false;
  bool isVisibleSubMenuItemDevices = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  bool isVisible6 = false;
  bool isVisible7 = false;
  bool isAuthenticated = false;
  String currentScreen = '';

  void replaceTo(String routeName) async {
    widget.homeBloc.add(SetCurrentScreenEvent(currentScreen: routeName));
    NavigationService.replaceTo(routeName);
    widget.homeBloc.add(CloseMenuEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      decoration: builBoxDecoration(),
      child: BlocProvider.value(
        value: widget.homeBloc,
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessCurrentScreenState) {
              currentScreen = state.currentScreenState;
            }
          },
          builder: (context, state) {
            return ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                const Logo(),
                const SizedBox(
                  height: 50,
                ),
                MenuItem(
                    isActive: currentScreen == RoutesConstants.dashBoardRoute,
                    text: 'Inicio',
                    icon: Icons.home_rounded,
                    iconVisible: false,
                    onPressed: () => replaceTo(RoutesConstants.dashBoardRoute)),
                MenuItem(
                    text: 'Dispositivos',
                    icon: Icons.attractions_rounded,
                    onPressed: () {
                      setState(() {
                        isVisibleMenuItemDevices = !isVisibleMenuItemDevices;
                      });
                    }),
                Visibility(
                  visible: isVisibleMenuItemDevices,
                  child: Column(
                    children: [
                      InternalMenu(
                          text: 'Administración',
                          onPressed: () {
                            setState(() {
                              isVisibleSubMenuItemDevices =
                                  !isVisibleSubMenuItemDevices;
                            });
                          }),
                      Visibility(
                          visible: isVisibleSubMenuItemDevices,
                          child: Column(
                            children: [
                              InternalSubMenu(
                                isActive: currentScreen ==
                                    RoutesConstants.devicesRoute,
                                text: 'Dispositivos',
                                onPressed: () =>
                                    replaceTo(RoutesConstants.devicesRoute),
                              ),
                              InternalSubMenu(
                                isActive: currentScreen ==
                                    RoutesConstants.categoriesRoute,
                                text: 'Categorias',
                                onPressed: () =>
                                    replaceTo(RoutesConstants.categoriesRoute),
                              ),
                              InternalSubMenu(
                                text: 'Subcategorias',
                                onPressed: () => replaceTo(
                                    RoutesConstants.subCategoriesRoute),
                              ),
                            ],
                          )),
                      SubMenuItem(
                        text: 'Hoja de vida',
                        onPressed: () => replaceTo(RoutesConstants.resumeRoute),
                      ),
                      SubMenuItem(text: 'Movimientos', onPressed: () {}),
                    ],
                  ),
                ),
                MenuItem(
                    text: 'Sedes',
                    icon: Icons.apartment_rounded,
                    onPressed: () {}),
                const SizedBox(
                  height: 30,
                ),
                const TextSeparator(text: 'Salir'),
                MenuItem(
                    text: 'Cerrar sesión',
                    icon: Icons.exit_to_app_rounded,
                    iconVisible: false,
                    onPressed: () {
                      // widget.homeBloc.authBloc.add(LogOutUserEvent());
                      // widget.homeBloc.authBloc.add(
                      //     const IsAuthenticatedEvent(isAuthenticated: false));

                      // Restart.restartApp(webOrigin: '');
                    }),
              ],
            );
          },
        ),
      ),
    );
  }

  BoxDecoration builBoxDecoration() => const BoxDecoration(
          gradient:
              LinearGradient(colors: [primaryColor, primaryGradientColor]),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]);
}
