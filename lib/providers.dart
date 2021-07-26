import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:worker_attendace/core/view_model/auth_view_model.dart';
import 'package:worker_attendace/core/view_model/checkin_view_model.dart';
import 'package:worker_attendace/core/view_model/startup_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
  ChangeNotifierProvider(create: (ctx) => StartupViewModel()),
  ChangeNotifierProvider(create: (ctx) => CheckInViewModel()),
];
