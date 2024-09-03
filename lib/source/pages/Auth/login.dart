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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 120, left: 30, right: 30, bottom: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome", style: TextStyle(fontFamily: 'MontserratBold', fontSize: 36)),
                    Text("Back!", style: TextStyle(fontFamily: 'MontserratBold', fontSize: 36)),
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
                      CustomButton(
                        onTap: () {
                          // Navigator.pushNamed(context, dashboardScreen);
                          login();
                        },
                        text: "Login",
                        textStyle: TextStyle(color: whiteCustom, fontSize: 20, fontFamily: 'MontserratSemiBold'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
