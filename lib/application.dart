import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/config/app_theme.dart';
import 'package:flutter_exam/states/cubit/theme/cubit/theme_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_router.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 895),
      builder: (context, state) {
        return BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: state.theme == AppTheme.light
                  ? Themings.lightTheme
                  : Themings.darkTheme,
              // theme: isDark ? ThemeData.dark() : ThemeData.dark(),
              // theme: Themings.lightTheme,
              // darkTheme: Themings.darkTheme,
              // themeMode: ThemeMode.system,
              //localizationsDelegates: context.localizationDelegates,
              //supportedLocales: context.supportedLocales,
              //locale: context.locale,
              routeInformationProvider:
                  AppRouter.goRouter.routeInformationProvider,
              routeInformationParser: AppRouter.goRouter.routeInformationParser,
              routerDelegate: AppRouter.goRouter.routerDelegate,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    final FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child ?? const SizedBox.shrink(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
