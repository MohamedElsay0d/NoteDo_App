import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:translator/translator.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({
    Key? key,
    // required this.isWhiteMode
  });
  // final bool isWhiteMode;

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final outputController = TextEditingController();
  final translator = GoogleTranslator();
  String inputText = '';
  String inputLanguage = 'ar';
  String outputLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('NoteDo Translate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 24),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 49, 49, 49),
                  border: Border.all(
                    width: 20,
                    color: Color.fromARGB(255, 49, 49, 49),
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Ionicons.language,
                  size: 90,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'NoteDo Translator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    // color:
                    //     // widget.isWhiteMode ? Colors.black :
                    //     Colors.white,
                  ),
                ),
              ),
              TextField(
                scrollController: ScrollController(),
                style: TextStyle(
                    // color:
                    //     // widget.isWhiteMode ? Colors.black :
                    //     Colors.white,
                    ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'أدخل النص هنا ..',
                ),
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                  translateText(); // ترجم النص عندما يتم تغييره
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      // widget.isWhiteMode ? Colors.black :
                      // Colors.white,
                    ),
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    // widget.isWhiteMode ? Colors.white :

                    value: inputLanguage,
                    items: <String>[
                      'af',
                      'am',
                      'ar',
                      'az',
                      'be',
                      'bg',
                      'bn',
                      'bs',
                      'ca',
                      'ceb',
                      'co',
                      'cs',
                      'cy',
                      'da',
                      'de',
                      'el',
                      'en',
                      'eo',
                      'es',
                      'et',
                      'eu',
                      'fa',
                      'fi',
                      'fr',
                      'fy',
                      'ga',
                      'gd',
                      'gl',
                      'gu',
                      'ha',
                      'haw',
                      'he',
                      'hi',
                      'hmn',
                      'hr',
                      'ht',
                      'hu',
                      'hy',
                      'id',
                      'ig',
                      'is',
                      'it',
                      'iw',
                      'ja',
                      'jw',
                      'ka',
                      'kk',
                      'km',
                      'kn',
                      'ko',
                      'ku',
                      'ky',
                      'la',
                      'lb',
                      'lo',
                      'lt',
                      'lv',
                      'mg',
                      'mi',
                      'mk',
                      'ml',
                      'mn',
                      'mr',
                      'ms',
                      'mt',
                      'my',
                      'ne',
                      'nl',
                      'no',
                      'ny',
                      'pa',
                      'pl',
                      'ps',
                      'pt',
                      'ro',
                      'ru',
                      'sd',
                      'si',
                      'sk',
                      'sl',
                      'sm',
                      'sn',
                      'so',
                      'sq',
                      'sr',
                      'st',
                      'su',
                      'sv',
                      'sw',
                      'ta',
                      'te',
                      'tg',
                      'th',
                      'tl',
                      'tr',
                      'uk',
                      'ur',
                      'uz',
                      'vi',
                      'xh',
                      'yi',
                      'yo',
                      'zh',
                      'zh-TW',
                      'zu'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        inputLanguage = value!;
                      });
                      translateText(); // ترجم النص عند تغيير لغة الإدخال
                    },
                  ),
                  const Icon(LineIcons.arrowRight),
                  DropdownButton<String>(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      // widget.isWhiteMode ? Colors.black :
                      // Colors.white,
                    ),
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    value: outputLanguage,
                    items: <String>[
                      'af',
                      'am',
                      'ar',
                      'az',
                      'be',
                      'bg',
                      'bn',
                      'bs',
                      'ca',
                      'ceb',
                      'co',
                      'cs',
                      'cy',
                      'da',
                      'de',
                      'el',
                      'en',
                      'eo',
                      'es',
                      'et',
                      'eu',
                      'fa',
                      'fi',
                      'fr',
                      'fy',
                      'ga',
                      'gd',
                      'gl',
                      'gu',
                      'ha',
                      'haw',
                      'he',
                      'hi',
                      'hmn',
                      'hr',
                      'ht',
                      'hu',
                      'hy',
                      'id',
                      'ig',
                      'is',
                      'it',
                      'iw',
                      'ja',
                      'jw',
                      'ka',
                      'kk',
                      'km',
                      'kn',
                      'ko',
                      'ku',
                      'ky',
                      'la',
                      'lb',
                      'lo',
                      'lt',
                      'lv',
                      'mg',
                      'mi',
                      'mk',
                      'ml',
                      'mn',
                      'mr',
                      'ms',
                      'mt',
                      'my',
                      'ne',
                      'nl',
                      'no',
                      'ny',
                      'pa',
                      'pl',
                      'ps',
                      'pt',
                      'ro',
                      'ru',
                      'sd',
                      'si',
                      'sk',
                      'sl',
                      'sm',
                      'sn',
                      'so',
                      'sq',
                      'sr',
                      'st',
                      'su',
                      'sv',
                      'sw',
                      'ta',
                      'te',
                      'tg',
                      'th',
                      'tl',
                      'tr',
                      'uk',
                      'ur',
                      'uz',
                      'vi',
                      'xh',
                      'yi',
                      'yo',
                      'zh',
                      'zh-TW',
                      'zu'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        outputLanguage = value!;
                      });
                      translateText(); // ترجم النص عند تغيير لغة الإخراج
                    },
                  ),
                ],
              ),
              TextField(
                controller: outputController,
                scrollController: ScrollController(),
                style: TextStyle(
                    // color:
                    //     // widget.isWhiteMode ? Colors.black :
                    //     Colors.white,
                    ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Translation result',
                ),
                maxLines: 5,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> translateText() async {
    final translation = await translator.translate(
      inputText,
      from: inputLanguage,
      to: outputLanguage,
    );
    setState(() {
      outputController.text = translation.text;
    });
  }
}

// GestureDetector(
//   onTap: translateText,
//   child: Container(
//     alignment: Alignment.center,
//     height: 43,
//     margin: const EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 40,
//     ),
//     decoration: BoxDecoration(
//       color: Colors.blue,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: const Text(
//       'Translate',
//       style: TextStyle(color: Colors.white),
//     ),
//   ),
// ),
