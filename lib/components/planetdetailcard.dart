import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/constants/theme.dart';

class PlanetsDetailCard extends StatelessWidget {
  const PlanetsDetailCard({
    super.key,
    required this.svg,
    required this.planet,
    required this.planetdes,
  });

  final String svg;
  final String planet;
  final String planetdes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.network(
                  svg,
                  color: Sorange,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                planet,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Swhite,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            planetdes,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Swhite.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
