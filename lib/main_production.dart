import 'package:phundit_app/app/app.dart';
import 'package:phundit_app/bootstrap.dart';

void main() async {
  await AppStarter().bootstrap(() =>  const App());
}
