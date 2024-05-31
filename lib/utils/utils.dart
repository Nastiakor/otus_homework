import 'package:intl/intl.dart';

String formatDuration(int duration) {
  if (duration >= 60) {
    int hours = duration ~/ 60;
    int minutes = duration % 60;
    if (minutes == 0) {
      return '$hours ${Intl.plural(hours, zero: 'часов', one: 'час', few: 'часа', many: 'часов', other: 'часов')}';
    } else {
      return '$hours ${Intl.plural(hours, zero: 'часов', one: 'час', few: 'часа', many: 'часов', other: 'часов')} $minutes ${Intl.plural(minutes, zero: 'минут', one: 'минута', two: 'минуты', few: 'минуты', many: 'минут', other: 'минут')}';
    }
  } else {
    return '$duration ${Intl.plural(duration, zero: 'минут', one: 'минута', two: 'минуты', few: 'минуты', many: 'минут', other: 'минут')}';
  }
}

String displayMeasureUnit(int? count, String measureUnit) {
  if (count == null || count == 0) return '';

  switch (measureUnit) {
    case 'штука':
      return Intl.plural(
        count,
        one: 'штука',
        few: 'штуки',
        many: 'штук',
        other: 'штук',
        locale: 'ru',
      );
    case 'грамм':
      return Intl.plural(
        count,
        one: 'грамм',
        few: 'грамма',
        many: 'граммов',
        other: 'граммов',
        locale: 'ru',
      );
    case 'банка':
      return Intl.plural(
        count,
        one: 'банка',
        few: 'банки',
        many: 'банок',
        other: 'банок',
        locale: 'ru',
      );
    case 'коробка':
      return Intl.plural(
        count,
        one: 'коробка',
        few: 'коробки',
        many: 'коробок',
        other: 'коробок',
        locale: 'ru',
      );
    case 'чайная ложка':
      return Intl.plural(
        count,
        one: 'чайная ложка',
        few: 'чайные ложки',
        many: 'чайных ложек',
        other: 'чайных ложек',
        locale: 'ru',
      );
    case 'столовая ложка':
      return Intl.plural(
        count,
        one: 'столовая ложка',
        few: 'столовые ложки',
        many: 'столовых ложек',
        other: 'столовых ложек',
        locale: 'ru',
      );
    case 'миллилитр':
      return Intl.plural(
        count,
        one: 'миллилитр',
        few: 'миллилитра',
        many: 'миллилитров',
        other: 'миллилитров',
        locale: 'ru',
      );
    case 'по вкусу':
      return 'по вкусу';
    case 'зубчик':
      return Intl.plural(
        count,
        one: 'зубчик',
        few: 'зубчика',
        many: 'зубчиков',
        other: 'зубчиков',
        locale: 'ru',
      );
    case 'головка':
      return Intl.plural(
        count,
        one: 'головка',
        few: 'головки',
        many: 'головок',
        other: 'головок',
        locale: 'ru',
      );
    case 'щепотка':
      return Intl.plural(
        count,
        one: 'щепотка',
        few: 'щепотки',
        many: 'щепоток',
        other: 'щепоток',
        locale: 'ru',
      );
    case 'килограмм':
      return Intl.plural(
        count,
        one: 'килограмм',
        few: 'килограмма',
        many: 'килограммов',
        other: 'килограммов',
        locale: 'ru',
      );
    default:
      return '';
  }
}
