import 'package:flutter/material.dart';
import 'package:bankx/pages/screens.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

class EvaluacionPage extends StatefulWidget {
  static const String routeName = '/evaluacion';

  @override
  _EvaluacionPageState createState() => _EvaluacionPageState();
}

class _EvaluacionPageState extends State<EvaluacionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 1.0,
          centerTitle: true,
          title: Text(
            'Evaluación',
            style: black18BoldTextStyle,
          ),
          toolbarHeight: 50, // default is 56
          toolbarOpacity: 0.5,
          shape: StadiumBorder(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: orangeColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                heightSpace,
                Container(
                  height: 150,
                  child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_kaabpl4e.json'),
                ),
                height20Space,
                Text("Queremos saber tú opinion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
                height20Space,
                RatingBar(
                    itemSize: 40,
                    initialRating: 4.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.orange),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.orange,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.orange,
                        )),
                    onRatingUpdate: (value) {
                      setState(() {
                        var _ratingValue = value;
                      });
                    }),
              ],
            ),
          ],
        ));
  }
}
