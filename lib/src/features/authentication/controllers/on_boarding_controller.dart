import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../constants/colors.dart';
import '../../../constants/image.dart';
import '../../../constants/text.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding_screen/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController{

  //Variables
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  //Functions to trigger Skip, Next and onPageChange Events
  void skip() {
    controller.jumpToPage(page: 2);
  }
  void animateToNextSlide(){
    controller.animateToPage(page: controller.currentPage + 1);
  }
  void onPageChangedCallback(int activePageIndex){
    currentPage.value = activePageIndex;
  }

  //Three Onboarding Pages
  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: onBoardingImage1,
        title: onBoardingTitle1,
        subTitle: onBoardingSubTitle1,
        counterText: onBoardingCounter1,
        bgColor: onBoardingColor1,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: onBoardingImage2,
        title: onBoardingTitle2,
        subTitle: onBoardingSubTitle2,
        counterText: onBoardingCounter2,
        bgColor: onBoardingColor2,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: onBoardingImage3,
        title: onBoardingTitle3,
        subTitle: onBoardingSubTitle3,
        counterText: onBoardingCounter3,
        bgColor: onBoardingColor3,
      ),
    ),
  ];
}