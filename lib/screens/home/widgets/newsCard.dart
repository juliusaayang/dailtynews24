import 'package:dailynews24/models/listdata_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => NewsInfo(
              news: widget.article,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, -4),
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 4,
            ),
            BoxShadow(
              offset: const Offset(-2, 4),
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.article.image != null
                    ? Image.network(
                        widget.article.image!,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
                const Gap(10),
                Flexible(
                  child: Text(
                    widget.article.title.rendered,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.access_time,
                  color: AppColors.black,
                  size: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    Jiffy.parse(widget.article.modified.toString()).fromNow().toString(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.fade,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
