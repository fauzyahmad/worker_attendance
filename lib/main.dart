import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worker_attendace/core/service/navigation_service.dart';
import 'package:worker_attendace/core/utils/custom_theme.dart';
import 'package:worker_attendace/locator.dart';
import 'package:worker_attendace/providers.dart';
import 'package:worker_attendace/routes.dart';
import 'package:worker_attendace/ui/view/startup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: customTheme,
        navigatorKey: locator<NavigationService>().navigationKey,
        home: StartupScreen(),
        routes: routesCustom,
      ),
    );
  }
}
