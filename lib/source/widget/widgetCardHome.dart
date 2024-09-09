import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/service/Shift/cubit/get_shift_cubit.dart';
import 'package:sihr/source/widget/skeleton.dart';

class WidgetCardHome extends StatelessWidget {
  const WidgetCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetShiftCubit, GetShiftState>(
      builder: (context, state) {
        if (state is GetShiftLoading ) {
          return Padding(padding: const EdgeInsets.only(left: 12, right: 12), child: Skeleton.skeleton1(height: 200));
        }
        if (state is GetShiftFailed) {
          return Container();
        }
        var data = (state as GetShiftLoaded).model;
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: AutoSizeText('Catatan Kehadiran', style: TextStyle(fontSize: 18, fontFamily: 'JakartaSansSemibold'), maxLines: 1),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/checkin.png", height: 35),
                              const SizedBox(width: 8),
                              Text("Check In", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(data!.data!.jamMulai!, style: TextStyle(fontFamily: 'JakartaSansBold', fontSize: 20)),
                          const SizedBox(height: 8),
                          Text("Masuk", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/checkout.png", height: 35),
                              const SizedBox(width: 8),
                              Text("Check Out", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(data!.data!.jamSelesai!, style: TextStyle(fontFamily: 'JakartaSansBold', fontSize: 20)),
                          const SizedBox(height: 8),
                          Text("Pulang", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Izin", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14)),
                          const SizedBox(height: 4),
                          AutoSizeText("0 Hari", style: TextStyle(fontFamily: 'JakartaSansBold', fontSize: 25)),
                          const SizedBox(height: 4),
                          const Divider(color: Colors.blue, thickness: 2.5)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sisa Cuti", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14)),
                          const SizedBox(height: 4),
                          AutoSizeText("0 Hari", style: TextStyle(fontFamily: 'JakartaSansBold', fontSize: 25)),
                          const SizedBox(height: 4),
                          const Divider(color: Colors.indigo, thickness: 2.5)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kehadiran", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14)),
                          const SizedBox(height: 4),
                          AutoSizeText("0 Hari", style: TextStyle(fontFamily: 'JakartaSansBold', fontSize: 25)),
                          const SizedBox(height: 4),
                          const Divider(color: Colors.green, thickness: 2.5)
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
    // return Container(
    //   height: 250,
    //   width: MediaQuery.of(context).size.width,
    //   margin: const EdgeInsets.all(12),
    //   decoration: BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(6.0), border: Border.all(color: Colors.grey.withOpacity(0.5))),
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: 80,
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 14.0, right: 14.0),
    //           child: Row(
    //             children: [
    //               Icon(FontAwesomeIcons.solidClock, color: Colors.grey, size: 35),
    //               const SizedBox(width: 10),
    //               Expanded(
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         const SizedBox(height: 4),
    //                         Row(
    //                           children: [
    //                             Text("08:00", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //                             Text("-", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //                             Text("12:00", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //                           ],
    //                         ),
    //                         const SizedBox(height: 4),
    //                         Row(
    //                           children: [
    //                             Text("Masuk ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
    //                             Text(": ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
    //                             Text("12:00", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Sabtu",
    //                           style: TextStyle(fontFamily: 'MontserratSemiBold'),
    //                         ),
    //                         const SizedBox(height: 4),
    //                         Text("20 Jul 2024", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //                         const SizedBox(height: 4),
    //                         Row(
    //                           children: [
    //                             Text("Pulang ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
    //                             Text(": ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
    //                             Text("12:00", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 14.0, right: 14.0),
    //         child: Divider(thickness: 2.5, color: hijauLight),
    //       ),
    //       const SizedBox(height: 12),
    //       Text("Rekap Absensi Bulan ini", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
    //       const SizedBox(height: 12),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("HADIR", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //               const SizedBox(height: 4),
    //               Text("0 Hari", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //               const SizedBox(height: 4),
    //               SizedBox(
    //                 width: 80,
    //                 child: Divider(thickness: 3, color: Colors.green),
    //               )
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("Izin", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //               const SizedBox(height: 4),
    //               Text("0 Hari", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //               const SizedBox(height: 4),
    //               SizedBox(
    //                 width: 80,
    //                 child: Divider(thickness: 3, color: Colors.blue),
    //               )
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("SISA CUTI", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //               const SizedBox(height: 4),
    //               Text("0 Hari", style: TextStyle(fontFamily: 'MontserratSemiBold')),
    //               const SizedBox(height: 4),
    //               SizedBox(
    //                 width: 80,
    //                 child: Divider(thickness: 3, color: Colors.amber),
    //               )
    //             ],
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
