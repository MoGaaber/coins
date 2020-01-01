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
        'Rate App',
        'Share App'
      ],
      'warning':
          "Warning : We are only copiers of cashiers & market price's , we haven't any role in Determine the price ",
      'coin': [
        'Last update in',
        'Official price is',
        'Buy',
        'Sell',
        'From',
        'To',
        'Previous days'
      ],
      'pages': ['Currencies converter', 'Lebanon currency', 'Syrian currency'],
    },
    'ar': {
      'drawer': [
        'محول العملات',
        'العملة السورية',
        'العملة اللبنانية',
        'تقييم التطبيق',
        'مشاركه التطبيق'
      ],
      'warning':
          'تنويه : نحن مجرد ناقلين لسعر السوق والصرافيين وليس لنا أى دور فى تحديد السعر',
      'coin': [
        'اخر تحديث فى',
        'السعر الرسمى هو',
        'بيع',
        'شراء',
        'من',
        'إلى',
        'الأيام السابقة'
      ],
      'pages': ['العملة السورية', 'العملة اللبنانية', 'محول العملات'],
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
}
