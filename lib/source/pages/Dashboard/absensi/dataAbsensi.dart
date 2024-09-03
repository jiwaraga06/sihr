part of '../../index.dart';

class DataAbsensiScreen extends StatefulWidget {
  const DataAbsensiScreen({super.key});

  @override
  State<DataAbsensiScreen> createState() => _DataAbsensiScreenState();
}

class _DataAbsensiScreenState extends State<DataAbsensiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Absensi"),
      ),
    );
  }
}