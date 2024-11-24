import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/env/formatDate.dart';
import 'package:sihr/source/env/formatTime.dart';
import 'package:sihr/source/env/pickImage.dart';
import 'package:sihr/source/env/pickMonth.dart';
import 'package:sihr/source/env/pickTime.dart';
import 'package:sihr/source/env/pickdate.dart';
import 'package:sihr/source/env/uploadPDF.dart';
import 'package:sihr/source/router/string.dart';
import 'package:sihr/source/service/Absensi/cubit/get_absensi_cubit.dart';
import 'package:sihr/source/service/Absensi/cubit/get_sisa_absen_cubit.dart';
import 'package:sihr/source/service/Absensi/cubit/jenis_absen_cubit.dart';
import 'package:sihr/source/service/Absensi/cubit/post_absensi_cubit.dart';
import 'package:sihr/source/service/Approval/cubit/approval_cubit.dart';
import 'package:sihr/source/service/Auth/cubit/change_password_cubit.dart';
import 'package:sihr/source/service/Auth/cubit/auth_cubit.dart';
import 'package:sihr/source/service/CheckPermission/cubit/check_permission_cubit.dart';
import 'package:sihr/source/service/Cuti/cubit/create_cuti_cubit.dart';
import 'package:sihr/source/service/Cuti/cubit/get_cuti_cubit.dart';
import 'package:sihr/source/service/Cuti/cubit/jenis_cuti_cubit.dart';
import 'package:sihr/source/service/Izin/cubit/create_izin_cubit.dart';
import 'package:sihr/source/service/Izin/cubit/get_izin_cubit.dart';
import 'package:sihr/source/service/Izin/cubit/jenis_izin_cubit.dart';
import 'package:sihr/source/service/Lembur/cubit/create_lembur_cubit.dart';
import 'package:sihr/source/service/Lembur/cubit/get_lembur_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/create_log_book_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/create_log_book_perawat_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/get_log_book_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/get_log_book_perawat_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/master_log_book_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/update_log_book_cubit.dart';
import 'package:sihr/source/service/LogBook/cubit/update_log_book_perawat_cubit.dart';
import 'package:sihr/source/service/MarkerLocation/cubit/marker_location_cubit.dart';
import 'package:sihr/source/service/Pelatihan/cubit/absen_pelatihan_cubit.dart';
import 'package:sihr/source/service/Pelatihan/cubit/kategori_pelatihan_cubit.dart';
import 'package:sihr/source/service/Pelatihan/cubit/pelatihan_cubit.dart';
import 'package:sihr/source/service/Pengumuman/cubit/get_pengumuman_cubit.dart';
import 'package:sihr/source/service/SlipGaji/cubit/get_slip_gaji_cubit.dart';
import 'package:sihr/source/service/pegawai/cubit/get_pegawai_cubit.dart';
import 'package:sihr/source/widget/customButton.dart';
import 'package:sihr/source/widget/customButton2.dart';
import 'package:sihr/source/widget/customDialog.dart';
import 'package:sihr/source/widget/customField.dart';
import 'package:sihr/source/widget/skeleton.dart';
import 'package:sihr/source/widget/widgetCardHome.dart';
import 'package:sihr/source/widget/widgetMenu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

part './Auth/splash.dart';
part './Auth/login.dart';
part './Auth/profile.dart';
part './Auth/changePassword.dart';
part './Auth/cv.dart';

part './Dashboard/dashboard.dart';
part './Dashboard/home/home.dart';
part './Dashboard/absensi/dataAbsensi.dart';
part './Dashboard/absensi/absensi.dart';
// lembur
part './Dashboard/lembur/lembur.dart';
part './Dashboard/lembur/createLembur.dart';
// cuti
part './Dashboard/cuti/cuti.dart';
part './Dashboard/cuti/createCuti.dart';
// izin
part './Dashboard/izin/izin.dart';
part './Dashboard/izin/createIzin.dart';

part './Dashboard/news/news.dart';

// pelatihan
part './Dashboard/pelatihan/pelatihan.dart';
part './Dashboard/pelatihan/addPartisipasi.dart';
part './Dashboard/pelatihan/addResumePelatihan.dart';

// Log Book
part './Dashboard/LogBook/logbook.dart';
part './Dashboard/LogBook/createLogBook.dart';
part './Dashboard/LogBook/updateLogBook.dart';

part './Dashboard/LogBookPerawat/viewLogBookPerawat.dart';
part './Dashboard/LogBookPerawat/createLogBookPerawat.dart';
part './Dashboard/LogBookPerawat/updateLogBookPerawat.dart';

// slipgaji
part './Dashboard/SlipGaji/slipgaji.dart';
part './Dashboard/SlipGaji/detailSlipGaji.dart';

// approval
part './Dashboard/approval/approval.dart';
part './Dashboard/approval/detailApproval.dart';
