part of '../../index.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPengumumanCubit>(context).getPengumuman(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: hijau,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(child: Text("KHUSUS", style: TextStyle(fontFamily: 'JakartaSansBold'))),
              Tab(child: Text("UMUM", style: TextStyle(fontFamily: 'JakartaSansBold'))),
            ],
          ),
          title: Text('Berita', style: TextStyle(fontFamily: 'JakartaSansMedium')),
        ),
        body: TabBarView(
          children: [
            tipeKhusus(context),
            tipeUmum(context),
          ],
        ),
      ),
    );
  }
}

Widget tipeUmum(BuildContext context) {
  return BlocBuilder<GetPengumumanCubit, GetPengumumanState>(
    builder: (context, state) {
      if (state is GetPengumumanLoading) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
          child: Column(
            children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
          ),
        );
      }
      if (state is GetPengumumanFailed) {
        var data = state.json;
        return Center(child: Text(data['message']));
      }
      if (state is GetPengumumanLoaded == false) {
        return Container();
      }
      var data = (state as GetPengumumanLoaded).model;
      List datafilter = data!.dataPengumuman!.where((e) => e.jenis!.status == 1 && e.tipe == "Umum").toList();
      if (datafilter.isEmpty) {
        return const Center(child: Text("Data Kosong"));
      }
      return Container(
        padding: const EdgeInsets.all(12),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            BlocProvider.of<GetPengumumanCubit>(context).getPengumuman(context);
          },
          child: ListView.builder(
            itemCount: datafilter.length,
            itemBuilder: (context, index) {
              var a = datafilter[index];
              return Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: hijauLight2, borderRadius: BorderRadius.circular(12)),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    color: whiteCustom2,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(a.namaPengumuman!, style: const TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 12)),
                        subtitle: Text(a.isi!, style: const TextStyle(fontFamily: 'MontserratMedium', fontSize: 11)),
                        trailing: Text(formatDate(a.tanggal), style: const TextStyle(fontFamily: 'MontserratMedium', fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

Widget tipeKhusus(BuildContext context) {
  return BlocBuilder<GetPengumumanCubit, GetPengumumanState>(
    builder: (context, state) {
      if (state is GetPengumumanLoading) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
          child: Column(
            children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
          ),
        );
      }
      if (state is GetPengumumanFailed) {
        var data = state.json;
        return Center(child: Text(data['message']));
      }
      if (state is GetPengumumanLoaded == false) {
        return Container();
      }
      var data = (state as GetPengumumanLoaded).model;
      List datafilter = data!.dataPengumuman!.where((e) => e.jenis!.status == 1 && e.tipe == "Khusus").toList();
      if (datafilter.isEmpty) {
        return const Center(child: Text("Data Kosong"));
      }
      return Container(
        padding: const EdgeInsets.all(12),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            BlocProvider.of<GetPengumumanCubit>(context).getPengumuman(context);
          },
          child: ListView.builder(
            itemCount: datafilter.length,
            itemBuilder: (context, index) {
              var a = datafilter[index];
              return Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: hijauLight2, borderRadius: BorderRadius.circular(12)),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    color: whiteCustom2,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(a.namaPengumuman!, style: const TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 12)),
                        subtitle: Text(a.isi!, style: const TextStyle(fontFamily: 'MontserratMedium', fontSize: 11)),
                        trailing: Text(formatDate(a.tanggal), style: const TextStyle(fontFamily: 'MontserratMedium', fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
