import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Stacked Introduction"),
                const SizedBox(height: 20),
                Text(
                  viewModel.myDeclaration,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => viewModel.updateDeclaration(),
                  child: const Text("Greetings!"),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => viewModel.navigateToProfileView(),
                  child: const Text("My Profile"),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
