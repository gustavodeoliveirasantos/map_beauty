import 'package:in_app_review/in_app_review.dart';

class MapBeautyInAppReview {
  static openStoreListing({required String appStoreId}) {
    final InAppReview inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(appStoreId: appStoreId);
  }

  static requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
