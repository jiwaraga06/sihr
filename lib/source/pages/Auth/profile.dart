part of '../index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void logout() {
    MyDialog.dialogInfo(context, "Apakah anda ingin keluar ?", () {}, () {
      BlocProvider.of<AuthCubit>(context).logout(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AuthLoaded == false) {
            return Container();
          }
          var data = (state as AuthLoaded).json;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                  ),
                  const SizedBox(height: 28),
                  AutoSizeText("Informasi Pribadi", maxLines: 1, style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
                  const SizedBox(height: 20),
                  AutoSizeText("Alamat Email", maxLines: 1, style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
                  const SizedBox(height: 15),
                  CustomField(readOnly: true, initialValue: data['email']),
                  const SizedBox(height: 28),
                  AutoSizeText("Username", maxLines: 1, style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
                  const SizedBox(height: 15),
                  CustomField(readOnly: true, initialValue: data['username']),
                  const SizedBox(height: 28),
                  AutoSizeText("Nomor Ponsel", maxLines: 1, style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
                  const SizedBox(height: 15),
                  CustomField(readOnly: true, initialValue: data['phoneNumber']),
                  const SizedBox(height: 30),
                  CustomButton(
                    onTap: logout,
                    backgroundColor: merah,
                    text: "Keluar Akun",
                    textStyle: TextStyle(color: whiteCustom, fontFamily: 'JakartaSansSemiBold', fontSize: 18),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
