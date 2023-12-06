part of '../blocs.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(_profileDataLoaded) {
    _textControllerUsername.addListener(() {
      _currentUser.username = _textControllerUsername.text.trim();
      _checkIsDiff();
      add(SetProfileState());
    });

    _textControllerPassword.addListener(() {
      _currentUser.password = _textControllerPassword.text.trim();
      _checkIsDiff();
      add(SetProfileState());
    });

    on<SetProfileState>((event, emit) => emit(event.state ?? _profileDataLoaded));

    on<InitializeProfileData>((event, emit) {
      _currentUser = currentUser.copyWith();
      _textControllerUsername.text = currentUser.username;
      _textControllerPassword.text = currentUser.password;

      emit(_profileDataLoaded);
    });

    on<SetProfileUser>((event, emit) {
      _currentUser = event.value;
      _checkIsDiff();
      emit(_profileDataLoaded);
    });

    on<SetProfileIsPasswordVisible>((event, emit) {
      _isPasswordVisible = event.value;
      emit(_profileDataLoaded);
    });

    on<ProfileSavePressed>((event, emit) async {
      if (_textControllerUsername.text.trim().isEmpty || _textControllerPassword.text.trim().isEmpty) {
        NavigationHelper.clearSnackBars();
        NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Username or password is still empty')!)));
        return;
      }

      try {
        int affectedRows = await DbHelper.instance.update(_currentUser);

        if (affectedRows > 0) {
          NavigationHelper.clearSnackBars();
          NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Profile saved successfully')!)));
        } else {
          NavigationHelper.clearSnackBars();
          NavigationHelper.showSnackBar(SnackBar(content: Text(Language.getInstance().getValue('Profile failed to save')!)));
          return;
        }
      } catch (e) {
        return showErrorDialog(Language.getInstance().getValue('Profile failed to save')!);
      }

      NavigationHelper.back();
      await Future.delayed(const Duration(milliseconds: 300));

      currentUser = _currentUser.copyWith();
      _isPasswordVisible = false;
      _isDiff = false;
      emit(_profileDataLoaded);
    });
  }

  static final TextEditingController _textControllerUsername = TextEditingController(text: currentUser.username);
  static final TextEditingController _textControllerPassword = TextEditingController(text: currentUser.password);

  static User _currentUser = currentUser.copyWith();

  static bool _isPasswordVisible = false;
  static bool _isDiff = false;

  static ProfileDataLoaded get _profileDataLoaded => ProfileDataLoaded(
        textControllerUsername: _textControllerUsername,
        textControllerPassword: _textControllerPassword,
        currentUser: _currentUser,
        isPasswordVisible: _isPasswordVisible,
        isDiff: _isDiff,
      );

  void _checkIsDiff() {
    if (currentUser.username != _currentUser.username) {
      _isDiff = true;
    } else if (currentUser.password != _currentUser.password) {
      _isDiff = true;
    } else if (currentUser.dateOfBirth != _currentUser.dateOfBirth) {
      _isDiff = true;
    } else if (currentUser.gender != _currentUser.gender) {
      _isDiff = true;
    } else {
      _isDiff = false;
    }
  }
}
