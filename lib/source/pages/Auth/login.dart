part of '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool hidePassword = true;

  void handlePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void login() {
    BlocProvider.of<AuthCubit>(context).login(controllerEmail.text, controllerPassword.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD9EDBF),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          // if (state is AuthLoading) {
          //   MyDialog.dialogLoading(context);
          // }
          // if (state is AuthLoaded) {
          //   Navigator.of(context).pop();
          //   var json = state.json;
          //   var statusCode = state.statusCode;
          //   if (statusCode == 200) {
          //     // MyDialog.dialogSuccess(context, json['message']);
          //     await Future.delayed(const Duration(seconds: 1));
          //     Navigator.pushNamedAndRemoveUntil(context, dashboardScreen, (Route<dynamic> route) => false);
          //   } else {
          //     MyDialog.dialogAlert(context, json['message']);
          //   }
          // }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.network("https://api.hris.rsuumc.com/storage/assets/img/logo_perusahaan/logo_e629cec4f652fd5211e5f7eeb4324a70.png", height: 80),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome to", style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 20)),
                        SizedBox(width: 4),
                        Text("Si-HR", style: TextStyle(color: Colors.indigo, fontFamily: 'JakartaSansMedium', fontSize: 20)),
                      ],
                    ),
                  ),
                  Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
                      child: Column(
                        children: [
                          CustomField(
                            controller: controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            preffixIcon: Icon(Icons.email),
                            hintText: "Please insert your email",
                          ),
                          const SizedBox(height: 30),
                          CustomField(
                            controller: controllerPassword,
                            hidePassword: hidePassword,
                            preffixIcon: Icon(FontAwesomeIcons.lock),
                            suffixIcon: InkWell(onTap: handlePassword, child: hidePassword ? Icon(FontAwesomeIcons.eyeSlash) : Icon(FontAwesomeIcons.eye)),
                            hintText: "Please insert your password",
                          ),
                          const SizedBox(height: 70),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: CustomButton2(
                              onTap: login,
                              text: "Log in",
                              backgroundColor: hijau,
                              textStyle: TextStyle(color: whiteCustom, fontSize: 20, fontFamily: 'JakartaSansMedium'),
                              roundedRectangleBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
