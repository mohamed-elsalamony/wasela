import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/style/colors.dart';


class AnswerQuestionPage extends StatelessWidget {
  final String? question;

  AnswerQuestionPage({
    super.key,
    required this.question,
  });

  // TODO: firebase
  // this answer will be stored in firestore with its question

  String answer =
      "Small-ring cage hydrocarbons are popular bioisosteres (molecular replacements) for commonly-found para-substituted benzene rings in drug design1. The utility of these cage structures derives from their superior pharmacokinetic properties compared to the parent aromatics, including improved solubility and reduced susceptibility to metabolism2,3. A prime example is the bicyclo[1.1.1]pentane motif, which is mainly synthesised by ring-opening of the inter-bridgehead bond of the strained hydrocarbon [1.1.1]propellane with radicals or anions4. In contrast, scaffolds mimicking meta-substituted arenes are lacking due to the challenge of synthesising saturated isosteres that accurately reproduce substituent vectors5. Here we show that bicyclo[3.1.1]heptanes (BCHeps), hydrocarbons whose bridgehead substituents map precisely onto the geometry of meta-substituted benzenes, can be conveniently accessed from [3.1.1]propellane. We found that [3.1.1]propellane can be synthesized on multigram scale, and readily undergoes a range of radical-based transformations to generate medicinally-relevant carbon- and heteroatom-substituted BCHeps, including pharmaceutical analogues. Comparison of ADME properties of these analogues revealed enhanced metabolic stability relative to their parent arene-containing drugs, validating the potential of this meta-arene analogue as an sp3-rich motif in drug design. Collectively, our results show that BCHeps can be prepared on useful scales using a variety of methods, offering a novel surrogate for meta-substituted benzene rings for";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: answerQuestionPageAppBar(context),
      body: SafeArea(
        child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question ?? "no question",
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(),
              Container(
                width: 90.w,
                height: 70.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(
                  //   color,
                  // ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(
                    "      $answer",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          letterSpacing: 2,
                          wordSpacing: 2,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  AppBar answerQuestionPageAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kWhite,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: kBlue,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
