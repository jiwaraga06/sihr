part of '../../index.dart';

class DetailSlipGajiScreen extends StatefulWidget {
  const DetailSlipGajiScreen({super.key});

  @override
  State<DetailSlipGajiScreen> createState() => _DetailSlipGajiScreenState();
}

class _DetailSlipGajiScreenState extends State<DetailSlipGajiScreen> {
  var loadingPercentage = 0;
  late final WebViewController? controller;
  var token;
  void getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
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
      ..loadRequest(Uri.parse("https://hris.rsuumc.com/payroll/print-slip/$id_slip_gaji?token=$token"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Slip Gaji"),
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
