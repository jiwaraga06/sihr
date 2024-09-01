import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/repository/RepositoryAuth.dart';
import 'package:sihr/source/router/router.dart';
import 'package:sihr/source/service/Auth/cubit/auth_cubit.dart';

void main() {
  runApp(MyApp(router: RouterNavigation()));
}

class MyApp extends StatelessWidget {
  RouterNavigation? router;
  MyApp({super.key, this.router});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuhtRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthCubit(repository: AuhtRepository()))],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: hijau,
            primaryColorLight: hijauLight,
            primaryColorDark: hijauDark,
            scaffoldBackgroundColor: whiteCustom,
            appBarTheme: const AppBarTheme(color: whiteCustom),
            dialogTheme: DialogTheme(backgroundColor: Colors.white),
            floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: hijauLight),
            inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: hijau, // Warna border aktif global
                    width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey, // Warna border saat tidak aktif secara global
                    width: 1.0),
              ),
            ),
            textSelectionTheme: const TextSelectionThemeData(cursorColor: hijau),
          ),
          builder: EasyLoading.init(),
          onGenerateRoute: router!.generateRoute,
        ),
      ),
    );
  }
}
