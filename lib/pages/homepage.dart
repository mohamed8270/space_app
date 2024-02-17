import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/components/imagecard.dart';
import 'package:space_app/components/planetdetailcard.dart';
import 'package:space_app/components/searchinput.dart';
import 'package:space_app/constants/theme.dart';
import 'package:space_app/models/planets_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController SearchController = TextEditingController();

  Future<PlanetsModel> Planets(String query) async {
    http.Response planetsres = await http.get(
      Uri.tryParse(
          'https://planets-17f2.onrender.com/planets/getPlanet?name=$query')!,
    );

    if (planetsres.statusCode == 200) {
      Map<String, dynamic> planetsjson = jsonDecode(planetsres.body);
      return PlanetsModel.fromJson(planetsjson);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> searchPlanets() async {
    final String query = SearchController.text;
    if (query.isNotEmpty) {
      await Planets(query);
      setState(() {
        Planets(query);
      });
    }
  }

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
              "Quantum Space",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Swhite,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchInput(
                    Controller: SearchController,
                  ),
                  InkWell(
                    onTap: searchPlanets,
                    child: Container(
                      height: ScreenSize.height * 0.055,
                      width: ScreenSize.width * 0.12,
                      decoration: BoxDecoration(
                        color: Sorange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.network(
                          'https://www.svgrepo.com/show/532554/search-alt.svg',
                          color: Swhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<PlanetsModel>(
                future: Planets(SearchController.text),
                builder: (BuildContext context,
                    AsyncSnapshot<PlanetsModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error} or Search for any Planets',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Swhite,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final planetsData = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 42,
                              width: 42,
                              child: Image.network(
                                planetsData!.taglineicn,
                                color: Swhite,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  planetsData.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    color: Sorange,
                                  ),
                                ),
                                Text(
                                  planetsData.tagline,
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
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: ScreenSize.height * 0.4,
                            child: Row(
                              children: [
                                ImageCard(
                                  ScreenSize: ScreenSize,
                                  imgurl: planetsData.picture,
                                ),
                                ImageCard(
                                  ScreenSize: ScreenSize,
                                  imgurl: planetsData.textureurl,
                                ),
                                ImageCard(
                                  ScreenSize: ScreenSize,
                                  imgurl: planetsData.spacetxtureurl,
                                ),
                                ImageCard(
                                  ScreenSize: ScreenSize,
                                  imgurl: planetsData.rings.ringurl.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Container(
                            height: ScreenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: Swhite.withOpacity(0.03),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                planetsData.namesake,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Swhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PlanetsDetailCard(
                          svg:
                              'https://www.svgrepo.com/show/192094/half-moon-moon.svg',
                          planet: planetsData.nummoons.toString(),
                          planetdes: '(Number of Moons)',
                        ),
                        PlanetsDetailCard(
                          svg: 'https://www.svgrepo.com/show/495714/size.svg',
                          planet: planetsData.yearlength,
                          planetdes: '(Year Length)',
                        ),
                        PlanetsDetailCard(
                          svg: 'https://www.svgrepo.com/show/491493/sun.svg',
                          planet: planetsData.disfromsun,
                          planetdes: '(Distance from Sun)',
                        ),
                        Text(
                          planetsData.description,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Swhite,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      'Enter a search query and tap the search button.',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Swhite,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
