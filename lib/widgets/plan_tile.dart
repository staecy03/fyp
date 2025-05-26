/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/models/plan.dart';

class PlanTile extends StatelessWidget {
  final Plan? plan;
  PlanTile(this.plan);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(plan?.colour ?? 0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan?.title ?? "",
                  style: GoogleFonts.lora(
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Location: ${plan?.location ?? ""}",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "District: ${plan?.district ?? ""}",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Activity: ${plan?.activity ?? ""}",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${plan?.startTime ?? ''} - ${plan?.endTime ?? ''}",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("||"),
                    SizedBox(width: 10),
                    Text(
                      plan?.date ?? "",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 2,
            color: Colors.grey[700],
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              plan?.isCompleted == 1 ? "COMPLETED" : "EXPLORE",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Colors.teal.shade100;
      case 1:
        return Color(0xFFA7C7E7);
      case 2:
        return Color(0xFFF6E0D7);
      default:
        return Color(0xFFF6E0D7);
    }
  }
}*/
