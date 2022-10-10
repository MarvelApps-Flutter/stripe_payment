import '../constant/image_constant.dart';
import '../model/assurance_card_detail_model.dart';

class DummyData {
  static List<String> featureList = [
    "Incorporation",
    "Banking",
    "Communication",
    "Offers",
  ];
  static List<AssuranceCardDetailModel> assuranceCardDetailList = [
    AssuranceCardDetailModel(
      title: "Worry-Free Compliance",
      subtitle: "All your filing will be taken care by us.",
      imgPath: ImageConstant.likeBookmark,
    ),
    AssuranceCardDetailModel(
      title: "100% Cashback Guarantee",
      subtitle: "we promise you 100% cashback guarantee.",
      imgPath: ImageConstant.privacyShield,
    ),
  ];
}
