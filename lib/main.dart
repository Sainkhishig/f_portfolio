import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:afen_portfolio/res/constants.dart';
import 'package:afen_portfolio/view/splash/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:afen_portfolio/core/LocaleCont.dart';
import 'package:get/get.dart';

import 'common/enum/common_enum.dart';
import 'core/AppLocalization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LocaleCont());
  if (Uri.base.query.isNotEmpty) {
    var langCode = Uri.base.queryParameters['lang'];
    print("localSet:$langCode");
    LocaleType locale = langCode == "en"
        ? LocaleType.en
        : langCode == "mn"
            ? LocaleType.mn
            : LocaleType.ja;
    Get.find<LocaleCont>().updateLocale(Locale(locale.id, locale.label));
    // currencyMark = "\$";
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleCont>(
        builder: (cont) => MaterialApp(
            // scaffoldMessengerKey: scaffoldMessengerKey,
            locale: cont.locale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalization.delegate,
            ],
            debugShowCheckedModeBanner: false,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale!.languageCode &&
                    locale.countryCode == deviceLocale.countryCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            supportedLocales: const [
              Locale('mn', 'MN'), // English, no country code
              Locale('ja', 'JP'), // English, no country code
              Locale('en', 'EN'), // English, no country code
            ],
            // routeInformationParser: router.routeInformationParser,
            // routerDelegate: router.routerDelegate,
            title: 'Portfolio S.A',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              scaffoldBackgroundColor: bgColor,
              useMaterial3: true,
              textTheme:
                  GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
                      .apply(
                        bodyColor: Colors.white,
                      )
                      .copyWith(
                        bodyLarge: const TextStyle(color: bodyTextColor),
                        bodyMedium: const TextStyle(color: bodyTextColor),
                      ),
            ),
            home: const SplashView()));
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     localizationsDelegates: const [
    //       GlobalMaterialLocalizations.delegate,
    //       GlobalWidgetsLocalizations.delegate,
    //       GlobalCupertinoLocalizations.delegate,
    //       AppLocalization.delegate,
    //     ],
    //     locale: cont.locale,
    //     localizationsDelegates: const [
    //       GlobalMaterialLocalizations.delegate,
    //       GlobalWidgetsLocalizations.delegate,
    //       GlobalCupertinoLocalizations.delegate,
    //       AppLocalization.delegate,
    //     ],
    //     // debugShowCheckedModeBanner: false,
    //     localeResolutionCallback: (deviceLocale, supportedLocales) {
    //       for (var locale in supportedLocales) {
    //         if (locale.languageCode == deviceLocale!.languageCode &&
    //             locale.countryCode == deviceLocale.countryCode) {
    //           return deviceLocale;
    //         }
    //       }
    //       return supportedLocales.first;
    //     },
    //     supportedLocales: const [
    //       Locale('mn', 'MN'), // English, no country code
    //       Locale('en', 'EN'), // English, no country code
    //     ],
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       scaffoldBackgroundColor: bgColor,
    //       useMaterial3: true,
    //       textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
    //           .apply(
    //             bodyColor: Colors.white,
    //           )
    //           .copyWith(
    //             bodyLarge: const TextStyle(color: bodyTextColor),
    //             bodyMedium: const TextStyle(color: bodyTextColor),
    //           ),
    //     ),
    //     home: const SplashView());
  }
}
