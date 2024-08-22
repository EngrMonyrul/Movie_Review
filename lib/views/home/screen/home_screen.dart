import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_review/utils/constants/app_components.dart';
import 'package:movie_review/utils/constants/assets_const.dart';
import 'package:movie_review/utils/extensions/context_ext.dart';
import 'package:movie_review/utils/theme/color_scheme_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final dotIndicatorController = ScrollController();
  double indicatorPosition = 0.0;
  double indicatorSize = 0.0;
  double dotWidth = 30;

  void initialDragValue() {
    setState(() {
      indicatorSize = (context.screenSize.width * 3) - 30;
      double maxScrollWidth = dotIndicatorController.position.maxScrollExtent;
      double indicatorOffset = dotIndicatorController.offset;
      dotIndicatorController.addListener(() {
        indicatorPosition =
            (indicatorOffset / maxScrollWidth) * (indicatorSize - dotWidth);
      });
    });
  }

  void dragOnHorizontal(DragUpdateDetails details) {
    setState(() {
      indicatorPosition += details.delta.dx;
      indicatorPosition.clamp(0.0, (indicatorSize - dotWidth));
      final maxDrag = dotIndicatorController.position.maxScrollExtent;
      final screenWidth = context.screenSize.width;
      final listScrollOffset =
          (indicatorPosition / (indicatorSize - dotWidth)) * maxDrag;
      dotIndicatorController.jumpTo(listScrollOffset);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialDragValue();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenSize = context.screenSize;

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
                      controller: dotIndicatorController,
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
                  const SizedBox(height: 20),

                  /*<<-------------------------->>
                    <<------>> smooth indicator
                    <<-------------------------->>*/
                  Center(
                    child: GestureDetector(
                      onHorizontalDragUpdate: dragOnHorizontal,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 8,
                          width: screenSize.width * .3,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // Background color similar to your image
                          child: Stack(
                            children: [
                              Positioned(
                                left: indicatorPosition,
                                child: Container(
                                  width: 30,
                                  // Set width of the indicator as needed
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    // Active color of the indicator
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

                  /*<<-------------------------->>
                    <<------>> faq title
                    <<-------------------------->>*/
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

                  /*<<-------------------------->>
                    <<------>> faq button
                    <<-------------------------->>*/
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
                  const SizedBox(height: 10),

                  /*<<-------------------------->>
                    <<------>> faqs
                    <<-------------------------->>*/
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppComponents.qnafaqs.length,
                    itemBuilder: (context, index) {
                      final faqItem = AppComponents.qnafaqs[index];
                      return ExpansionTile(
                        childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        tilePadding: const EdgeInsets.all(8),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.topLeft,
                        title: Text(
                          faqItem.question ?? "",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outline,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color:
                                  theme.colorScheme.onPrimary.withOpacity(0.1),
                            ),
                          ),
                          child: Text(
                            "${index + 1}",
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        dense: true,
                        children: [
                          Text(
                            faqItem.answer ?? "",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  /*<<-------------------------->>
                    <<------>> monthly pack title
                    <<-------------------------->>*/
                  Text(
                    "Choose the plan that's right for you",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Join StreamVibe and select from our flexible subscription options tailored to suit your viewing preferences. Get ready for non-stop entertainment!",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /*<<-------------------------->>
                    <<------>> package tab bar
                    <<-------------------------->>*/
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: theme.colorScheme.secondary.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color:
                                  theme.colorScheme.secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "Monthly",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          child: const Text("Yearly"),
                        ),
                      ],
                    ),
                  ),

                  /*<<-------------------------->>
                    <<------>> monthly package list
                    <<-------------------------->>*/
                  ListView.builder(
                    itemCount: AppComponents.monthlyPackages.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = AppComponents.monthlyPackages[index];

                      return Container(
                        padding: const EdgeInsets.all(24),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.outline.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: theme.colorScheme.secondary.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*<<-------------------------->>
                              <<------>> package level
                              <<-------------------------->>*/
                            Text(
                              item.title ?? "",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /*<<-------------------------->>
                              <<------>> package description
                              <<-------------------------->>*/
                            Text(
                              item.description ?? "",
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /*<<-------------------------->>
                              <<------>> package price
                              <<-------------------------->>*/
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "\$${item.price}",
                                    style: theme.textTheme.headlineLarge,
                                  ),
                                  TextSpan(
                                    text: "/month",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /*<<-------------------------->>
                              <<------>> package buttons
                              <<-------------------------->>*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: theme.colorScheme.secondary),
                                      color: theme.colorScheme.surface,
                                    ),
                                    child: Text(
                                      "Start Free Trial",
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: theme.colorScheme.primary,
                                    ),
                                    child: Text(
                                      "Choose Plan",
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  /*<<-------------------------->>
                    <<------>> trial offer card
                    <<-------------------------->>*/
                  Container(
                    height: 344,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AssetsConst.imgTrial),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start your free trial\ntoday!",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "This is a clear and concise call to action that encourages users to sign up for a free trial of StreamVibe.",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Start a Free Trail",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 16,
              ),
              color: ColorSchemeConfig.customDeepBlack,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Home",
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Categories",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Devices",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pricing",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "FAQ",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Movies",
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Gernes",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Trending",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "New Release",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Popular",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Shows",
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Gernes",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Trending",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "New Release",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Popular",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Support",
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Contact Us",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Subscription",
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Plans",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Features",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Subscription",
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Plans",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "\@2023 streamvib, All Rights Reserved",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Terms of Use | Privacy Policy | Cookie Policy",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.secondary,
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
