import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTapEdit,
    this.onTapView,
    this.onTapApproval,
    this.pendingOrders,
    this.editOrder,
    this.textView = '',
    this.textEdit = '',
    this.textApproval = '',
  });

  final void Function()? onTapEdit;
  final void Function()? onTapView;
  final void Function()? onTapApproval;
  final String textView;
  final String textEdit;
  final String textApproval;
  final bool? pendingOrders;
  final bool? editOrder;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.all(10.0),
          buttonPadding: EdgeInsets.zero,
          actionsAlignment: MainAxisAlignment.end,
          content: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 8.0,
            spacing: 8,
            children: [
              InkWell(
                onTap: onTapView,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.73,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textView,
                        style:
                            const TextStyle(color: bgColor, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: onTapEdit,
                child: editOrder == false
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textEdit,
                              style: const TextStyle(
                                  color: bgColor, fontSize: 15),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ),
              InkWell(
                onTap: onTapApproval,
                child: pendingOrders == false
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textApproval,
                              style: const TextStyle(
                                  color: bgColor, fontSize: 15),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
      child: Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.settings,
                color: bgColor,
                size: 18,
              ),
              Text('Action'),
            ],
          )),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, this.text1 = '', this.text2 = ''});

//   final String text1;
//   final String text2;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return Dialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 elevation: 16,
//                 child: Container(
//                   height: 100,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset:
//                             const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Row(
//                             children: [
//                               Text(text1),
//                             ],
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Row(
//                             children: [
//                               Text(text2),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: const [
//             Icon(
//               Icons.settings,
//               size: 13,
//             ),
//             SizedBox(
//               width: 2,
//             ),
//             Text(
//               'Action',
//               style: TextStyle(fontSize: 13),
//             )
//           ],
//         ));
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return
// return Container(
//     decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 2,
//           blurRadius: 5,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//       borderRadius: BorderRadius.circular(3.0),
//       color: colorContain,
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Icon(
//           icon,
//           size: 20,
//           color: iconColor,
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontSize: 10.0,
//               fontWeight: FontWeight.bold,
//               color: blackColor,
//             ),
//           ),
//         ),
//       ],
//     ));
// }
