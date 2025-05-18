import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matule/core/router/router.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:matule/layers/presentation/shared/ui/async_drawer_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  try {
    Get.put<AsyncDrawerController>(AsyncDrawerController());
    await dotenv.load(fileName: ".env");
    await Supabase.initialize(
        url: dotenv.env['URL']!, anonKey: dotenv.env['API_KEY']!);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterAppConfig().router,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(),
          scaffoldBackgroundColor: ColorSettings().background,
          platform: TargetPlatform.iOS,
          primaryColor: ColorSettings().accent,
          colorScheme: ColorScheme.light(primary: ColorSettings().accent),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? ColorSettings().red
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
