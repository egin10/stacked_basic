import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: viewModel.isSetting
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Setting Profile"),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 8,
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            label: Text("Name"),
                          ),
                          controller: viewModel.nameController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 8,
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            label: Text("Age"),
                          ),
                          controller: viewModel.ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 8,
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            label: Text("City"),
                          ),
                          controller: viewModel.cityController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () => viewModel.saveProfile(),
                        child: const Text("Save"),
                      ),
                      TextButton(
                        onPressed: () => viewModel.onUpdateSetting(),
                        child: const Text("Cancel"),
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileItem(
                          title: "Name", content: viewModel.userProfile.name),
                      const SizedBox(height: 20),
                      ProfileItem(
                          title: "Age",
                          content: viewModel.userProfile.age.toString()),
                      const SizedBox(height: 20),
                      ProfileItem(
                          title: "Address",
                          content: viewModel.userProfile.city),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () => viewModel.onUpdateSetting(),
                        child: const Text("Setting"),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () => viewModel.navigateToHomePage(),
                        child: const Text("Back to Home"),
                      ),
                    ],
                  ),
          ),
        );
      },
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title, content;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
