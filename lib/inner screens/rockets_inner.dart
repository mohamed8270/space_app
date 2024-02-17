// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/constants/theme.dart';
import 'package:space_app/models/rockets_model.dart';
import 'package:space_app/service/spacex.dart';

class RocketsInnerPage extends StatefulWidget {
  final int rocketdatanum;
  const RocketsInnerPage({super.key, required this.rocketdatanum});

  @override
  State<RocketsInnerPage> createState() => _RocketsInnerPageState();
}

class _RocketsInnerPageState extends State<RocketsInnerPage> {
  SpaceXApi rocketapi = Get.put(SpaceXApi());
  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Sblack,
        body: FutureBuilder<List<RocketsModel>>(
          future: rocketapi.RocketsFetch(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RocketsModel>> snapshot) {
            if (snapshot.hasData) {
              List<RocketsModel>? rocketsdata = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: ScreenSize.height * 0.4,
                        width: ScreenSize.width * 0.95,
                        decoration: BoxDecoration(
                          color: Swhite.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              rocketsdata![widget.rocketdatanum].flickrimg[1],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rocketsdata[widget.rocketdatanum].rocketname,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Swhite,
                                ),
                              ),
                              Text(
                                rocketsdata[widget.rocketdatanum].companyname,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Swhite.withOpacity(0.2),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                rocketsdata[widget.rocketdatanum].firstflight,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Sorange.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        rocketsdata[widget.rocketdatanum].description,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Swhite.withOpacity(0.3),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Country:      ${rocketsdata[widget.rocketdatanum].country}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Swhite.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: ScreenSize.height * 0.55,
                          width: ScreenSize.width * 0.95,
                          decoration: BoxDecoration(
                            color: Swhite.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deatil's",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Swhite,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: ScreenSize.height * 0.18,
                                      width: ScreenSize.width * 0.25,
                                      decoration: BoxDecoration(
                                        color: Swhite.withOpacity(0.03),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${rocketsdata[widget.rocketdatanum].successrate.toString()} %',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Swhite,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stages:       ${rocketsdata[widget.rocketdatanum].stages.toString()}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite,
                                          ),
                                        ),
                                        Text(
                                          'Boostets:    ${rocketsdata[widget.rocketdatanum].boosters.toString()}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite,
                                          ),
                                        ),
                                        Text(
                                          'Cost:         💲${rocketsdata[widget.rocketdatanum].cost.toString()}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  'Height:    ${rocketsdata[widget.rocketdatanum].rocketheight.feet.toString()} Feet',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Swhite,
                                  ),
                                ),
                                Text(
                                  'Diameter:    ${rocketsdata[widget.rocketdatanum].rocketdiameter.feet.toString()} Feet',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Swhite,
                                  ),
                                ),
                                Text(
                                  'Mass:    ${rocketsdata[widget.rocketdatanum].rocketmass.kg.toString()} Kg',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Swhite,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'First Stage',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Sorange,
                                          ),
                                        ),
                                        Text(
                                          'Fuel Amount:    ${rocketsdata[widget.rocketdatanum].rocketfirst.fuelamount.toString()} Tons',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite.withOpacity(0.3),
                                          ),
                                        ),
                                        Text(
                                          'Burn Sec:    ${rocketsdata[widget.rocketdatanum].rocketfirst.burnsec.toString()} Sec',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite.withOpacity(0.3),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Second Stage',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Sorange,
                                          ),
                                        ),
                                        Text(
                                          'Fuel Amount:    ${rocketsdata[widget.rocketdatanum].rocketsecond.fuelamount.toString()} Tons',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite.withOpacity(0.3),
                                          ),
                                        ),
                                        Text(
                                          'Burn Sec:    ${rocketsdata[widget.rocketdatanum].rocketsecond.burnsec.toString()} Sec',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Swhite.withOpacity(0.3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Engines Details',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Sorange,
                                  ),
                                ),
                                Text(
                                  'Propellent 1:    ${rocketsdata[widget.rocketdatanum].rocketengine.propel1.toString()}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Swhite.withOpacity(0.3),
                                  ),
                                ),
                                Text(
                                  'Propellent 2:    ${rocketsdata[widget.rocketdatanum].rocketengine.propel2.toString()}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Swhite.withOpacity(0.3),
                                  ),
                                ),
                                Text(
                                  'Thrust-Weight:    ${rocketsdata[widget.rocketdatanum].rocketengine.thrust.toString()} Kg',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Swhite.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          elevation: 0,
          backgroundColor: Swhite.withOpacity(0.05),
          child: SizedBox(
            height: 22,
            width: 22,
            child: SvgPicture.network(
              'https://www.svgrepo.com/show/458545/back.svg',
              color: Sorange,
            ),
          ),
        ),
      ),
    );
  }
}
