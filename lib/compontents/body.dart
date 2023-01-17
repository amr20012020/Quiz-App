import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/compontents/QuestionCard.dart';
import 'package:quiz_app/compontents/progress_bar.dart';
import 'package:quiz_app/controllers/question_controllerBar.dart';
import 'package:quiz_app/model/Questions.dart';
import 'package:quiz_app/widgets/Colors.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
 /* Question question;
  Body(this.question);*/
  int currentQuestionIndex = 0;
  late List<Question> sample_question;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/images/bg.svg",
            width: double.infinity, fit: BoxFit.cover),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(() => Text.rich(
                    TextSpan(
                      text: "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: kSecondaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: "/${Question.sample_question.length}",
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),),
              ),
              Divider(thickness: 1.5,),
              SizedBox(height: kDefaultPadding,),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQunNum,
                  itemCount: Question.sample_question.length,
                  itemBuilder: (context,index) => QuestionCard(
                      question: Question.sample_question[index]
                  )),),
            ],
          ),
        ),
      ],
    );
  }
}
