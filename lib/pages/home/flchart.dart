import 'package:bankx/pages/screens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';

class FlChart extends StatefulWidget {
  @override
  _FlChartState createState() => _FlChartState();
}

class _FlChartState extends State<FlChart> {
  final Color leftBarColor = Colors.blue;
  final Color rightBarColor = redColor;
  final double width = 6;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 6, 1.5);
    final barGroup2 = makeGroupData(1, 10, 4);
    final barGroup3 = makeGroupData(2, 10, 5);
    final barGroup4 = makeGroupData(3, 7, 2);
    final barGroup5 = makeGroupData(4, 10, 6);
    final barGroup6 = makeGroupData(5, 5, 10);
    final barGroup7 = makeGroupData(6, 6, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(fixPadding * 2.0),
      padding: EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 2.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Income',
                    style: grey14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    '\$3,000.00',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
              width20Space,
              width20Space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Spend',
                    style: grey14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    '\$1,424.67',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          height20Space,
          BarChart(
            BarChartData(
              maxY: 12.0,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (_a, _b, _c, _d) => null,
                ),
                touchCallback: (response) {
                  if (response.spot == null) {
                    setState(() {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    });
                    return;
                  }
                  touchedGroupIndex = response.spot.touchedBarGroupIndex;
                  setState(() {
                    if (response.touchInput is PointerExitEvent ||
                        response.touchInput is PointerUpEvent) {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    } else {
                      showingBarGroups = List.of(rawBarGroups);
                      if (touchedGroupIndex != -1) {
                        double sum = 0;
                        for (BarChartRodData rod
                            in showingBarGroups[touchedGroupIndex].barRods) {
                          sum += rod.y;
                        }
                        final avg = sum /
                            showingBarGroups[touchedGroupIndex].barRods.length;

                        showingBarGroups[touchedGroupIndex] =
                            showingBarGroups[touchedGroupIndex].copyWith(
                          barRods: showingBarGroups[touchedGroupIndex]
                              .barRods
                              .map((rod) {
                            return rod.copyWith(y: avg);
                          }).toList(),
                        );
                      }
                    }
                  });
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => grey14MediumTextStyle,
                  margin: 15,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Mn';
                      case 1:
                        return 'Te';
                      case 2:
                        return 'Wd';
                      case 3:
                        return 'Tu';
                      case 4:
                        return 'Fr';
                      case 5:
                        return 'St';
                      case 6:
                        return 'Sn';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => grey14MediumTextStyle,
                  margin: 25,
                  reservedSize: 20,
                  getTitles: (value) {
                    if (value == 0) {
                      return '50';
                    } else if (value == 5) {
                      return '100';
                    } else if (value == 10) {
                      return '150';
                    } else {
                      return '';
                    }
                  },
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: showingBarGroups,
            ),
          ),
          height20Space,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 15.0,
                width: 15.0,
                color: Colors.blue,
              ),
              widthSpace,
              Text(
                'Income',
                style: black16MediumTextStyle,
              ),
              widthSpace,
              Container(
                height: 15.0,
                width: 15.0,
                color: redColor,
              ),
              widthSpace,
              Text(
                'Spend',
                style: black16MediumTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [leftBarColor],
          width: width,
        ),
        BarChartRodData(
          y: y2,
          colors: [rightBarColor],
          width: width,
        ),
      ],
    );
  }
}
