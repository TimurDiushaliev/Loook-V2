// import 'package:flutter/material.dart';
// import 'package:loook/pages/authentication/sign_in_page.dart';
// import 'package:loook/responsive_size/responsive_size_provider.dart';
// import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
// import 'package:loook/widgets/navigate_to_add_advert_pages_button/navigate_to_add_advert_pages_button.dart';

// class NoAccountPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(brightness: Brightness.dark),
//       home: Scaffold(
//         backgroundColor: Color(0xFF252837),
//         appBar: AppBar(
//           backgroundColor: Color(0xFF252837),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: ResponsiveSizeProvider.width(context) * 0.8,
//                 child: Text(
//                   'Авторизуйтесь, чтобы пользоваться услугами Loook',
//                   textAlign: TextAlign.center,
//                   // style: TextStyle(height: 1.5),
//                 ),
//               ),
//               SizedBox(
//                 height: ResponsiveSizeProvider.height(context) * 0.05,
//               ),
//               MaterialButton(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18)),
//                 color: Colors.white,
//                 child: Text(
//                   'Авторизоваться',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SignInPage(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: NavigateToAddAdvertPages(),
//         bottomNavigationBar: BottomAppBarNavigation(),
//       ),
//     );
//   }
// }
