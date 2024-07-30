import 'package:flutter_svg/svg.dart';

import '../../../../core/components/custom_input.dart';
import '../../../../core/components/custom_loading.dart';
import '../../../../core/components/primary_button.dart';
import '../../../../core/constants/blocs.dart';
import '../../../../core/routes/routes_constants.dart';
import '../../../../core/services/notifications_service.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/services/navigation_service.dart';
import '../../../../core/routes/resource_icons.dart';

import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          // ------// ------// ------// ------// ------// ------// ------
          if (state is LoadingPostLoginEmailState) {
            _isLoading = true;
          }
          if (state is FailedPostLoginEmailState) {
            _isLoading = false;
            _setErrors(state);
          }
          if (state is SuccessPostLoginEmailState) {
            _isLoading = false;

            if (state.tokenEntity.isNotEmpty) {
              await _success();
            }
          }
        },
        builder: (context, state) {
          return Stack(children: [
            _principalBody(authBloc, state),
            Visibility(
              visible: _isLoading,
              child: const CustomLoadingScreen(),
            )
          ]);
        },
      ),
    );
  }

  void _setErrors(FailedPostLoginEmailState state) {
    if (state.error == Constants.internetFailureMessage) {
      _errorMessage('No hay conexion a Internet');
    }
    if (state.error == Constants.serverFailureMessage) {
      _errorMessage(state.message);
    }
    if (state.error == Constants.authenticationFailureMessage) {
      _errorMessage('Usuario o clave invalido');
    }
  }

  Future<void> _success() async {
    BlocProvider.of<AuthBloc>(context)
        .add(const IsAuthenticatedEvent(isAuthenticated: true));
    NavigationService.replaceTo(RoutesConstants.dashBoardRoute);
    // FluroRouter.appRouter
    //     .navigateTo(context, RoutesConstants.dashBoardRoute, replace: true);
  }

  Future<void> _errorMessage(String message) async {
    NotificationsService.showSnackbarError(message);
  }

  Container _principalBody(AuthBloc authBloc, AuthState state) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                '¡Ingresa!',
                style: textLogoStyle,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            _middleView(authBloc, state),
            SizedBox(
              height: 1.h,
            ),
            _textButton(),
            SizedBox(
              height: 1.h,
            ),
            _newAccountButton(),
            SizedBox(
              height: 1.h,
            ),
            _bottomButton(authBloc),
          ],
        ),
      ),
    );
  }

  TextButton _textButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {},
      child: Text(
        '¿Olvidaste tu contraseña?',
        style: textStyleNormal(secondColor),
      ),
    );
  }

  TextButton _newAccountButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        NavigationService.navigateTo(RoutesConstants.registerRoute);
      },
      child: Text(
        'Nueva cuenta',
        style: textStyleNormal(mainWhite),
      ),
    );
  }

  Widget _middleView(AuthBloc authBloc, AuthState state) {
    return Form(
      key: authBloc.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: authBloc.emailStream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              return CustomInput(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 1.w),
                  child: const Icon(
                    Icons.email_outlined,
                    color: mainGrey,
                  ),
                ),
                placeholder: 'Email',
                colorInputText: colorWhite,
                keyboardType: TextInputType.emailAddress,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                onChanged: (text) {
                  //Update email to validate
                  authBloc.updateEmail(text);
                },
              );
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          StreamBuilder(
            stream: authBloc.passwordStream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              final visibility = state.showPassword;

              final iconVisibility = GestureDetector(
                onTap: () {
                  authBloc.add(ShowPasswordEvent(!state.showPassword));
                },
                child: visibility
                    ? SvgPicture.asset(
                        height: 2.h,
                        width: 2.w,
                        eyeVisibleSVG,
                        colorFilter:
                            const ColorFilter.mode(colorWhite, BlendMode.srcIn),
                      )
                    : SvgPicture.asset(
                        height: 2.h,
                        width: 2.w,
                        eyeInvisibleSVG,
                        colorFilter: const ColorFilter.mode(
                            secondColor, BlendMode.srcIn),
                      ),
              );

              return CustomInput(
                keyboardType: TextInputType.emailAddress,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 1.w),
                  child: iconVisibility,
                ),
                obscureText: !visibility,
                placeholder: 'Contraseña',
                colorInputText: colorWhite,
                onChanged: (text) {
                  //Update password to validate
                  authBloc.updatePassword(text);
                },
              );
            },
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }

  StreamBuilder _bottomButton(AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.validateLoginForm,
      builder: (context, snapshot) {
        return PrimaryButton(
          onPressed: snapshot.hasData
              ? () async {
                  //await Transversal.service.getCurrentLocation();
                  Future<String> emailFuture = authBloc.emailStream.first;
                  String email = await emailFuture;
                  Future<String> passwordFuture = authBloc.passwordStream.first;
                  String password = await passwordFuture;

                  authBloc.add(PostLoginEmail(
                    email: email.trim(),
                    password: password.trim(),
                  ));
                }
              : null,
          height: 6.h,
          width: 20.w,
          child: Text(
            'Inicio de sesión',
            style:
                snapshot.hasData ? textWhiteStyleButton : textBlackStyleButton,
          ),
        );
      },
    );
  }
}
