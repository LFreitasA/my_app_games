import 'package:flutter/material.dart';
import 'package:my_games/app/data/autenticacao_services.dart';
import 'package:my_games/app/data/http_client/services_http_client.dart';
import 'package:my_games/app/ui/pages/components/build_app.dart';
import 'package:my_games/app/ui/pages/home/home_page.dart';
import 'package:my_games/app/ui/pages/cadastro/cadastro.dart';
import 'package:my_games/app/ui/pages/home_logada/home_logada.dart';
import 'package:my_games/app/ui/pages/login/login.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'app/ui/pages/esqueci_minha_senha/esqueci_minha_senha.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ServicesHttpClient()),
        Provider(
          create: (context) => AutenticacaoServices(httpClient: context.read()),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            dialogTheme: const DialogTheme(
                backgroundColor: Colors.red, shadowColor: Colors.blue),
            secondaryHeaderColor: Colors.pink,
            focusColor: Colors.red,
            highlightColor: Colors.red,
            useMaterial3: true,
            primaryColor: Colors.red,
            indicatorColor: Colors.yellow,
            //brightness: Brightness.dark,
            canvasColor: Colors.amber,
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Colors.red),
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const BuildApp(myFunctionality: HomePage()),
          '/esqueciMinhaSenha': (context) =>
              BuildApp(myFunctionality: EsqueciMinhaSenha()),
          '/cadastrar': (context) =>
              const BuildApp(myFunctionality: Cadastrar()),
          '/login': (context) => BuildApp(myFunctionality: Login()),
          '/home_logada': (context) => BuildApp(myFunctionality: Home_Logada()),
        },
        home: const BuildApp(myFunctionality: HomePage()));
  }
}
