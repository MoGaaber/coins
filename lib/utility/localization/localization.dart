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
        'Support Us',
        'Share App',
        'Rate App',
      ],
      'warning':
          "Disclaimer: We are just a publisher of the market price and exchangers, nd we have no role in determining the price ",
      'coin': ['Last update', 'Official Price ', 'Previous Days'],
      'pages': ['Currencies Converter', 'Lebanon Currency', 'Syrian Currency'],
      'currencyTypes': ['USA Dollar', 'LB Pound', 'SY Pound'],
      'globals': ['From', 'To', 'Buy', 'Sell', 'Type Here']
    },
    'ar': {
      'drawer': [
        'العملة اللبنانية',
        'العملة السورية',
        'محول العملات',
        'ادعمنا',
        'مشاركه التطبيق',
        'تقييم التطبيق',
      ],
      'warning':
          'تنويه : نحن مجرد ناقلين لسعر السوق والصرافيين وليس لنا أى دور فى تحديد السعر',
      'coin': ['اخر تحديث', 'السعر الرسمى', 'الأيام السابقة'],
      'globals': ['من', 'الى', 'بيع', 'شراء', 'اكتب هنا'],
      'pages': ['العملة السورية', 'العملة اللبنانية', 'محول العملات'],
      'currencyTypes': [
        'الدولار الأمريكى',
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
