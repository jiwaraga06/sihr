part of '../../index.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({super.key});

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absensi"),
      ),
    );
  }
}