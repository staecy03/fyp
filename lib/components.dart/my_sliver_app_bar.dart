import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 70,
        collapsedHeight: 100,
        floating: false,
        pinned: true,
        backgroundColor: Colors.teal.shade600,
        title: Text(
          "Districts to visit",
          style: GoogleFonts.dmSerifDisplay(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: child,
          title: title,
          centerTitle: true,
          titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          expandedTitleScale: 1,
        ));
  }
}
