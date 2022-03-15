import 'package:bankx/pages/screens.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final transactionsList = [
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'City people\'s hospital',
      'amount': '558.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Apple Electronics co.LTD',
      'amount': '669.00',
    },
    {
      'iscredit': false,
      'type': 'Consumer return',
      'owner': 'Western Motor co. LTD',
      'amount': '228.00',
    },
    {
      'iscredit': true,
      'type': 'Salary credited',
      'owner': 'Google LLC',
      'amount': '8953.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'KFC Catering co. LTD',
      'amount': '113.00',
    },
    {
      'iscredit': false,
      'type': 'Consumer return',
      'owner': 'Southern Airline co. LTD',
      'amount': '889.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'City people’s hospital',
      'amount': '558.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'Apple Electronics co. LTD',
      'amount': '669.00',
    },
    {
      'iscredit': false,
      'type': 'Consumer return',
      'owner': 'Western Motor co. LTD',
      'amount': '228.00',
    },
    {
      'iscredit': true,
      'type': 'Salary credited',
      'owner': 'Google LLC',
      'amount': '8953.00',
    },
    {
      'iscredit': false,
      'type': 'Card consuption',
      'owner': 'KFC Catering co. LTD',
      'amount': '113.00',
    },
    {
      'iscredit': false,
      'type': 'Consumer return',
      'owner': 'Southern Airline co. LTD',
      'amount': '889.00',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Transactions',
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: transactions(),
    );
  }

  transactions() {
    return ListView.builder(
      itemCount: transactionsList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final transaction = transactionsList[index];
        return Padding(
          padding: EdgeInsets.only(
            top: fixPadding * 2.0,
            left: fixPadding * 2.0,
            right: fixPadding * 2.0,
            bottom:
                (index == transactionsList.length - 1) ? fixPadding * 2.0 : 0.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.20),
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor),
                    ),
                    child: Icon(
                      (transaction['iscredit'])
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: primaryColor,
                    ),
                  ),
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction['type'],
                        style: black16MediumTextStyle,
                      ),
                      height5Space,
                      Text(
                        transaction['owner'],
                        style: grey14MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'USD',
                    style: black14MediumTextStyle,
                  ),
                  height5Space,
                  Text(
                    (transaction['iscredit'])
                        ? '+${transaction['amount']}'
                        : '-${transaction['amount']}',
                    style: black16BoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
