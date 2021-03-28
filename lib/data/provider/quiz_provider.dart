import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/data/model/category_model.dart';
import 'package:kunime_app/data/model/question_model.dart';

class QuizProvider extends ChangeNotifier {
  List<CategoryModel> _categories = <CategoryModel>[];
  List<QuestionModel> _questions = <QuestionModel>[];
  int _questionPage = 0;

  List<CategoryModel> get categories => _categories;
  List<QuestionModel> get questions => _questions;
  int get questionPage => _questionPage;

  void setQuestionPage(int page) {
    _questionPage = page;
    notifyListeners();
  }

  void initCategory({
    bool initialize = false,
  }) {
    // RESET DATA
    this._categories = <CategoryModel>[];
    // SET NEW DATA
    CategoryModel _onePiece = CategoryModel(
      id: 1,
      image: "assets/images/poster_onepiece.png",
      name: "One Piece",
    );
    this._categories.add(_onePiece);
    CategoryModel _blackClover = CategoryModel(
      id: 2,
      image: "assets/images/poster_blackclover.jpeg",
      name: "Black Clover",
    );
    this._categories.add(_blackClover);
    CategoryModel _naruto = CategoryModel(
      id: 3,
      image: "assets/images/poster_naruto.jpg",
      name: "Naruto",
    );
    this._categories.add(_naruto);
    CategoryModel _jujutsu = CategoryModel(
      id: 4,
      image: "assets/images/poster_jujutsu.png",
      name: "Jujutsu Kaisen",
    );
    this._categories.add(_jujutsu);
    if (initialize) {
      notifyListeners();
    }
  }

  void initQuestion(int id) {
    this._questions = <QuestionModel>[];

    switch (id) {
      case 2:
        print("Black Clover");
        break;
      case 3:
        print("Naruto");
        break;
      case 4:
        print("Jujutsu Kaisen");
        break;
      default:
        QuestionModel _dummy = QuestionModel(
          id: 1,
          name:
              "Siapakah nakama yang pertama kali di rekrut menjadi Kru Bajak laut Topi Jerami?",
          categoryId: 1,
        );
        QuestionAnswerModel answer1 = QuestionAnswerModel(
          answer: "Roronoa Zoro",
          id: 1,
          isCorrect: true,
        );
        QuestionAnswerModel answer2 = QuestionAnswerModel(
          answer: "Nami",
          id: 2,
          isCorrect: false,
        );
        QuestionAnswerModel answer3 = QuestionAnswerModel(
          answer: "Usop",
          id: 3,
          isCorrect: false,
        );
        QuestionAnswerModel answer4 = QuestionAnswerModel(
          answer: "Sanji",
          id: 4,
          isCorrect: false,
        );
        _dummy.answers = [answer1, answer2, answer3, answer4];
        this._questions.add(_dummy);
        Navigation.navigate(routes.QuizRoute);
        break;
    }
  }
}
