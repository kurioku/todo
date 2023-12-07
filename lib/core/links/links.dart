import 'package:url_launcher/url_launcher.dart';

Future<void> gitHub() async {
  final github = Uri.parse('https://github.com/kurioku/todo');
  if (!await launchUrl(github)) {
    throw Exception();
  }
}
