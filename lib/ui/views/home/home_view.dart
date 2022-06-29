import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/ui/views/profile/profile_viewmodel.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, homeViewModel, child) {
        return ViewModelBuilder<ProfileViewModel>.reactive(
          builder: (context, profileViewModel, child) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Stacked Introduction"),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Hello"),
                        const SizedBox(width: 2),
                        Text(
                          profileViewModel.userProfile.name,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      homeViewModel.myDeclaration,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => homeViewModel.updateDeclaration(),
                      child: const Text("Greetings!"),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => homeViewModel.navigateToProfileView(),
                      child: const Text("My Profile"),
                    ),
                  ],
                ),
              ),
            );
          },
          viewModelBuilder: () => ProfileViewModel(),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
