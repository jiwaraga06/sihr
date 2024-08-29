import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        providers: [BlocProvider(create: (context) => AuthCubit())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: Colors.green,
            primaryColorLight: Colors.lightGreen,
            primaryColorDark: Colors.green[800],
            scaffoldBackgroundColor: Colors.green[50],
            appBarTheme: const AppBarTheme(color: Colors.green),
          ),
          builder: EasyLoading.init(),
          onGenerateRoute: router!.generateRoute,
        ),
      ),
    );
  }
}
