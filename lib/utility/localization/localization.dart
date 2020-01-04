import 'package:flutter/material.dart';

class Localization {
  Localization(this.locale);

  final Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map> _localizedValues = {
    'en': {
      'drawer': [
        'Lebanese Pound',
        'Syrian Pound',
        'Currency Calculator',
        'Share App',
        'Rate App',
      ],
      'warning':
          "Disclaimer: We are just a publisher of the market price and exchangers , and we have no role in determining the price",
      'coin': ['Last update', 'Official Price ', 'Previous Days'],
      'pages': ['Currencies Converter', 'Lebanon Pound', 'Syrian Pound'],
      'currencyTypes': ['US Dollar', 'LB Pound', 'SY Pound'],
      'globals': ['From', 'To', 'Buy', 'Sell', 'Type Here']
    },
    'ar': {
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
        'الدولار الأميريكي',
        'الليرة اللبنانية',
        'الليرة السورية'
      ]
    },
  };

  List<String> get drawer {
    return _localizedValues[locale.languageCode]['drawer'];
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
}
