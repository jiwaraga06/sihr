part of '../index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  final iconList = <IconData>[
    FontAwesomeIcons.home,
    FontAwesomeIcons.receipt,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network("https://api.hris.rsuumc.com/storage/assets/img/logo_perusahaan/logo_18202f7a1457cf1f28b3d63f7c450485.png", height: 60),
        ],
      ),
      floatingActionButton: FloatingActionButton(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60)
      ),
        onPressed: () {},
        child: Icon(FontAwesomeIcons.fingerprint, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? hijauDark : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              if (index == 0)
                Text(
                  'Home',
                  style: TextStyle(color: color, fontSize: 12),
                ),
              if (index == 1)
                Text(
                  'Data Absensi',
                  style: TextStyle(color: color, fontSize: 12),
                ),
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _selectedIndex,
        splashColor: hijauLight,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
