import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/session_cubit.dart';
import 'i18n/strings.g.dart';

void main() {
  configureDependencies();
  final router = buildAppRouter();
  runApp(TranslationProvider(child: StsApp(router: router)));
}

class StsApp extends StatelessWidget {
  const StsApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SessionCubit>(),
      child: MaterialApp.router(
        title: 'AP Stock Transfer System',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        routerConfig: router,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 599, name: MOBILE),
            const Breakpoint(start: 600, end: 1023, name: TABLET),
            const Breakpoint(start: 1024, end: 1919, name: DESKTOP),
            const Breakpoint(start: 1920, end: double.infinity, name: '4K'),
          ],
        ),
      ),
    );
  }
}
