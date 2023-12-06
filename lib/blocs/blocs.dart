import 'dart:async';

import 'package:calory_tracker/enums/enums.dart';
import 'package:calory_tracker/main.dart';
import 'package:calory_tracker/models/model.dart';
import 'package:calory_tracker/services/services.dart';
import 'package:calory_tracker/utils/utils.dart';
import 'package:calory_tracker/views/pages/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_widget/m_widget.dart';

part 'authentication_bloc/authentication_bloc.dart';
part 'authentication_bloc/authentication_event.dart';
part 'authentication_bloc/authentication_state.dart';

part 'home_bloc/home_bloc.dart';
part 'home_bloc/home_event.dart';
part 'home_bloc/home_state.dart';

part 'add_activity_bloc/add_activity_bloc.dart';
part 'add_activity_bloc/add_activity_event.dart';
part 'add_activity_bloc/add_activity_state.dart';

part 'history_bloc/history_bloc.dart';
part 'history_bloc/history_event.dart';
part 'history_bloc/history_state.dart';

part 'profile_bloc/profile_bloc.dart';
part 'profile_bloc/profile_event.dart';
part 'profile_bloc/profile_state.dart';
