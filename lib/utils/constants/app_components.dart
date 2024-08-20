import 'package:movie_review/dataModel/device_status.dart';
import 'package:movie_review/dataModel/qna_faq.dart';
import 'package:movie_review/utils/constants/assets_const.dart';

import '../../dataModel/app_explore_item.dart';

class AppComponents {
  AppComponents._();

  static final exploreItem = [
    AppExploreItem(
      image: "assets/images/Container (1).jpg",
      category: "Action",
    ),
    AppExploreItem(
      image: "assets/images/Container.png",
      category: "Adventure",
    ),
    AppExploreItem(
      image: "assets/images/Container (1).png",
      category: "Comedy",
    ),
    AppExploreItem(
      image: "assets/images/Container (2).png",
      category: "Drama",
    ),
    AppExploreItem(
      image: "assets/images/Container (3).png",
      category: "Horror",
    ),
  ];

  static final deviceStatus = [
    DeviceStatus(
      image: AssetsConst.iconMobile,
      label: "Smartphones",
      description:
          "StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store",
    ),
    DeviceStatus(
      image: AssetsConst.iconTablet,
      label: "Tablet",
      description:
          "StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store",
    ),
    DeviceStatus(
      image: AssetsConst.iconTv,
      label: "Smart TV",
      description:
          "StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store",
    ),
    DeviceStatus(
      image: AssetsConst.iconLaptop,
      label: "Laptops",
      description:
          "StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store",
    ),
    DeviceStatus(
      image: AssetsConst.iconGaming,
      label: "Gaming Consoles",
      description:
          "StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store",
    ),
    DeviceStatus(
      image: AssetsConst.iconVR,
      label: "VR Headsets",
      description:
          "StreamVibe is optimized for both Android and iOS smartphones. Download our app from the Google Play Store or the Apple App Store",
    ),
  ];

  static final qnafaqs = [
    QNAFAQ(
      question: "What is StreamVibe?",
      answer:
          "StreamVibe is a streaming service that allows you to watch movies and shows on demand.",
    ),
    QNAFAQ(
      question: "How much does StreamVibe cost?",
      answer: "We are updating",
    ),
    QNAFAQ(
      question: "What content is available on StreamVibe?",
      answer: "We are updating",
    ),
    QNAFAQ(
      question: "How can I watch StreamVibe?",
      answer: "We are updating",
    ),
    QNAFAQ(
      question: "How do I sign up for StreamVibe?",
      answer: "We are updating",
    ),
    QNAFAQ(
      question: "What is the StreamVibe free trial?",
      answer: "We are updating",
    ),
  ];
}
