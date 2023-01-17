import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/model/Questions.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/welcomeScreen.dart';
import 'package:quiz_app/widgets/Colors.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../controllers/question_controllerBar.dart';

class ScoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/images/bg.svg",
              width: double.infinity, fit: BoxFit.cover),
          Column(
            children: [
              Spacer(flex: 3,),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headline3!.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_questionController.correctAns * 10}/${Question.sample_question.length * 10}",
                style: Theme.of(context).textTheme.headline4!
                    .copyWith(color: kSecondaryColor),),
              Spacer(),
              InkWell(
                onTap: () => Get.to(WelcomeScreen()),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kDefaultPadding * 0.75),
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Play Again",
                    style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 3,),
            ],
          ),

        ],
      ),
    );
  }
}
