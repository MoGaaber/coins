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
        'Currency exchanger',
        'Syrian currecny',
        'Lebanon currecny',
        'Share App',
        'Rate App',
      ],
      'warning':
          "Warning : We are only copiers of cashiers & market price's , we haven't any role in Determine the price ",
      'coin': ['Last update in', 'Official price is', 'Previous days'],
      'pages': ['Currencies Converter', 'Lebanon Currency', 'Syrian Currency'],
      'currencyTypes': ['USA Dollar', 'Lebanon Lera', 'Syrian Lera'],
      'globals': ['From', 'To', 'Buy', 'Sell']
    },
    'ar': {
      'drawer': [
        'محول العملات',
        'العملة السورية',
        'العملة اللبنانية',
        'مشاركه التطبيق'
            'تقييم التطبيق',
      ],
      'warning':
          'تنويه : نحن مجرد ناقلين لسعر السوق والصرافيين وليس لنا أى دور فى تحديد السعر',
      'coin': ['اخر تحديث فى', 'السعر الرسمى هو', 'الأيام السابقة'],
      'globals': ['من', 'الى', 'بيع', 'شراء'],
      'pages': ['العملة السورية', 'العملة اللبنانية', 'محول العملات'],
      'currencyTypes': [
        'الدولار الأمريكى',
        'الليرة اللبنانية',
        'الليرة السورية'
      ]
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['drawer']['title'];
  }

  List get drawer {
    return _localizedValues[locale.languageCode]['drawer'];
  }

  String get warning {
    return _localizedValues[locale.languageCode]['warning'];
  }

  List get coin {
    return _localizedValues[locale.languageCode]['coin'];
  }

  List get globals {
    return _localizedValues[locale.languageCode]['globals'];
  }

  List get currencyTypes {
    return _localizedValues[locale.languageCode]['currencyTypes'];
  }
}
