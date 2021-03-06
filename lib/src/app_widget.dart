import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/src/features/auth/auth_page.dart';
import 'package:provider_start/src/features/home/home_page.dart';
import 'package:provider_start/src/features/splash/splash_page.dart';
import 'package:provider_start/src/shared/services/client_http.dart';

import 'features/auth/auth_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ClientHttp()),
        ChangeNotifierProvider(
          create: (context) => AuthController(context.read()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/auth': (_) => const AuthPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
