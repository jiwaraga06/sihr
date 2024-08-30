part of '../index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
void initState() {
  super.initState();
  BlocProvider.of<AuthCubit>(context).session(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://api.hris.rsuumc.com/storage/assets/img/logo_perusahaan/logo_18202f7a1457cf1f28b3d63f7c450485.png", height: 60),
          ],
        ),
      ),
    );
  }
}
