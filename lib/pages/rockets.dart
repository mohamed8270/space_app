// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/constants/theme.dart';
import 'package:space_app/inner%20screens/rockets_inner.dart';
import 'package:space_app/models/rockets_model.dart';
import 'package:space_app/service/spacex.dart';

class RocketPage extends StatefulWidget {
  const RocketPage({super.key});

  @override
  State<RocketPage> createState() => _RocketPageState();
}

class _RocketPageState extends State<RocketPage> {
  SpaceXApi rocketapi = Get.put(SpaceXApi());

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Sblack,
      appBar: AppBar(
        backgroundColor: Sblack,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.network(
                'https://www.svgrepo.com/show/480687/rocket.svg',
                color: Sorange,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Rockets",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Swhite,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<RocketsModel>>(
        future: rocketapi.RocketsFetch(),
        builder:
            (BuildContext context, AsyncSnapshot<List<RocketsModel>> snapshot) {
          if (snapshot.hasData) {
            List<RocketsModel>? rocketsdata = snapshot.data;
            return ListView.builder(
              itemCount: rocketsdata!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              RocketsInnerPage(rocketdatanum: index),
                            );
                          },
                          child: Container(
                            height: ScreenSize.height * 0.2,
                            width: ScreenSize.width * 0.95,
                            decoration: BoxDecoration(
                              color: Swhite.withOpacity(0.03),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  rocketsdata[index].flickrimg[1],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Container(
                                  height: ScreenSize.height * 0.2,
                                  width: ScreenSize.width * 0.95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Sblack.withOpacity(0.8),
                                        Sblack.withOpacity(0.01),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      tileMode: TileMode.clamp,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              rocketsdata[index].rocketname,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Swhite,
                                              ),
                                            ),
                                            Text(
                                              rocketsdata[index].companyname,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Swhite.withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(
                color: Sorange,
                strokeWidth: 3,
                strokeCap: StrokeCap.round,
                strokeAlign: 3,
              ),
            ),
          );
        },
      ),
    );
  }
}
