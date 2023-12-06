part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, stateAuthentication) {
            stateAuthentication as AuthenticationDataLoaded;

            return Scaffold(
              appBar: AppBar(),
              body: AutofillGroup(
                child: SafeArea(
                  child: Center(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shrinkWrap: true,
                      children: [
                        Center(child: Text(language['Sign up']!, style: Theme.of(context).textTheme.headlineLarge)),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: stateAuthentication.textControllerUsernameSignUp,
                          decoration: InputDecoration(
                            labelText: language['Username']!,
                          ),
                          textInputAction: TextInputAction.next,
                          readOnly: stateAuthentication.isSigningUp,
                          autofillHints: const [AutofillHints.newUsername],
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: stateAuthentication.textControllerPasswordSignUp,
                          decoration: InputDecoration(
                            labelText: language['Password']!,
                            suffixIcon: IconButton(
                              onPressed: () => MyApp.authenticationBloc.add(SetIsSignUpPasswordVisible(value: !stateAuthentication.isSignUpPasswordVisible)),
                              icon: Icon(!stateAuthentication.isSignUpPasswordVisible ? Icons.visibility : Icons.visibility_off),
                            ),
                          ),
                          obscureText: !stateAuthentication.isSignUpPasswordVisible,
                          textInputAction: TextInputAction.next,
                          readOnly: stateAuthentication.isSigningUp,
                          autofillHints: const [AutofillHints.newPassword],
                        ),
                        const SizedBox(height: 16.0),
                        DateField(
                          value: stateAuthentication.userSignup.dateOfBirth,
                          firstDate: DateTime(0),
                          lastDate: DateTime.now(),
                          onDateChanged: (value) => value != null ? MyApp.authenticationBloc.add(SetUserSignUp(value: stateAuthentication.userSignup.copyWith(dateOfBirth: value))) : null,
                          decoration: InputDecoration(
                            labelText: language['Date of birth']!,
                          ),
                          autoFillHints: const [AutofillHints.birthday],
                          readOnly: true,
                        ),
                        const SizedBox(height: 16.0),
                        ...Gender.values.map(
                          (e) => RadioListTile(
                            value: e,
                            groupValue: stateAuthentication.userSignup.gender,
                            title: Text(language[e.text]!),
                            onChanged: (value) => MyApp.authenticationBloc.add(SetUserSignUp(value: stateAuthentication.userSignup.copyWith(gender: value!))),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        FilledButton(
                          onPressed: stateAuthentication.isSigningUp ? null : () => MyApp.authenticationBloc.add(SignUpPressed()),
                          child: stateAuthentication.isSigningUp
                              ? const SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: CircularProgressIndicator(),
                                )
                              : Text(language['Sign up']!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
