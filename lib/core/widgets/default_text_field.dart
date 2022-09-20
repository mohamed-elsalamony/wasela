import 'package:flutter/material.dart';
import 'package:team_projects/core/style/colors.dart';

class DefualtTextField extends StatefulWidget {
  String labelText = ' ';
  bool isPassword = true;

  bool isObsecure = false;
  final TextEditingController controller;
  double? size;

  DefualtTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.isPassword,
      required this.isObsecure,
      this.size = double.infinity});

  @override
  State<DefualtTextField> createState() => _DefualtTextFieldState();
}

class _DefualtTextFieldState extends State<DefualtTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.kLightGrey,
            borderRadius: BorderRadiusDirectional.circular(17)),
        height: 45,
        width: widget.size,
        child: TextFormField(
          
          controller: widget.controller,
            obscureText: widget.isObsecure,
            cursorColor: AppColors.kBlue,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? widget.isObsecure
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isObsecure = !widget.isObsecure;
                            });
                          },
                          icon: widget.isObsecure
                              ? const Icon(Icons.visibility)
                              : const Icon(
                                  Icons.visibility_off,
                                ),
                        )
                      : null
                  : null,
              labelText: widget.labelText,
              labelStyle: TextStyle(color: AppColors.kBlue),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            )));
  }
}
