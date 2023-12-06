part of 'pages.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Language.getInstance().languageNotifier,
        builder: (context, language, child) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, stateAuthentication) {
            stateAuthentication as AuthenticationDataLoaded;

            if (kDebugMode) {
              stateAuthentication.textControllerUsernameSignIn.text = 'BlastTea';
              stateAuthentication.textControllerPasswordSignIn.text = '12345MenangHadiah';
            }

            return Scaffold(
              body: AutofillGroup(
                child: SafeArea(
                  child: Center(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shrinkWrap: true,
                      children: [
                        Center(child: Text(language['Sign in']!, style: Theme.of(context).textTheme.headlineLarge)),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: stateAuthentication.textControllerUsernameSignIn,
                          decoration: InputDecoration(
                            labelText: language['Username']!,
                          ),
                          textInputAction: TextInputAction.next,
                          readOnly: stateAuthentication.isSigningIn,
                          autofillHints: const [AutofillHints.username],
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: stateAuthentication.textControllerPasswordSignIn,
                          decoration: InputDecoration(
                            labelText: language['Password']!,
                            suffixIcon: IconButton(
                              onPressed: () => MyApp.authenticationBloc.add(SetIsSignInPasswordVisible(value: !stateAuthentication.isSignInPasswordVisible)),
                              icon: Icon(!stateAuthentication.isSignInPasswordVisible ? Icons.visibility : Icons.visibility_off),
                            ),
                          ),
                          obscureText: !stateAuthentication.isSignInPasswordVisible,
                          textInputAction: TextInputAction.done,
                          readOnly: stateAuthentication.isSigningIn,
                          autofillHints: const [AutofillHints.password],
                          onEditingComplete: () => MyApp.authenticationBloc.add(SignInPressed()),
                        ),
                        const SizedBox(height: 16.0),
                        FilledButton(
                          onPressed: stateAuthentication.isSigningIn ? null : () => MyApp.authenticationBloc.add(SignInPressed()),
                          child: stateAuthentication.isSigningIn
                              ? const SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: CircularProgressIndicator(),
                                )
                              : Text(language['Sign in']!),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(language['Don\'t have an account yet?']!),
                            TextButton(
                              onPressed: stateAuthentication.isSigningIn ? null : () => NavigationHelper.to(MaterialPageRoute(builder: (context) => const SignUpPage())),
                              child: Text(language['Sign up']!),
                            ),
                          ],
                        )
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
