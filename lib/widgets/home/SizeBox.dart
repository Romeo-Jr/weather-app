// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeBox extends StatefulWidget {

  final String value;
  final String label;
  final IconData icon;

  const SizeBox({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    });

  @override
  State<SizeBox> createState() => _SizeBoxState();

}

class _SizeBoxState extends State<SizeBox> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 120.0,
      child: Card(
      shape: const RoundedRectangleBorder(),
      color: const Color.fromRGBO(55, 58, 64, 1),
      margin: const EdgeInsets.all(10.0),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: Colors.white, size: 30.0,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(widget.label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.0),),
            ),
          Text(widget.value, style: GoogleFonts.poppins(fontSize: 15.0, color: Colors.white),),
        ],
        ),
      ),
    );
  }
}
