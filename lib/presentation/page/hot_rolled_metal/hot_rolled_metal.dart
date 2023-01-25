import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/style/app_dimens.dart';
import 'package:stan_handel_web/presentation/style/app_typography.dart';
import 'package:stan_handel_web/presentation/style/images.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';
import 'package:stan_handel_web/presentation/widget/scafold/page_base/page_base.dart';
import 'package:stan_handel_web/presentation/widget/text/seo_text.dart';


//ToDo Localizations, small screen size layout
class HotRolledMetal extends HookWidget {
  const HotRolledMetal({super.key});

  static const route = "/hot-rolled-metal-sheets";

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();

    final dottedExamplesString = useMemoized(_createDottedListExamples);

    return PageBase(
      content: Column(
        children: [
          Container(
            color: AppColors.primaryLight,
            height: context.contentHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
                  child: SizedBox(
                    width: context.contentWidth,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SeoText(
                                "Blacha ocynkowana Katowice i Śląsk",
                                style: context.h1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: AppDimens.s),
                              SeoText(
                                "W naszej ofercie znajdziecie Państwo najlepszej jakości materiały hutnicze, w tym blachy ocynkowane. Zajmujemy się ich sprzedażą m.in. na Śląsku (siedzibą firmy są Katowice), a także w województwach ościennych. Jesteśmy otwarci na negocjacje i chętnie podejmiemy współpracę z Klientami z innych regionów. Zapraszamy do zakupów na naszym portalu oraz skorzystania z profesjonalnych usług cięcia materiałów na wymiar.",
                                style: AppTypography.body1,
                                textAlign: TextAlign.left,
                                maxLines: null,
                              ),
                            ],
                          ),
                        ),
                        if (!context.isScreenSmall) Expanded(
                          child: Image(
                            height: context.bigIconHeight,
                            fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                            image: const AssetImage(Images.localization),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: context.contentHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
                  child: SizedBox(
                    width: context.contentWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!context.isScreenSmall) Expanded(
                          child: Image(
                            height: context.bigIconHeight,
                            fit: context.isScreenSmall ? BoxFit.fitHeight : BoxFit.fitHeight,
                            image: const AssetImage(Images.quality),
                          ),
                        ),                        Expanded(
                          child: Column(
                            children: [
                              SeoText(
                                "Najwyższa jakość i doświadczenie",
                                style: context.h1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: AppDimens.s),
                              SeoText(
                                "Niezależenie od potrzeb i zamawianej ilości warto zaufać profesjonalistom w branży. U nas dostępna jest blacha gorącowalcowana na wymiar. Dopasowujemy się do nawet specyficznych wymogów oraz podchodzimy indywidualnie do poszczególnych zleceń, aby zadowolić każdego Klienta. Współpracujemy z dużymi i małymi firmami, więc pozostajemy elastyczni i umożliwiamy negocjację cen. Oferujemy szeroki wybór asortymentu w I gatunku z atestem i w II gatunku bez niego. Zapraszamy do skorzystania z naszych usług!",
                                style: AppTypography.body1,
                                textAlign: TextAlign.left,
                                maxLines: null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: AppColors.gray7,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimens.c),
                  child: SizedBox(
                    width: context.contentWidth,
                    child: Row(
                      children: [
                        Expanded(
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SeoText(
                                "Zastosowanie blachy gorącowalcowanej",
                                style: context.h1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: AppDimens.s),
                              SeoText(
                                "Zależnie od potrzeb, należy wybrać odpowiedni typ produktu. Warto wiedzieć, że blachy gorącowalcowane są przede wszystkim używane do takich projektów, w których nie wymaga się estetycznej, jakościowej powierzchni oraz dodatkowych wzmocnień. Wyroby tego typu nie posiadają gładkiego pokrycia, ponieważ kluczowe są inne cechy takie jak łatwość dalszego formowania oraz grubość. Sprawdzą się wszędzie tam, gdzie planowane jest np. spawanie. Stanowią element konstrukcji takich jak:",
                                style: AppTypography.body1.copyWith(),
                                textAlign: TextAlign.left,
                                maxLines: null,

                              ),
                              const SizedBox(height: AppDimens.s),
                              SeoText(
                                dottedExamplesString,
                                style: AppTypography.body1,
                                textAlign: TextAlign.left,
                                maxLines: null,
                              ),
                            ],
                          ),
                        ),
                        if (!context.isScreenSmall) const Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: context.contentHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimens.xl),
                  child: SizedBox(
                    width: context.contentWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!context.isScreenSmall) const Spacer(),
                        Expanded(
                          child:
                          Column(
                            children: [
                              SeoText(
                                "Tworzenie blachy gorącowalcowanej",
                                style: context.h1,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: AppDimens.s),
                              SeoText(
                                "Proces walcowania na gorąco odbywa się powyżej temperatury rekrystalizacji stali. Końcowy produkt powstaje w krótszym czasie niż blachy zimnowalcowane, dzięki czemu jest znacznie tańszy. Wadą tego typu obróbki może być powstanie zgorzeliny w wyniku utleniania stopu metali. Należy ją potem usunąć np. przez wytrawienie lub inną metodę. Oferujemy Państwu doskonałe towary na wymiar. Jeszcze niedawno blachy gorącowalcowane mogły mieć nie mniej niż 3 mm, jednak dzięki rozwojowi technologicznemu dostępne są też takie o grubości nawet poniżej 1,2 mm.",
                                style: AppTypography.body1,
                                textAlign: TextAlign.left,
                                maxLines: null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      scrollController: controller,
    );
  }
}

String _createDottedListExamples() {
  final examplesList = [
    'mosty',
    'kładki',
    'schody',
    'kontenery',
    'statki i okręty',
    'maszyny różnego typu',
  ];

  var combinedString = '\u2022 ${examplesList.first},';

  var index = 1;

  while (index < examplesList.length) {
    final currentText = examplesList[index];
    combinedString += '\n\u2022 $currentText,';
    index++;
  }
  combinedString += '\n\u2022 ${examplesList.last}.';
  return combinedString;
}

