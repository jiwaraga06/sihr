part of '../index.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  var loadingPercentage = 0;
  late final WebViewController? controller;
  var idPegawai;
  void getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    idPegawai = pref.getString("id_pegawai");
  }

  @override
  void initState() {
    super.initState();
    getSession();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://hris.rsuumc.com/pegawai/$idPegawai"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV Saya"),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            WebViewWidget(controller: controller!),
            if (loadingPercentage > 0)
              LinearProgressIndicator(
                value: loadingPercentage / 100,
              )
          ],
        ),
      ),
    );
  }
}
