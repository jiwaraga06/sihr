part of '../../index.dart';

class CreateLemburScreen extends StatefulWidget {
  const CreateLemburScreen({super.key});

  @override
  State<CreateLemburScreen> createState() => _CreateLemburScreenState();
}

class _CreateLemburScreenState extends State<CreateLemburScreen> {
  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerJamMulai = TextEditingController();
  TextEditingController controllerJamSelesai = TextEditingController();
  TextEditingController controllerKeterangan = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void pilihJamMulai() {
    selectTime(context).then((value) {
      if (value != null) {
        TimeOfDay result = value;
        print(formatTime(result));
        setState(() {
          controllerJamMulai.text = formatTime(result);
        });
      }
    });
  }

  void pilihJamSelesai() {
    selectTime(context).then((value) {
      if (value != null) {
        TimeOfDay result = value;
        print(formatTime(result));
        setState(() {
          controllerJamSelesai.text = formatTime(result);
        });
      }
    });
  }

  void submit() {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<CreateLemburCubit>(context).createLembur(tanggal, controllerJamMulai.text, controllerJamSelesai.text, controllerKeterangan.text, context);
    }
  }

  void pickdate() {
    pickDate(context).then((value) {
      if (value != null) {
        var date = DateFormat('yyyy-MM-dd').format(value);
        setState(() {
          controllerTanggal.text = date;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerTanggal = TextEditingController(text: tanggal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Surat Izin Lembur", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      body: BlocListener<CreateLemburCubit, CreateLemburState>(
        listener: (context, state) {
          if (state is CreateLemburLoading) {
            MyDialog.dialogLoading(context);
          }
          if (state is CreateLemburFailed) {
            Navigator.of(context).pop();
            var data = state.json;
            var statusCode = state.statusCode;
            if (statusCode == 403) {
              MyDialog.dialogAlert(context, data['message']);
            } else {
              MyDialog.dialogAlert(context, data['errors'].toString());
            }
          }
          if (state is CreateLemburLoaded) {
            Navigator.of(context).pop();
            var data = state.json;
            var statusCode = state.statusCode;
            MyDialog.dialogSuccess2(context, 'Successfully');
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText("Tanggal Pembuatan", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: true,
                      controller: controllerTanggal,
                      onTap: pickdate,
                      suffixIcon: const Icon(FontAwesomeIcons.calendar),
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14)),
                  const SizedBox(height: 20),
                  const AutoSizeText("Pilih Jam Mulai", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: true,
                      onTap: pilihJamMulai,
                      controller: controllerJamMulai,
                      suffixIcon: const Icon(FontAwesomeIcons.clock),
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 20),
                  const AutoSizeText("Pilih Jam Selesai", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: true,
                      onTap: pilihJamSelesai,
                      controller: controllerJamSelesai,
                      suffixIcon: const Icon(FontAwesomeIcons.clock),
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 20),
                  const AutoSizeText("Keterangan", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      controller: controllerKeterangan,
                      maxline: 3,
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 40),
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
