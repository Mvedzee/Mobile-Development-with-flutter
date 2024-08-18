import 'package:get/get.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../core/screens/dashboard/dashboard.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    var user = AuthenticationRepository.instance.currentUser();
    isVerified && user != null ? Get.offAll(Dashboard(user: user)) : Get.back();
  }
}
