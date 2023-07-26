import 'package:get/get.dart';
import 'package:vegas_point_portal/model/user.dart';

class MyGetXController extends GetxController {
  late RxInt valueRate = 0.obs;
  late RxString valueSearchInput = ''.obs;

  late RxBool isSearchVoucherInput = false.obs;

  late RxString userCardtrack = ''.obs;
  late RxString userName = ''.obs;
  late RxString userTier = ''.obs;
  late RxString userTierWNumber = ''.obs;

  late RxInt userNumber = 0.obs;
  late RxString userDateOfBirth = ''.obs;
  late RxInt userCurrentP = 0.obs;
  late RxInt userDailyP = 0.obs;
  late RxInt userDailyPSL = 0.obs;
  late RxInt userDailyPRL_TB = 0.obs;
  late RxInt userWeeklyP = 0.obs;
  late RxInt userMonthlyP = 0.obs;
  late RxInt userFrameP = 0.obs;
  late RxString userDateFrame = ''.obs;

  late RxString userCardtrackWNumber = ''.obs;
  late RxString userNameWNumber = ''.obs;
  late RxInt userNumberWNumber = 0.obs;
  late RxString userDateOfBirthWNumber = ''.obs;
  late RxInt userCurrentPWNumber = 0.obs;
  late RxInt userDailyPWNumber = 0.obs;
  late RxInt userDailyPSLWNumber = 0.obs;
  late RxInt userDailyPRL_TBWNumber = 0.obs;
  late RxInt userWeeklyPWNumber = 0.obs;
  late RxInt userMonthlyPWNumber = 0.obs;
  late RxInt userFramePWNumber = 0.obs;
  late RxString userDateFrameWNumber = ''.obs;


		//Move variable
  late RxBool hasChangeVoucherStatus = false.obs;
  late RxBool hasMoveToVouchers = false.obs;
  late RxBool hasMoveToPointNumber = false.obs;
  late RxBool hasChangePointWNumberPage = false.obs;
		//end
  late RxString userNumberSave = ''.obs;

  late RxBool isShowListSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //turn on search list
  turnonSearchList() {
    isShowListSearch = true.obs;
    update();
  }

  turnoffSearchList() {
    isShowListSearch = false.obs;
    update();
  }
  //turn off search list

  //pointpage with number
  turnOnPointNumberStatus() {
    hasChangePointWNumberPage = true.obs;
    update();
  }

  turnOffPointNumberStatus() {
    hasChangePointWNumberPage = false.obs;
    update();
  }

  //has move to vouchers page
  moveToVoucher(String value) {
    hasMoveToVouchers = true.obs;
    userNumberSave = value.obs;
    update();
  }

  backToPage() {
    hasMoveToVouchers = false.obs;
    update();
  }

  //voucher status
  turnOnVouchersStatus() {
    hasChangeVoucherStatus = true.obs;
    update();
  }

  turnOffVouchersStatus() {
    hasChangeVoucherStatus = false.obs;
    update();
  }

  //voucher seach input;
  turnOnVoucherSearchInput() {
    isSearchVoucherInput = true.obs;
    update();
  }

  turnOffVoucherSearchInput() {
    isSearchVoucherInput = false.obs;
    update();
  }

  saveSearchInputValue(String value) {
    valueSearchInput = value.obs;
    update();
  }

  removeSearchInputValue(value) {
    valueSearchInput = ''.obs;
    update();
    notifyChildrens();
  }

  saveUserData(User model) {
    userName = model.name!.obs;
    userCardtrack = model.cardtrack!.obs;
    userNumber = model.number!.obs;

    userDateOfBirth = model.dateofbirth!.obs;
    userCurrentP = model.currentPoint!.obs;
    userDailyP = model.dailyPoint!.obs;
    userDailyPSL = model.dailyPointSl!.obs;
    userDailyPRL_TB = model.dailyPointRl!.obs;

    userWeeklyP = model.weeklyPoint!.obs;
    userMonthlyP = model.monthlyPoint!.obs;

    //date frame
    userDateFrame = model.dateFrame!.obs;
    userFrameP = model.framePoint!.obs;
    userTier = model.tiername!.obs;
    update();
  }

  saveUserDataWithNumber(User model) {
    userNameWNumber = model.name!.obs;
    userCardtrackWNumber = model.cardtrack!.obs;
    userNumberWNumber = model.number!.obs;

    userDateOfBirthWNumber = model.dateofbirth!.obs;
    userCurrentPWNumber = model.currentPoint!.obs;
    userDailyPWNumber = model.dailyPoint!.obs;
    userDailyPSLWNumber = model.dailyPointSl!.obs;
    userDailyPRL_TBWNumber = model.dailyPointRl!.obs;

    userWeeklyPWNumber = model.weeklyPoint!.obs;
    userMonthlyPWNumber = model.monthlyPoint!.obs;

    //date frame
    userDateFrameWNumber = model.dateFrame!.obs;
    userFramePWNumber = model.framePoint!.obs;

				userTierWNumber = model.tiername!.obs;
    update();
  }

  //voucher search input end

  saveValueRate(int value) {
    valueRate = value.obs;
    update();
  }

  resetValueRate() {
    valueRate = 0.obs;
    update();
  }
}
