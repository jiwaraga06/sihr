part of '../../index.dart';

class CreateLogBookPerawatScreen extends StatefulWidget {
  const CreateLogBookPerawatScreen({super.key});

  @override
  State<CreateLogBookPerawatScreen> createState() => _CreateLogBookPerawatScreenState();
}

class _CreateLogBookPerawatScreenState extends State<CreateLogBookPerawatScreen> {
  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerJumlah = TextEditingController();
  var valueMasterlogBook;
  final formkey = GlobalKey<FormState>();
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

  void submit() {
    if (formkey!.currentState!.validate()) {
      BlocProvider.of<CreateLogBookPerawatCubit>(context).createlogbook(context, controllerTanggal.text, controllerJumlah.text, valueMasterlogBook);
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MasterLogBookCubit>(context).getMasterLogBook(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Log Book", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      body: BlocListener<CreateLogBookPerawatCubit, CreateLogBookPerawatState>(
        listener: (context, state) {
          if (state is CreateLogBookPerawatLoading) {
            MyDialog.dialogLoading(context);
          }
          if (state is CreateLogBookPerawatFailed) {
            Navigator.of(context).pop();
            var data = state.json;
            var statusCode = state.statusCode;
            if (statusCode == 403) {
              MyDialog.dialogAlert2(context, data['message'], onPressedOk: () {
                Navigator.of(context).pop();
                BlocProvider.of<GetLogBookCubit>(context).getLogBook(context);
              });
            } else {
              MyDialog.dialogAlert(context, data['errors'].toString());
            }
          }
          if (state is CreateLogBookPerawatLoaded) {
            Navigator.of(context).pop();
            var data = state.json;
            var statusCode = state.statusCode;
            MyDialog.dialogSuccess(context, data['message'].toString(), onPressedOk: () {
              Navigator.of(context).pop();
              BlocProvider.of<GetLogBookPerawatCubit>(context).getLogBookPerawat(context);
            });
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText("Tanggal Pembuatan", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: true,
                      controller: controllerTanggal,
                      onTap: pickdate,
                      preffixIcon: const Icon(FontAwesomeIcons.calendar),
                      textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14),
                      messageError: "Kolom tidak boleh kosong"),
                  const SizedBox(height: 20),
                  const AutoSizeText("Kategori", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  BlocBuilder<MasterLogBookCubit, MasterLogBookState>(
                    builder: (context, state) {
                      if (state is MasterLogBookLoading) {
                        return CustomField(readOnly: true, hintText: "Kategori ", textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14));
                      }
                      if (state is MasterLogBookLoaded == false) {
                        return CustomField(
                            readOnly: true, controller: controllerTanggal, textstyle: const TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14));
                      }
                      var data = (state as MasterLogBookLoaded).model;
                      return Container(
                        child: DropdownButtonFormField(
                          hint: const Text("Kategori Log Book"),
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: merah, strokeAlign: 20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.8), width: 2),
                            ),
                          ),
                          // value: valueMasterlogBook,
                          items: data!.dataMaster!.map((e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child: Text(e.namaLog!),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              valueMasterlogBook = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return 'Kategori Log Book tidak boleh kosong';
                            }
                            return null; // If validation is passed
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const AutoSizeText("Jumlah", maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16)),
                  const SizedBox(height: 12),
                  CustomField(
                      readOnly: false,
                      controller: controllerJumlah,
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