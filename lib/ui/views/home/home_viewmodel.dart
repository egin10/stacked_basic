import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/app.locator.dart';
// import 'package:stacked_basic/app/app.router.dart';
import '../profile/profile_view.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String _declaration = "Stacked is soo cool";
  bool _hasSaid = false;

  String get myDeclaration => _declaration;

  final _navigationService = locator<NavigationService>();

  void navigateToProfileView() {
    // _navigationService.navigateTo(Routes.profileView);
    _navigationService.replaceWithTransition(
      const ProfileView(),
      duration: const Duration(milliseconds: 800),
      transitionStyle: Transition.leftToRight,
    );
  }

  void updateDeclaration() {
    _hasSaid = !_hasSaid;

    _declaration =
        _hasSaid ? "I say Stacked is soo cool" : "Stacked is soo cool";

    notifyListeners();
  }
}
