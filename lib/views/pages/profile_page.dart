part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.profileBloc.add(InitializeProfileData());

    return ValueListenableBuilder(
      valueListenable: Language.getInstance().languageNotifier,
      builder: (context, language, child) => BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, stateProfile) {
          stateProfile as ProfileDataLoaded;

          return PopScope(
            canPop: !stateProfile.isDiff,
            onPopInvoked: (didPop) async {
              if (stateProfile.isDiff) {
                bool? isSaved = await showSaveChangesDialog();

                if (isSaved ?? false) {
                  MyApp.profileBloc.add(ProfileSavePressed());
                } else if (!(isSaved ?? true)) {
                  NavigationHelper.back();
                }
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(language['Profile']!),
              ),
              floatingActionButton: stateProfile.isDiff
                  ? FloatingActionButton.extended(
                      onPressed: () => MyApp.profileBloc.add(ProfileSavePressed()),
                      icon: const Icon(Icons.done),
                      label: Text(language['Save']!),
                    )
                  : null,
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: stateProfile.textControllerUsername,
                    decoration: InputDecoration(
                      labelText: language['Username']!,
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: stateProfile.textControllerPassword,
                    decoration: InputDecoration(
                      labelText: language['Password']!,
                      suffixIcon: IconButton(
                        onPressed: () => MyApp.profileBloc.add(SetProfileIsPasswordVisible(value: !stateProfile.isPasswordVisible)),
                        icon: Icon(!stateProfile.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    obscureText: !stateProfile.isPasswordVisible,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16.0),
                  DateField(
                    value: stateProfile.currentUser.dateOfBirth,
                    firstDate: DateTime(0),
                    lastDate: DateTime.now(),
                    onDateChanged: (value) => value != null ? MyApp.profileBloc.add(SetProfileUser(value: stateProfile.currentUser.copyWith(dateOfBirth: value))) : null,
                    decoration: InputDecoration(
                      labelText: language['Date of birth']!,
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 16.0),
                  ...Gender.values.map(
                    (e) => RadioListTile(
                      value: e,
                      groupValue: stateProfile.currentUser.gender,
                      title: Text(language[e.text]!),
                      onChanged: (value) => MyApp.profileBloc.add(SetProfileUser(value: stateProfile.currentUser.copyWith(gender: value!))),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
