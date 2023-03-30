// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:career_counselling/screens/Counselling-tab/search-counsellors.dart';
import 'package:career_counselling/screens/HomeScreen/homeBottomBar.dart';
import 'package:career_counselling/screens/HomeScreen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';

class questionnaire extends StatefulWidget {
  const questionnaire({super.key});

  @override
  State<questionnaire> createState() => _questionnaireState();
}

class _questionnaireState extends State<questionnaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: FutureBuilder<Task>(
            future: getSampleTask(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data!;
                return SurveyKit(
                  onResult: (SurveyResult result) {
                    print(result.finishReason);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeBottomBar()));
                  },
                  task: task,
                  showProgress: true,
                  localizations: {
                    'cancel': 'Cancel',
                    'next': 'Next',
                  },
                  themeData: Theme.of(context).copyWith(
                    primaryColor: Colors.cyan,
                    appBarTheme: const AppBarTheme(
                      color: Color(0xFFD3F36B),
                      iconTheme: IconThemeData(
                        color: Colors.cyan,
                      ),
                      titleTextStyle: TextStyle(
                        color: Color(0xFFD3F36B),
                      ),
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.cyan,
                    ),
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: Colors.cyan,
                      selectionColor: Colors.cyan,
                      selectionHandleColor: Colors.cyan,
                    ),
                    cupertinoOverrideTheme: CupertinoThemeData(
                      primaryColor: Colors.cyan,
                    ),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(150.0, 60.0),
                        ),
                        side: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return BorderSide(
                                color: Colors.grey,
                              );
                            }
                            return BorderSide(
                              color: Colors.cyan,
                            );
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        textStyle: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Colors.grey,
                                  );
                            }
                            return Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Color(0xFFD3F36B),
                                );
                          },
                        ),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Colors.cyan,
                              ),
                        ),
                      ),
                    ),
                    textTheme: TextTheme(
                      displayMedium: TextStyle(
                        fontSize: 28.0,
                        color: Colors.black,
                      ),
                      headlineSmall: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                      bodyMedium: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      titleMedium: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.cyan,
                    )
                        .copyWith(
                          onPrimary: Colors.white,
                        )
                        .copyWith(background: Color(0xFFD3F36B)),
                  ),
                  surveyProgressbarConfiguration: SurveyProgressConfiguration(
                    backgroundColor: Color(0xFFD3F36B),
                  ),
                );
              }
              return CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the\nQuiz',
          text: 'Get ready for a bunch of super random questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Which of the following activities do you enjoy the most?',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Playing sports', value: 'Playing sports'),
              TextChoice(
                  text: 'Drawing or painting', value: 'Drawing or painting'),
              TextChoice(text: 'Reading books', value: 'Reading books'),
              TextChoice(
                  text: 'Playing video or computer games',
                  value: 'Playing video or computer games'),
            ],
          ),
        ),
        QuestionStep(
            title: 'What do you think is the most important thing in life?',
            answerFormat: SingleChoiceAnswerFormat(
              textChoices: [
                TextChoice(
                    text: 'Achieving success', value: 'Achieving success'),
                TextChoice(text: 'Being healthy', value: 'Being healthy'),
                TextChoice(text: 'Having fun', value: 'Having fun'),
                TextChoice(
                    text: 'Doing the right thing',
                    value: 'Doing the right thing'),
              ],
            )),
        QuestionStep(
            title: 'What do you think is the best way to learn something new?',
            answerFormat: SingleChoiceAnswerFormat(
              textChoices: [
                TextChoice(
                    text: 'Watching educational videos',
                    value: 'Achieving success'),
                TextChoice(text: 'Reading books', value: 'Being healthy'),
                TextChoice(
                    text: 'Talking to experienced people', value: 'Having fun'),
                TextChoice(
                    text: 'Trying it out yourself',
                    value: 'Trying it out yourself'),
              ],
            )),
        QuestionStep(
          title:
              'When you want to find out about something new, where do you look first?',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'The Internet', value: 'The Internet'),
              TextChoice(
                  text: 'Your family and friends',
                  value: 'Your family and friends'),
              TextChoice(
                  text: 'Books and magazines', value: 'Books and magazines'),
              TextChoice(text: 'Television', value: 'Television'),
            ],
          ),
        ),
        QuestionStep(
          title:
              'What do you think is the most important part of a successful career?',
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Hard Work', value: 'Hard Work'),
              TextChoice(text: 'Luck', value: 'Luck'),
              TextChoice(text: 'Education', value: 'Education'),
              TextChoice(text: 'Networking', value: 'Networking'),
            ],
            // defaultSelection: TextChoice(text: 'No', value: 'No'),
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thanks for taking the quiz!',
          title: 'Done!',
          buttonText: 'Submit quiz',
        ),
      ],
    );

    return Future.value(task);
  }
}
