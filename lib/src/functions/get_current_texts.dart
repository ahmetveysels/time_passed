import 'package:time_passed/src/model/time_passed_model.dart';

part '../languages/texts_de.dart';
part '../languages/texts_en.dart';
part '../languages/texts_es.dart';
part '../languages/texts_fr.dart';
part '../languages/texts_hi.dart';
part '../languages/texts_pt.dart';
part '../languages/texts_ru.dart';
part '../languages/texts_tr.dart';
part '../languages/texts_zh.dart';

TimePassedTextsModel getCurrentTexts(String language) {
  switch (language) {
    case 'de':
      return _textsDe;
    case 'en':
      return _textsEn;
    case 'es':
      return _textsEs;
    case 'fr':
      return _textsFr;
    case 'hi':
      return _textsHi;
    case 'pt':
      return _textsPt;
    case 'ru':
      return _textsRu;
    case 'tr':
      return _textsTr;
    case 'zh':
      return _textsZh;
    default:
      return _textsEn;
  }
}
