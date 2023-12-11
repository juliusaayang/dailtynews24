// import 'dart:convert';
//
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:dailynews24/common/colors.dart';
// import 'package:dailynews24/models/listdata_model.dart';
// import 'package:dailynews24/models/news_model.dart';
// import 'package:dailynews24/services/Api.dart';
//
// class NewsProvider {
//   Future<ListData> GetEverything(String keyword, int page) async {
//     ListData articles = ListData([], false);
//     await ApiService().getEverything(keyword, page).then((response) {
//
//       // print(response.body);
//       // ['title']['rendered']
//       if (response.statusCode == 200) {
//         Iterable data = jsonDecode(response.body);
//         articles = ListData(
//           jsonDecode(response.body),
//           true,
//         );
//       } else {
//         Fluttertoast.showToast(
//           msg: jsonDecode(response.body),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: AppColors.lighterGray,
//           textColor: AppColors.black,
//           fontSize: 16.0,
//         );
//         throw Exception(response.statusCode);
//       }
//     });
//     return articles;
//   }
// }
