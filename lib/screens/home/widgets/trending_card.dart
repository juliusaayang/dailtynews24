import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/models/news_model.dart';
import 'package:dailynews24/screens/news_info/news_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class TrendingCard extends StatefulWidget {
  const TrendingCard({
    required this.article,
    super.key,
  });
  final News article;

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  @override
  Widget build(BuildContext context) {
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
          borderRadius: BorderRadius.circular(10),
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
            widget.article.image != null
                ? Image.network(
                    widget.article.image!,
                    height: 100,
                    width: 200,
                    fit: BoxFit.fitWidth,
                  )
                : const SizedBox(),
            const Gap(15),
            SizedBox(
              width: 200,
              child: Text(
                widget.article.title.rendered,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(
              Jiffy.parse(widget.article.modified.toString()).fromNow().toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: AppColors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.fade,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
