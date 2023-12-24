import 'package:dailynews24/services/url_launcher_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/models/news_model.dart';
import 'package:skeletons/skeletons.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsInfo extends StatefulWidget {
  final News news;

  const NewsInfo({
    super.key,
    required this.news,
  });

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            top: 10,
          ),
          child: Image.asset(
            'assets/images/news_log.png',
            height: 70,
            color: AppColors.primary,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Image.network(
                    widget.news.image.toString(),
                    fit: BoxFit.contain,
                    width: size.width,
                    height: 200,
                    frameBuilder: (
                      BuildContext context,
                      Widget child,
                      int? frame,
                      bool wasSynchronouslyLoaded,
                    ) {
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
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    height: 200,
                    width: size.width,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Text(
                    widget.news.title.rendered,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                                widget.news.modified.toString(),
                              ).fromNow().toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Html(
                    data: widget.news.content.rendered,
                    onLinkTap: (link, _, __) async {
                      if (link != null) {
                        final url = Uri.parse(link);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Could not launch $url',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColors.lighterGray,
                            textColor: AppColors.black,
                            fontSize: 16.0,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                UrlLauncherUtil.launchUrlLink(
                  context,
                  url: widget.news.link.substring(8),
                  scheme: 'https',
                );
                // _launchInBrowser(
                //   Uri(
                //     host: widget.news.link,
                //   ),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "View full article",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.black,
                    size: 14,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Icon(
            //         Icons.facebook,
            //         size: 26,
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Icon(
            //         Icons.email_outlined,
            //         size: 26,
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Icon(
            //         Icons.wechat_sharp,
            //         size: 26,
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
