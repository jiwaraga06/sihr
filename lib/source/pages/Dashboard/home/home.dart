part of '../../index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AuthLoaded == false) {
          return Container();
        }
        var data = (state as AuthLoaded).modelUser;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/images/avatar.png"),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi", style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 16)),
                Text("Raga", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: badges.Badge(
                  badgeContent: Text('1'),
                  child: Icon(FontAwesomeIcons.bell),
                ),
              ),
              const SizedBox(width: 24)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetCardHome(),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: AutoSizeText('Pusat Navigasi', style: TextStyle(fontSize: 18, fontFamily: 'MontserratSemiBold'), maxLines: 1),
                ),
                const SizedBox(height: 10),
                WidgetMenuUtama(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
