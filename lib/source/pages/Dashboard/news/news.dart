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
    return Scaffold(
      appBar: AppBar(
        title: Text("News", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      body: BlocBuilder<GetPengumumanCubit, GetPengumumanState>(
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
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetPengumumanLoaded == false) {
            return Container();
          }
          var data = (state as GetPengumumanLoaded).model;
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetPengumumanCubit>(context).getPengumuman(context);
              },
              child: ListView.builder(
                itemCount: data!.data!.length,
                itemBuilder: (context, index) {
                  var a = data.data![index];
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: hijauLight2, borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.namaJenis!, style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 14)),
                          const SizedBox(height: 8),
                          Text(a.keterangan!, style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
