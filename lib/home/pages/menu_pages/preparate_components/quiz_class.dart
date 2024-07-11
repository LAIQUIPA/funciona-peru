import 'package:funciona_peru/home/pages/menu_pages/preparate_components/question_class.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;

  Quiz({required this.name, required this.questions});

  double get percent => (right / questions.length) * 100;
}
