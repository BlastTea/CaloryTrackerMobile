part of '../blocs.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(_authenticationDataLoaded) {
    _textControllerUsernameSignUp.addListener(() {
      _userSignUp.username = _textControllerUsernameSignUp.text.trim();
      add(SetAuthenticationState());
    });

    _textControllerPasswordSignUp.addListener(() {
      _userSignUp.password = _textControllerPasswordSignUp.text.trim();
      add(SetAuthenticationState());
    });

    on<SetAuthenticationState>((event, emit) => emit(event.state ?? _authenticationDataLoaded));

    on<SetIsSignInPasswordVisible>((event, emit) {
      _isSignInPasswordVisible = event.value;
      emit(_authenticationDataLoaded);
    });

    on<SetIsSignUpPasswordVisible>((event, emit) {
      _isSignUpPasswordVisible = event.value;
      emit(_authenticationDataLoaded);
    });

    on<SetUserSignUp>((event, emit) {
      _userSignUp = event.value;
      emit(_authenticationDataLoaded);
    });

    on<SignInPressed>((event, emit) async {
      if (_textControllerUsernameSignIn.text.trim().isEmpty || _textControllerPasswordSignIn.text.trim().isEmpty) {
        NavigationHelper.clearSnackBars();
        NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Username or password is still empty')!)));
        return;
      }

      _isSigningIn = false;
      emit(_authenticationDataLoaded);

      try {
        List<User> users = await DbHelper.instance.read<User>(
          where: 'username = ? AND password = ?',
          whereArgs: [
            _textControllerUsernameSignIn.text.trim(),
            _textControllerPasswordSignIn.text.trim(),
          ],
        );

        User? user = users.trySingleWhere((element) => element.username == _textControllerUsernameSignIn.text.trim() && element.password == _textControllerPasswordSignIn.text.trim());
        if (user == null) {
          NavigationHelper.clearSnackBars();
          NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('User is not found')!)));
          return;
        }

        currentUser = user.copyWith();
      } catch (e) {
        showErrorDialog(e.toString());
        _isSigningIn = false;
        emit(_authenticationDataLoaded);
        return;
      }

      _isSigningIn = false;
      emit(_authenticationDataLoaded);

      NavigationHelper.toReplacement(MaterialPageRoute(builder: (context) => const Homepage()));
      await Future.delayed(const Duration(milliseconds: 300));

      _textControllerUsernameSignIn.text = '';
      _textControllerPasswordSignIn.text = '';
      _isSignInPasswordVisible = false;
      emit(_authenticationDataLoaded);
    });

    on<SignUpPressed>((event, emit) async {
      if (_textControllerUsernameSignUp.text.trim().isEmpty || _textControllerPasswordSignUp.text.trim().isEmpty) {
        NavigationHelper.clearSnackBars();
        NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Username or password is still empty')!)));
        return;
      }

      _isSigningUp = true;
      emit(_authenticationDataLoaded);

      int affectedRows = 0;

      try {
        affectedRows = await DbHelper.instance.create(_userSignUp);
        if (affectedRows > 0) {
          NavigationHelper.clearSnackBars();
          NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Account created successfully')!)));
        } else {
          showErrorDialog(Language.getInstance().getValue('Account failed to create')!);
          _isSigningUp = false;
          emit(_authenticationDataLoaded);
          return;
        }
      } catch (e) {
        showErrorDialog(Language.getInstance().getValue('Account failed to create')!);
        _isSigningUp = false;
        emit(_authenticationDataLoaded);
        return;
      }

      _isSigningUp = false;
      emit(_authenticationDataLoaded);

      NavigationHelper.back();
      await Future.delayed(const Duration(milliseconds: 300));

      _textControllerUsernameSignUp.text = '';
      _textControllerPasswordSignUp.text = '';
      _userSignUp = User(username: '', password: '', dateOfBirth: DateTime.now(), gender: Gender.man);
      _isSignUpPasswordVisible = false;
      emit(_authenticationDataLoaded);
    });
  }

  static final TextEditingController _textControllerUsernameSignIn = TextEditingController();
  static final TextEditingController _textControllerPasswordSignIn = TextEditingController();
  static final TextEditingController _textControllerUsernameSignUp = TextEditingController(text: kDebugMode ? 'BlastTea' : '');
  static final TextEditingController _textControllerPasswordSignUp = TextEditingController(text: kDebugMode ? '12345MenangHadiah' : '');

  static User _userSignUp = User(username: kDebugMode ? 'BlastTea' : '', password: kDebugMode ? '12345MenangHadiah' : '', dateOfBirth: kDebugMode ? DateTime(2003, 9, 9) : DateTime.now(), gender: Gender.man);

  static bool _isSignInPasswordVisible = false;
  static bool _isSignUpPasswordVisible = false;
  static bool _isSigningIn = false;
  static bool _isSigningUp = false;

  static AuthenticationDataLoaded get _authenticationDataLoaded => AuthenticationDataLoaded(
        textControllerUsernameSignIn: _textControllerUsernameSignIn,
        textControllerPasswordSignIn: _textControllerPasswordSignIn,
        textControllerUsernameSignUp: _textControllerUsernameSignUp,
        textControllerPasswordSignUp: _textControllerPasswordSignUp,
        userSignup: _userSignUp,
        isSignInPasswordVisible: _isSignInPasswordVisible,
        isSignUpPasswordVisible: _isSignUpPasswordVisible,
        isSigningIn: _isSigningIn,
        isSigningUp: _isSigningUp,
      );
}
