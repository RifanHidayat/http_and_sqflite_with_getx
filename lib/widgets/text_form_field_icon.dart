import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class TextFormIconApp extends StatelessWidget {
  const TextFormIconApp({super.key, this.title, this.controller});
  final title;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLabel(text: title),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            // validator: validator,
            controller: controller,
            autofocus: false,
            style: TextStyle(fontSize: 12.0, color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.date_range,
                color: ColorsApp.black.withOpacity(0.5),
              ),
              border: InputBorder.none,
              hintText: '',
              filled: true,
              fillColor: ColorsApp.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsApp.baseColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsApp.baseColor.withOpacity(0.6)),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
