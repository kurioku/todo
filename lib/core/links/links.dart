import 'package:url_launcher/url_launcher.dart';

final _gitHub = Uri.parse('https://github.com/kurioku/todo');

Future<void> gitHub() async {
  if (!await launchUrl(_gitHub)) {
    throw Exception();
  }
}
