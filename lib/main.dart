import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/repository/RepositoryAbseni.dart';
import 'package:sihr/source/repository/RepositoryAuth.dart';
import 'package:sihr/source/repository/RepositoryShift.dart';
import 'package:sihr/source/repository/repositoryCuti.dart';
import 'package:sihr/source/repository/repositoryIzin.dart';
import 'package:sihr/source/repository/repositoryLembur.dart';
import 'package:sihr/source/repository/repositoryPegawai.dart';
import 'package:sihr/source/router/router.dart';
import 'package:sihr/source/service/Absensi/cubit/get_absensi_cubit.dart';
import 'package:sihr/source/service/Absensi/cubit/post_absensi_cubit.dart';
import 'package:sihr/source/service/Auth/cubit/auth_cubit.dart';
import 'package:sihr/source/service/CheckPermission/cubit/check_permission_cubit.dart';
import 'package:sihr/source/service/Cuti/cubit/create_cuti_cubit.dart';
import 'package:sihr/source/service/Cuti/cubit/get_cuti_cubit.dart';
import 'package:sihr/source/service/Cuti/cubit/jenis_cuti_cubit.dart';
import 'package:sihr/source/service/Izin/cubit/create_izin_cubit.dart';
import 'package:sihr/source/service/Izin/cubit/get_izin_cubit.dart';
import 'package:sihr/source/service/Izin/cubit/jenis_izin_cubit.dart';
import 'package:sihr/source/service/Lembur/cubit/create_lembur_cubit.dart';
import 'package:sihr/source/service/Lembur/cubit/get_lembur_cubit.dart';
import 'package:sihr/source/service/MarkerLocation/cubit/marker_location_cubit.dart';
import 'package:sihr/source/service/Shift/cubit/get_shift_cubit.dart';
import 'package:sihr/source/service/pegawai/cubit/get_pegawai_cubit.dart';

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
        RepositoryProvider(create: (context) => AuhtRepository()),
        RepositoryProvider(create: (context) => PegawaiRepository()),
        RepositoryProvider(create: (context) => AbsensiRepository()),
        RepositoryProvider(create: (context) => ShiftRepository()),
        RepositoryProvider(create: (context) => CutiRepository()),
        RepositoryProvider(create: (context) => LemburRepository()),
        RepositoryProvider(create: (context) => IzinRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit(repository: AuhtRepository())),
          BlocProvider(create: (context) => MarkerLocationCubit()),
          BlocProvider(create: (context) => CheckPermissionCubit()),
          // PEGAWAI
          BlocProvider(create: (context) => GetPegawaiCubit(repository: PegawaiRepository())),
          // ABSENSI
          BlocProvider(create: (context) => PostAbsensiCubit(repository: AbsensiRepository())),
          BlocProvider(create: (context) => GetAbsensiCubit(repository: AbsensiRepository())),
          //  SHIFT
          BlocProvider(create: (context) => GetShiftCubit(repository: ShiftRepository())),
          // CUTI
          BlocProvider(create: (context) => JenisCutiCubit(repository: CutiRepository())),
          BlocProvider(create: (context) => CreateCutiCubit(repository: CutiRepository())),
          BlocProvider(create: (context) => GetCutiCubit(repository: CutiRepository())),
          // LEMBUR
          BlocProvider(create: (context) => CreateLemburCubit(repository: LemburRepository())),
          BlocProvider(create: (context) => GetLemburCubit(repository: LemburRepository())),
          // IZIN
          BlocProvider(create: (context) => JenisIzinCubit(repository: IzinRepository())),
          BlocProvider(create: (context) => CreateIzinCubit(repository: IzinRepository())),
          BlocProvider(create: (context) => GetIzinCubit(repository: IzinRepository())),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: hijau,
            primaryColorLight: hijauLight,
            primaryColorDark: hijauDark,
            scaffoldBackgroundColor: whiteCustom,
            secondaryHeaderColor: whiteCustom,
            colorScheme: ColorScheme.fromSeed(
              seedColor: whiteCustom,
              brightness: Brightness.light, // or Brightness.dark
              // primary: whiteCustom, // Main color of the app
              onPrimary: Colors.white, // Text color on top of the primary color
              // secondary: whiteCustom, // Used for accents, buttons, etc.
              onSecondary: Colors.black, // Text color on top of the secondary color
              surface: Colors.white, // Background of cards, dialogs, etc.
              onSurface: Colors.black, // Text color on top of surfaces
              error: Colors.red, // Color for errors
              onError: Colors.red, // Text color on top of the error color
            ),
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
