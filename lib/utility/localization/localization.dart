import 'package:flutter/material.dart';

class Localization {
  Localization(this.locale);

  final Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map> _localizedValues = {
    'en': {
      'out': 'Previous Days',
      'dialogButtons': ['Exit', 'Share App :)'],
      'language': ['Choose Language'],
      'instruction': ['Long press', 'Drag'],
      'notification': 'We have anew update on prices check it out',
      'drawer': [
        'Lebanese Pound',
        'Syrian Pound',
        'Currency Calculator',
        'Share App',
        'Rate App',
      ],
      'warning':
          "Disclaimer: We are just a publisher of the market price and exchangers and we have no role in determining the price .",
      'coin': ['Last update', 'Official Price ', 'Previous Days'],
      'pages': ['Currencies Converter', 'Lebanon Pound', 'Syrian Pound'],
      'currencyTypes': ['US Dollar', 'LB Pound', 'SY Pound'],
      'globals': ['From', 'To', 'Buy', 'Sell', 'Type Here'],
      'exit': 'Like the app?  Share it with your friends :)'
    },
    'ar': {
      'dialogButtons': ['اغلاق', 'مشاركة التطبيق :)'],
      'language': ['إختيار اللغة'],
      'notification': 'We have anew update on prices check it out',
      'drawer': [
        'الليرة اللبنانية',
        'الليرة السورية',
        'محول العملات',
        'التقييم والدعم',
        'مشاركة التطبيق',
        'تقييم التطبيق',
      ],
      'warning':
          'تنويه: نحن مجرد ناقلين لسعر السوق والصرافين، وليس لنا أي دور في تحديد السعر.',
      'coin': ['اخر تحديث', 'السعر الرسمي', 'الأيام السابقة'],
      'globals': ['من', 'إلى', 'بيع', 'شراء', 'اكتب هنا'],
      'pages': ['العملة السورية', 'العملة اللبنانية', 'محول العملات'],
      'currencyTypes': [
        'الدولار الأميركي',
        'الليرة اللبنانية',
        'الليرة السورية'
      ],
      'exit': 'أعجبك التطبيق؟ شاركه مع أصدقائك :)'
    },
  };

  List<String> get drawer {
    return _localizedValues[locale.languageCode]['drawer'];
  }

  List<String> get language {
    return _localizedValues[locale.languageCode]['language'];
  }

  String get warning {
    return _localizedValues[locale.languageCode]['warning'];
  }

  List<String> get coin {
    return _localizedValues[locale.languageCode]['coin'];
  }

  List<String> get globals {
    return _localizedValues[locale.languageCode]['globals'];
  }

  List<String> get currencyTypes {
    return _localizedValues[locale.languageCode]['currencyTypes'];
  }

  List<String> get dialogButtons {
    return _localizedValues[locale.languageCode]['dialogButtons'];
  }

  String get exit {
    return _localizedValues[locale.languageCode]['exit'];
  }
}
