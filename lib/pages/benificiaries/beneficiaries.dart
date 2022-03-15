import 'package:bankx/pages/screens.dart';

class Beneficiaries extends StatefulWidget {
  @override
  _BeneficiariesState createState() => _BeneficiariesState();
}

class _BeneficiariesState extends State<Beneficiaries> {
  final beneficiariesList = [
    {
      'name': 'John',
      'image': 'assets/user/user_1.jpg',
    },
    {
      'name': 'Amara',
      'image': 'assets/user/user_4.jpg',
    },
    {
      'name': 'Steve',
      'image': 'assets/user/user_8.jpg',
    },
    {
      'name': 'Mike',
      'image': 'assets/user/user_2.jpg',
    },
    {
      'name': 'Linnea',
      'image': 'assets/user/user_3.jpg',
    },
    {
      'name': 'Beatriz',
      'image': 'assets/user/user_11.jpg',
    },
  ];
  final historyBeneficiariesList = [
    {
      'name': 'Beatriz',
      'image': 'assets/user/user_11.jpg',
    },
    {
      'name': 'Shira',
      'image': 'assets/user/user_12.jpg',
    },
    {
      'name': 'Steve',
      'image': 'assets/user/user_8.jpg',
    },
    {
      'name': 'Mike',
      'image': 'assets/user/user_2.jpg',
    },
    {
      'name': 'Linnea',
      'image': 'assets/user/user_3.jpg',
    },
    {
      'name': 'John',
      'image': 'assets/user/user_1.jpg',
    },
  ];
  double height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Beneficiaries',
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          addNewBeneficiaryButton(),
          benificiariesText(),
          userBeneficiaries(),
          historyText(),
          historyBeneficiaries(),
        ],
      ),
    );
  }

  historyBeneficiaries() {
    return Container(
      // height: height / 3.7,
      margin: EdgeInsets.only(
        top: fixPadding + 5.0,
        bottom: fixPadding + 5.0,
      ),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        shrinkWrap: true,
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        children: historyBeneficiariesList.map(
          (item) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: BeneficiaryMoneyTransfer(
                        userPhoto: item['image'],
                        name: item['name'],
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item['name'],
                        style: black14MediumTextStyle,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  historyText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
      ),
      child: Row(
        children: [
          Icon(
            Icons.history,
            size: 20.0,
            color: blackColor,
          ),
          widthSpace,
          Text(
            'History',
            style: black16BoldTextStyle,
          ),
        ],
      ),
    );
  }

  addNewBeneficiaryButton() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: AddNewBeneficiary(),
        ),
      ),
      child: Container(
        child: Container(
          margin: EdgeInsets.all(fixPadding * 2.0),
          padding: EdgeInsets.symmetric(vertical: fixPadding),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            'Add new beneficiary',
            style: white16BoldTextStyle,
          ),
        ),
      ),
    );
  }

  benificiariesText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
      ),
      child: Text(
        'Your beneficiaries',
        style: black16BoldTextStyle,
      ),
    );
  }

  userBeneficiaries() {
    return Container(
      margin: EdgeInsets.only(
        top: fixPadding + 5.0,
        bottom: fixPadding + 5.0,
      ),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        shrinkWrap: true,
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        children: beneficiariesList.map(
          (item) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: BeneficiaryMoneyTransfer(
                        userPhoto: item['image'],
                        name: item['name'],
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item['name'],
                        style: black14MediumTextStyle,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
