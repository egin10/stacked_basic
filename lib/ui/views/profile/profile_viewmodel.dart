import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/app.locator.dart';
import 'package:stacked_basic/models/profile.dart';
// import 'package:stacked_basic/app/app.router.dart';
import '../home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final Profile _userProfile = Profile(
    name: "Rahmat",
    age: 20,
    city: "Jakarta Selatan",
  );

  bool _isSetting = false;

  Profile get userProfile => _userProfile;

  bool get isSetting => _isSetting;

  void onUpdateSetting() {
    _isSetting = !_isSetting;
    notifyListeners();
  }

  void saveProfile({
    String? name,
    int? age,
    String? city,
  }) {
    _userProfile.name = name ?? _userProfile.name;
    _userProfile.age = age ?? _userProfile.age;
    _userProfile.city = city ?? _userProfile.city;
    notifyListeners();
    onUpdateSetting();
  }

  final _navigationService = locator<NavigationService>();

  void navigateToHomePage() {
    // _navigationService.navigateTo(Routes.homeView);
    _navigationService.replaceWithTransition(
      const HomeView(),
      duration: const Duration(milliseconds: 800),
      transitionStyle: Transition.rightToLeft,
    );
  }
}
