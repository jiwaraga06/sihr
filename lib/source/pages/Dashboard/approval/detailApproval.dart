part of '../../index.dart';

class ApprovalDetailScreen extends StatefulWidget {
  const ApprovalDetailScreen({super.key});

  @override
  State<ApprovalDetailScreen> createState() => _ApprovalDetailScreenState();
}

class _ApprovalDetailScreenState extends State<ApprovalDetailScreen> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerKeterangan = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void submit() {
    print(menuApproval);
    print(idApproval);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      controllerNama = TextEditingController(text: namaApproval);
      controllerTanggal = TextEditingController(text: tanggalApproval);
      controllerKeterangan = TextEditingController(text: keteranganApproval);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Approval', style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      body: BlocListener<ApprovalCubit, ApprovalState>(
        listener: (context, state) {
          if (state is ApprovalLoading) {
            MyDialog.dialogLoading(context);
          }
          if (state is ApprovalFailed) {
            Navigator.of(context).pop();
            var data = state.json;
            var statusCode = state.statusCode;
            if (statusCode == 403) {
              MyDialog.dialogAlert2(context, data['message'], onPressedOk: () {
                Navigator.of(context).pop();
                BlocProvider.of<GetCutiCubit>(context).getCuti(context);
              });
            } else {
              MyDialog.dialogAlert2(context, data['errors'].toString());
            }
          }
          if (state is ApprovalLoaded) {
            Navigator.of(context).pop();
            var data = state.json;
            var statusCode = state.statusCode;
            MyDialog.dialogSuccess(context, "Successfully !", onPressedOk: () {
              Navigator.of(context).pop();
              if (menuApproval == "cuti") {
                BlocProvider.of<GetCutiCubit>(context).getCuti(context);
              } else if (menuApproval == "izin") {
                BlocProvider.of<GetIzinCubit>(context).getizin(context);
              } else if (menuApproval == "lembur") {
                BlocProvider.of<GetLemburCubit>(context).getLembur(context);
              }
            });
          }
        },
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText("Nama Pegawai", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: false,
                      controller: controllerNama,
                      preffixIcon: const Icon(FontAwesomeIcons.user),
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 20),
                  const AutoSizeText("Tanggal", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: false,
                      controller: controllerTanggal,
                      preffixIcon: const Icon(FontAwesomeIcons.calendar),
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 20),
                  const AutoSizeText("Keterangan", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: false,
                      controller: controllerKeterangan,
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      maxline: 4,
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: CustomButton2(
                      onTap: submit,
                      text: "Submit",
                      backgroundColor: hijauTeal1,
                      textStyle: const TextStyle(color: whiteCustom, fontSize: 20, fontFamily: 'JakartaSansSemiBold'),
                      roundedRectangleBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
