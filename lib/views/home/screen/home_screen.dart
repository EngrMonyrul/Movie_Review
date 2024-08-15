import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_review/common/widgets/custom_appbar.dart';
import 'package:movie_review/utils/constants/app_components.dart';
import 'package:movie_review/utils/constants/assets_const.dart';
import 'package:movie_review/utils/extensions/context_ext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: theme.colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /*<<-------------------------->>
              <<------>> hero section image area
              <<-------------------------->>*/
            Container(
              height: 639,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    AssetsConst.heroSectionImage,
                  ),
                ),
              ),
              child: Column(
                children: [
                  /*<<-------------------------->>
                    <<------>> status bar height
                    <<-------------------------->>*/
                  SizedBox(
                    height: context.statusBarHeight,
                  ),

                  /*<<-------------------------->>
                    <<------>> appbar
                    <<-------------------------->>*/
                  Row(
                    children: [
                      /*<<-------------------------->>
                        <<------>> app logo image
                        <<-------------------------->>*/
                      SvgPicture.asset(
                        AssetsConst.logoSvg,
                        height: 35,
                        width: 116.08,
                        fit: BoxFit.cover,
                      ),
                      const Spacer(),

                      /*<<-------------------------->>
                        <<------>> drawer button
                        <<-------------------------->>*/
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.outline,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            color: theme.colorScheme.tertiary,
                            child: SvgPicture.asset(
                              AssetsConst.iconMenu,
                              height: 24,
                              width: 24,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  /*<<-------------------------->>
                    <<------>> slogan
                    <<-------------------------->>*/
                  Text(
                    "The Best Streaming\nExperience",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10),

                  /*<<-------------------------->>
                    <<------>> slogan
                    <<-------------------------->>*/
                  Text(
                    "StreamVibe is the best streaming experience for watching your favorite movies and shows on demand, anytime, anywhere.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 30),

                  /*<<-------------------------->>
                    <<------>> watching button
                    <<-------------------------->>*/
                  GestureDetector(
                    child: Container(
                      height: 52,
                      width: 209,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: theme.colorScheme.onPrimary,
                            size: 24,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Start Watching Now",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*<<-------------------------->>
                    <<------>> slogan explore
                    <<-------------------------->>*/
                  Text(
                    "Explore our wide variety of categories",
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),

                  /*<<-------------------------->>
                    <<------>> slogan after explore
                    <<-------------------------->>*/
                  Text(
                    "Whether you're looking for a comedy to make you laugh, a drama to make you think, or a documentary to learn something new",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 40),

                  /*<<-------------------------->>
                    <<------>> explore item
                    <<-------------------------->>*/
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: AppComponents.exploreItem.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = AppComponents.exploreItem[index];
                        return Container(
                          height: 220,
                          width: 178.4,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outline.withOpacity(0.4),
                            border:
                                Border.all(color: theme.colorScheme.outline),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              /*<<-------------------------->>
                                <<------>> item image
                                <<-------------------------->>*/
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(item.image ?? ""),
                              ),

                              /*<<-------------------------->>
                                <<------>> item label
                                <<-------------------------->>*/
                              Row(
                                children: [
                                  Text(
                                    item.category ?? "",
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  /*<<-------------------------->>
                    <<------>> slogan
                    <<-------------------------->>*/
                  Text(
                    "We Provide you streaming experience across various devices.",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),

                  /*<<-------------------------->>
                    <<------>> slogan
                    <<-------------------------->>*/
                  Text(
                    "With StreamVibe, you can enjoy your favorite movies and TV shows anytime, anywhere.",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 40),

                  /*<<-------------------------->>
                    <<------>> device status
                    <<-------------------------->>*/
                  ListView.builder(
                    itemCount: AppComponents.deviceStatus.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = AppComponents.deviceStatus[index];
                      return Container(
                        height: 175,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: theme.colorScheme.outline),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.black,
                              Colors.black87,
                              Colors.red,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.surface,
                                    border: Border.all(
                                        color: theme.colorScheme.outline),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    item.image ?? "",
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  item.label ?? "",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item.description ?? "",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Frequently Asked Questions",
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Got questions? We've got answers! Check out our FAQ section to find answers to the most common questions about StreamVibe.",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Container(
                      height: 52,
                      width: 209,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Ask a Question",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
