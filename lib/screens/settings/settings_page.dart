import 'package:dailynews24/common/colors.dart';
import 'package:dailynews24/screens/settings/settings_details_page.dart';
import 'package:dailynews24/services/url_launcher_util.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsCard(
              title: 'Support Daily News 24',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsDetailsPage(
                        link: 'https://dailynews24.ng/support-daily-news-24/',
                      );
                    },
                  ),
                );
              },
            ),
            SettingsCard(
              title: 'Advertise With Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsDetailsPage(
                        link: 'https://dailynews24.ng/advertise-with-us/',
                      );
                    },
                  ),
                );
              },
            ),
            SettingsCard(
              title: 'Contact Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsDetailsPage(
                        link: 'https://dailynews24.ng/contact-us/',
                      );
                    },
                  ),
                );
              },
            ),
            SettingsCard(
              title: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsDetailsPage(
                        link: 'https://dailynews24.ng/privacy/',
                      );
                    },
                  ),
                );
              },
            ),
            SettingsCard(
              title: 'About Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsDetailsPage(
                        link: 'https://dailynews24.ng/about-us/',
                      );
                    },
                  ),
                );
              },
            ),
            const Gap(50),
            const Text(
              'Our Socials',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                imageHolder(
                  'facebook.jpeg',
                  onTap: () => UrlLauncherUtil.launchUrlLink(
                    context,
                    url: 'web.facebook.com/dailynews24ng',
                    scheme: 'https',
                  ),
                ),
                imageHolder(
                  'tiktok.jpeg',
                  onTap: () => UrlLauncherUtil.launchUrlLink(
                    context,
                    url: 'www.tiktok.com/@dailynews24.ng?_t=8i4QsEYYcly&_r=1',
                    scheme: 'https',
                  ),
                ),
                imageHolder(
                  'x.jpg',
                  onTap: () => UrlLauncherUtil.launchUrlLink(
                    context,
                    url: 'twitter.com/dailynews24_NG',
                    scheme: 'https',
                  ),
                ),
                imageHolder(
                  'youtube.jpeg',
                  onTap: () => UrlLauncherUtil.launchUrlLink(
                    context,
                    url: 'www.youtube.com/channel/UCx-tONSNtZJ7R1j5EiAlKPA',
                    scheme: 'https',
                  ),
                ),
                imageHolder(
                  'threads.png',
                  onTap: () => UrlLauncherUtil.launchUrlLink(
                    context,
                    url: 'www.threads.net/@dailynews24.ng',
                    scheme: 'https',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imageHolder(
    String asset, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/$asset',
        height: 40,
        width: 40,
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    required this.title,
    this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
        ),
      ),
    );
  }
}
