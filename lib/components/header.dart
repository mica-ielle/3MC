import 'package:flutter/material.dart';
import 'package:troismconsulting/config/responsive.dart';
import 'package:troismconsulting/style/colors.dart';
import 'package:troismconsulting/style/style.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

// Ajoutez un listener pour suivre les changements de focus
    focusNode.addListener(() {
      print('Focus: ${focusNode.hasFocus}');
    });
    return Column(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                      text: 'Dashboard', size: 30, fontWeight: FontWeight.w800),
                ]),
          ),
          const Spacer(
            flex: 1,
          ),
          // Expanded(
          //   flex: Responsive.isDesktop(context) ? 1 : 5,
          //   child: TextField(
          //     focusNode: focusNode,
          //     decoration: InputDecoration(
          //         filled: true,
          //         fillColor: AppColors.white,
          //         contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(30),
          //           borderSide: const BorderSide(color: AppColors.white),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(30),
          //           borderSide: const BorderSide(color: AppColors.white),
          //         ),
          //         prefixIcon: const Icon(Icons.search, color: AppColors.black),
          //         hintText: 'Search',
          //         hintStyle: const TextStyle(
          //             color: AppColors.secondary, fontSize: 14)),
          //   ),
          // ),
        ]),
      ],
    );
  }
}
