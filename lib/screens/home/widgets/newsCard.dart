import 'package:dailynews24/models/listdata_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/models/news_model.dart';
import 'package:dailynews24/screens/news_info/news_info.dart';
import 'package:skeletons/skeletons.dart';

class NewsCard extends StatefulWidget {
  final News article;

  const NewsCard({
    super.key,
    required this.article,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => NewsInfo(
              news: widget.article,
            ),
          ),
        )
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 0.2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.article.image != null)
                    Image.network(
                      widget.article.image!,
                      fit: BoxFit.contain,
                      frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) return child;
                        if (frame == null) {
                          return Center(
                            child: Skeleton(
                              isLoading: true,
                              skeleton: SkeletonParagraph(),
                              child: const Text(''),
                            ),
                          );
                        }
                        return child;
                      },
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      widget.article.title.rendered,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // const Icon(
                          //   Icons.person,
                          //   color: AppColors.black,
                          //   size: 20,
                          // ),
                          // SizedBox(
                          //   width: size.width / 2,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text(
                          //       widget.article.id.toString(),
                          //       overflow: TextOverflow.ellipsis,
                          //       style: GoogleFonts.poppins(
                          //         textStyle: const TextStyle(
                          //           color: AppColors.black,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColors.black,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              Jiffy.parse(
                                widget.article.modified.toString(),
                              ).fromNow().toString(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Html(
                      data: widget.article.content.rendered.substring(0, 100),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
