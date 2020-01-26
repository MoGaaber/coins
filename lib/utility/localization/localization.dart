import 'package:flutter/material.dart';

class Localization {
  Localization(this.locale);

  final Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map> _localizedValues = {
    'en': {
      'instructions': [
        "Long press on the section of Chart and don't move up your finger from it",
        "Long press again on it",
        "No , Long press on it again and don't move up your finger this time",
        "Now drag your finger in hirozintal directions",
        "you are succefully do it . Enjoy :)"
      ],
      'out': 'Previous Days',
      'dialogButtons': ['Exit', 'Share App :)'],
      'language': ['Choose Language'],
      'notification': 'We have anew update on prices check it out',
      'drawer': [
        'Lebanese Pound',
        'Syrian Pound',
        'Currency Calculator',
        'اسعار المحروقات',
        'اسعار الذهب',
        'Economy News',
         'Share App',
        'Rate App',
      ],
      'warning':
          "Disclaimer: We are just a publisher of the market price and exchangers, and we have no role in determining the price.",
      'coin': ['Last update', 'Official Price', 'Previous days'],
      'pages': ['Currencies Converter', 'Lebanese Pound', 'Syrian Pound'],
      'currencyTypes': ['US Dollar', 'LB Pound', 'SY Pound','Tuk Pound','EUR Pound','EGP Pound'],
      'globals': ['From', 'To', 'Buy', 'Sell', 'Type here', 'Ok','Share app','Previous days'],
      'exit': 'Like the app?  Share it with your friends :)',
      'Rate app': [
        'Your rating helps us keep it going, make it constructive :)',
        'Rate now',
        'cancel'
      ],

    },
    'ar': {
      'instructions': [
        'اضغط مطولاً على الاحصائيات ولا ترفع اصبعك عنها',
        'إضغط عليه مجدداً',
        'لا . إضغط مطولاً عليه مره اخري ولا ترفع  إصبعك هذه المرة',
        'الآن قم بالسحب فى اتجاه عرضي',
        'لقد نجحت . استمتع '
      ],
      'dialogButtons': ['اغلاق', 'مشاركة التطبيق'],
      'language': ['إختيار اللغة'],
      'notification': 'We have anew update on prices check it out',
      'drawer': [
        'الليرة اللبنانية',
        'الليرة السورية',
        'محول العملات',
        'اسعار المحروقات',
        'اسعار الذهب',
        'أخبار الاقتصاد',
        'مشاركة التطبيق',
        'تقييم التطبيق',

      ],
      'warning':
      'تنويه: نحن مجرد ناقلين لسعر السوق والصرافين، وليس لنا أي دور في تحديد السعر.',
      'coin': ['اخر تحديث', 'السعر الرسمي', 'الأيام السابقة'],
      'globals': ['من', 'إلى', 'بيع', 'شراء', 'اكتب هنا', 'حسناً','مشاركة التطبيق','الايام السابقة'],
      'pages': ['العملة السورية', 'العملة اللبنانية', 'محول العملات'],
      'currencyTypes': [
        'الدولار الأميركي',
        'الليرة اللبنانية',
        'الليرة السورية',
        'الليرة التركية',
        'اليورو الاوروبي',
        'الجنيه المصري'
      ],
      'exit': 'أعجبك التطبيق؟ شاركه مع أصدقائك :)',
      'rateApp': [
        'تقييمك يساعدنا على الاستمرار، اجعله بناءً :)',
        'تقييم التطبيق',
        'لاحقاً'
      ],





    },
  };

  List<String> get drawer {
    return _localizedValues[locale.languageCode]['drawer'];
  }

  List<String> get rateApp {
    return _localizedValues[locale.languageCode]['rateApp'];
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

  List<String> get instruction {
    return _localizedValues[locale.languageCode]['instructions'];
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
