import 'package:flutter/material.dart';

import '../../configs/color.dart';
import '../constants/colors_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.textStyle,
  });

  final String title;
  final Widget? leading;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: bgColor,
            leading: leading,
            title: Text(
              title,
              style: textStyle,
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1.0),
                    color: Colors.white),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration:
                              InputDecoration.collapsed(hintText: 'search'),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 135);
}

// import 'package:flutter/material.dart';
// import 'package:testapp/constants/colors_constant.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           height: 59,
//           width: 370,
//           decoration: const BoxDecoration(color: primaryColor),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.menu_rounded,
//                   color: whiteColor,
//                 ),
//               ),
//               const Text(
//                 'Androi & iOS',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: whiteColor),
//               ),
//               IconButton(
//                   onPressed: (() {}),
//                   icon: const Icon(
//                     Icons.more_vert,
//                     color: whiteColor,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
