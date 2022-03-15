import 'package:bankx/pages/screens.dart';

class BusinessLoan extends StatefulWidget {
  @override
  _BusinessLoanState createState() => _BusinessLoanState();
}

class _BusinessLoanState extends State<BusinessLoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Business Loan',
          style: black18BoldTextStyle,
        ),
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
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              children: [
                businessLoan(),
                height20Space,
                dummyText(),
                heightSpace,
                dummyText(),
                height20Space,
                enquiryDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dummyText() {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet integer nullam sapien est adipiscing massa. Varius pellentesque vestibulum aliquam quam purus nec donec nullam amet. Arcu felis leo risus cras vel tortor. Ut at augue nunc tincidunt non tellus, viverra diam pulvinar.',
      style: black12MediumTextStyle,
    );
  }

  enquiryDetails() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: fixPadding + 10.0,
        horizontal: fixPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: black14BoldTextStyle,
          ),
          heightSpace,
          nameTextField(),
          height20Space,
          Text(
            'Phone number',
            style: black14BoldTextStyle,
          ),
          heightSpace,
          phoneNumberTextField(),
          height20Space,
          Text(
            'Message',
            style: black14BoldTextStyle,
          ),
          heightSpace,
          messageTextField(),
          height20Space,
          sendEnquiryButton(),
        ],
      ),
    );
  }

  sendEnquiryButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'Send enquiry',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  messageTextField() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        maxLines: 5,
        style: grey14RegularTextStyle,
        decoration: InputDecoration(
          hintText: 'Enter your message here',
          hintStyle: grey14RegularTextStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding - 2.5,
          ),
          isDense: true,
        ),
      ),
    );
  }

  phoneNumberTextField() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: grey14RegularTextStyle,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Enter your phone number',
          hintStyle: grey14RegularTextStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding - 2.5,
          ),
          isDense: true,
        ),
      ),
    );
  }

  nameTextField() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fixPadding),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 4.0,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        style: grey14RegularTextStyle,
        decoration: InputDecoration(
          hintText: 'Enter your name',
          hintStyle: grey14RegularTextStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding - 2.5,
          ),
          isDense: true,
        ),
      ),
    );
  }

  businessLoan() {
    return Container(
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
    );
  }
}
