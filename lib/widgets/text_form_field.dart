import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class TextFormApp extends StatelessWidget {
  const TextFormApp(
      {super.key, this.title, this.controller, this.icon, this.enabled});
  final title;
  final controller;
  final icon;
  final enabled;

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

            style: TextStyle(fontSize: 12.0, color: Colors.black),
            decoration: InputDecoration(
                enabled: enabled ?? true,
                suffixIcon: icon,
                hintText: '',
                filled: true,
                fillColor: ColorsApp.white,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorsApp.black.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorsApp.black.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorsApp.black.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10.0),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      ),
    );
    ;
  }
}
