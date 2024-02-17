// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/constants/theme.dart';
import 'package:space_app/inner%20screens/website_inner.dart';
import 'package:space_app/inner%20screens/wikipedia_inner.dart';
import 'package:space_app/models/spacex_model.dart';
import 'package:space_app/service/spacex.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  SpaceXApi missionapi = Get.put(SpaceXApi());

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
                'https://www.svgrepo.com/show/435156/space-ship.svg',
                color: Sorange,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "SpaceX Missions",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Swhite,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<MissionItem>>(
        future: missionapi.MissionFetch(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MissionItem>> snapshot) {
          if (snapshot.hasData) {
            List<MissionItem>? missiondata = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: ListView.builder(
                itemCount: missiondata!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Container(
                        // height: ScreenSize.height * 0.2,
                        width: ScreenSize.width * 0.8,
                        decoration: BoxDecoration(
                          color: Swhite.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        missiondata[index].name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Swhite,
                                        ),
                                      ),
                                      Text(
                                        missiondata[index].manufacturers[0],
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Swhite.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: ScreenSize.width * 0.15,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 13,
                                          width: 13,
                                          child: InkWell(
                                            onTap: () {
                                              Uri.parse(
                                                missiondata[index]
                                                    .twitter
                                                    .toString(),
                                              );
                                            },
                                            child: SvgPicture.network(
                                              'https://www.svgrepo.com/show/501410/twitter.svg',
                                              color: Sorange.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 13,
                                          width: 13,
                                          child: InkWell(
                                            onTap: () => Get.to(
                                              WebsiteInner(
                                                WebUrl: missiondata[index]
                                                    .website
                                                    .toString(),
                                              ),
                                            ),
                                            child: SvgPicture.network(
                                              'https://www.svgrepo.com/show/478280/internet-2.svg',
                                              color: Sorange.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                missiondata[index].description,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Swhite.withOpacity(0.3),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: ScreenSize.height * 0.035,
                                width: ScreenSize.width * 0.25,
                                decoration: BoxDecoration(
                                  color: Swhite.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 13,
                                      width: 13,
                                      child: InkWell(
                                        onTap: () => Get.to(
                                          WikipediaPage(
                                            NewsUrl: missiondata[index]
                                                .wikipedia
                                                .toString(),
                                          ),
                                        ),
                                        child: SvgPicture.network(
                                          'https://www.svgrepo.com/show/510970/external-link.svg',
                                          color: Sorange.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Wikipedia",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Sorange,
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
                  );
                },
              ),
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
