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
            Image.network("https://api.hris.rsuumc.com/storage/assets/img/logo_perusahaan/logo_e629cec4f652fd5211e5f7eeb4324a70.png", height: 180),
            const SizedBox(height: 15),
            const CircularProgressIndicator(color: Colors.blue)
          ],
        ),
      ),
    );
  }
}
