import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

ValueNotifier<String> appLang = ValueNotifier<String>('en');

class TText extends StatelessWidget {
final String text; final TextStyle? style;   final TextAlign align;


  const TText(this.text, {this.style, super.key, this.align = TextAlign.center,});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: appLang,
      builder: (_, lang, __) {
        return FutureBuilder<String>(
          future: TranslateService.translate(text, lang),
          builder: (context, snapshot) {
            return Text(snapshot.data ?? text, style: style, textAlign: TextAlign.center);
          },
        );
      },
    );
  }
}

class TranslateService {
  static final translator = GoogleTranslator();

  static Future<String> translate(String text, String langCode) async {
    if (langCode == 'en') return text; // default
    final result = await translator.translate(text, to: langCode);
    return result.text;
  }
}

class LanguageProvider extends ChangeNotifier {
  String _lang = 'en';

  String get lang => _lang;

  LanguageProvider() {
    loadLang();
  }

  Future<void> loadLang() async {
    final prefs = await SharedPreferences.getInstance();
    _lang = prefs.getString('lang') ?? 'en';
    notifyListeners();
  }

  Future<void> setLang(String code) async {
    final prefs = await SharedPreferences.getInstance();
    _lang = code;
    await prefs.setString('lang', code);
    notifyListeners();
  }
}