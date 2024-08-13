import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_review/common/widgets/custom_appbar.dart';
import 'package:movie_review/utils/constants/assets_const.dart';
import 'package:movie_review/utils/extensions/context_ext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 639,
              width: double.infinity,
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
                  Container(
                    height: 35,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.asset(AssetsConst.logoImage),
                      ],
                    ),
                  ),
                  const Spacer(),

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
          ],
        ),
      ),
    );
  }
}
