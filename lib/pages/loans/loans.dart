import 'dart:async';

import 'package:animated/animated.dart';
import 'package:bankx/pages/screens.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'FormPartOne.dart';

class Loans extends StatefulWidget {
  @override
  _LoansState createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  bool scaled = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 80),
      () => setState(() {
        scaled = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          'Préstamos Disponibles',
          style: appBarWhiteTextStyle,
        ),
        toolbarHeight: 52, // default is 56
        toolbarOpacity: 0.5,
        shape: StadiumBorder(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: fixPadding * 2.0,
              horizontal: fixPadding * 2.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loanTypesCards(
                  loanType: 'Empresa 1',
                  number: '1356 8795 7857 9856',
                  dueAmount: '690,000.00',
                  emiAmount: '110%',
                ),
                height20Space,
                loanTypesCards(
                  loanType: 'Empresa 2',
                  number: '1658 9875 1245 9534',
                  dueAmount: '25000.00',
                  emiAmount: '120%',
                ),
                height20Space,
                loanTypesCards(
                  loanType: 'Empresa 3',
                  number: '1356 8795 7857 9856',
                  dueAmount: '800,000.00',
                  emiAmount: '150%',
                ),
                height20Space,
                loanTypesCards(
                  loanType: 'Empresa 4',
                  number: '1356 8795 7857 9856',
                  dueAmount: '690,000.00',
                  emiAmount: '110%',
                ),
                height20Space,
                Text(
                  'Empresas Destacadas',
                  style: black16BoldTextStyle,
                ),
                heightSpace,
                businessLoan(),
                height20Space,
                educationLoan(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  educationLoan() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: BusinessLoan(),
        ),
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/education-loan.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  businessLoan() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: BusinessLoan(),
        ),
      ),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/business-loan.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  loanTypesCards({loanType, number, dueAmount, emiAmount}) {
    return Animated(
      value: scaled ? 1 : 0.5,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      builder: (context, child, animation) => Transform.scale(
        scale: animation.value,
        child: child,
      ),
      child: Container(
        height: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fixPadding),
        ),
        child: Container(
          padding: EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20.0,
              ),
            ],
            borderRadius: BorderRadius.circular(fixPadding),
            image: DecorationImage(
              image: AssetImage('assets/bg_ion.png'),
              fit: BoxFit.cover,
            ),
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loanType,
                        style: white18BoldTextStyle,
                      ),
                      height5Space,
                      RatingBar(
                          itemSize: 25,
                          initialRating: 4.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full:
                              const Icon(Icons.star, color: Colors.orange),
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
                      height20Space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cantidad a prestar. ',
                                style: black16BoldTextStyle,
                              ),
                              height5Space,
                              Text(
                                '\$$dueAmount',
                                style: grey16MediumTextStyle,
                              ),
                              Text(
                                'CAT: \$$emiAmount',
                                style: grey16MediumTextStyle,
                              ),
                              const SizedBox(height: 2)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              height5Space,
                              height5Space,
                              height5Space,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            PageTransition(
                              duration: Duration(milliseconds: 500),
                              type: PageTransitionType.rightToLeft,
                              child: FormPartOne(
                                loanType: loanType,
                                number: number,
                                dueAmount: dueAmount,
                                emiAmount: emiAmount,
                              ),
                            ),
                          ),
                          child: Image.asset(
                            'assets/emsol.png',
                            height: 120.0,
                            width: 120.0,
                          ),

                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
