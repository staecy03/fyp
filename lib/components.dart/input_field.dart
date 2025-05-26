import 'package:flutter/material.dart';
import 'package:mansau_sabah/theme/text_theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  //final Widget widget;

  const MyInputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    //required this.widget
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: controller,
                        style: subtitleStyle,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: subtitleStyle,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white12,
                            width: 0,
                            style: BorderStyle.none,
                          )),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
