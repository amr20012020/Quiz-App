import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/score_Screen.dart';

import '../model/Questions.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin{

  AnimationController? _animationController;
  Animation? _animation;
  Animation get animation => this._animation!;

  PageController? _pageController;
  PageController get pageController => this._pageController!;


 // List<Question> sample_question = [];



  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAns;
  int get correctAns => this._correctAns!;


  int? _selectedAns;
  int get selectedAns => this._selectedAns!;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns!;


  @override
  void onInit() {
    _animationController = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!)..addListener(() {
      update();
    });
    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController!.dispose();
    _pageController!.dispose();
  }


  void checkAns(Question question, int selectedIndex){
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if(_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController!.stop();
    update();

    Future.delayed(Duration(seconds: 3),(){
      nextQuestion();
    });
  }


  void nextQuestion()async{
    if(_questionNumber.value != Question.sample_question.length){
      _isAnswered = false;
      _pageController!.nextPage(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease);

      // Reset the counter
      _animationController!.reset();
      _animationController!.forward().whenComplete(nextQuestion);
    }else{
     await Get.to(ScoreScreen());
    }
  }


  void updateTheQunNum(int index){
    _questionNumber.value = index +1;
  }
}