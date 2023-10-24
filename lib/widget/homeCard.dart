import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadiah_bank/theme.dart';

class HomeCard extends StatelessWidget {
  final String cust;
  final String alamat;
  final String noHp;
  final String status;
  final List<String> hadiah;
  const HomeCard(
      {super.key,
      required this.cust,
      required this.alamat,
      required this.noHp,
      required this.status,
      required this.hadiah});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          // BoxShadow(
          //   blurRadius: 15,
          // ),
        ],
      ),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cust,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          alamat,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_phone_rounded,
                          color: Colors.white,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          noHp,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: hadiah.length,
              itemBuilder: (context, index) {
                return Card(
                  color: lightColor,
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.wallet_giftcard_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      hadiah[index],
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: semiBold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    // Container(
    //   width: 140,
    //   height: 150,
    //   margin: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     color: Color(0xffECEDEF),
    //   ),
    //   child: Row(
    //     children: [
    //       Container(
    //         margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
    //         child: Image.asset('assets/teko-cak.png', width: 70.w),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(
    //             height: 30,
    //           ),
    //           Container(
    //             margin: EdgeInsets.symmetric(
    //               horizontal: 20,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 SizedBox(height: 6),
    //                 Text(
    //                   'Teko-Cak',
    //                   style: GoogleFonts.poppins(
    //                     fontSize: 18,
    //                     fontWeight: semiBold,
    //                   ),
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //                 Expanded(
    //                   child: Text(
    //                     'Absensi Karyawan Pemerintah Kota Surabaya',
    //                     style: GoogleFonts.poppins(
    //                       fontSize: 12,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
  }
}
