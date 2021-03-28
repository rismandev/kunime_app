class QuestionModel {
  int id;
  String name;
  int categoryId;
  List<QuestionAnswerModel> answers;

  QuestionModel({
    this.id,
    this.name,
    this.categoryId,
    this.answers,
  });
}

class QuestionAnswerModel {
  int id;
  String answer;
  bool isCorrect;

  QuestionAnswerModel({
    this.id,
    this.answer,
    this.isCorrect = false,
  });
}
