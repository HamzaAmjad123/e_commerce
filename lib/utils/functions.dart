

import 'package:intl/intl.dart';

class Methods{
  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    DateTime dates = DateTime.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}