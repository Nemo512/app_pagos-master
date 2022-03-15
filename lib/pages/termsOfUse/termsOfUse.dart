import 'package:bankx/pages/screens.dart';

class TermOfUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Terms of use',
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
          termsOfUseInfo(),
        ],
      ),
    );
  }

  termsOfUseInfo() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        children: [
          dummyText(),
          height20Space,
          dummyText(),
          height20Space,
          dummyText(),
        ],
      ),
    );
  }

  dummyText() {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque, venenatis leo ante morbi magnis porttitor. Massa ut mauris id aliquam at dapibus dignissim aliquam. In porta arcu, purus amet ipsum, aliquet tortor. Amet, bibendum erat iaculis in ipsum integer.',
      style: black14MediumTextStyle,
      textAlign: TextAlign.justify,
    );
  }
}
