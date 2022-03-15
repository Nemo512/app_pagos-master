import 'package:bankx/pages/screens.dart';

class AddNewBeneficiary extends StatefulWidget {
  @override
  _AddNewBeneficiaryState createState() => _AddNewBeneficiaryState();
}

class _AddNewBeneficiaryState extends State<AddNewBeneficiary> {
  List<String> _bankList = [
    'Select bank',
    'AXIS BANK',
    'CITI BANK',
    'FEDERAL BANK LTD.',
    'HDFC BANK LTD',
    'KOTAK MAHINDRA BANK',
    'OTHER BANKS',
  ];
  List<String> _accountTypeList = [
    'Select account type',
    'Savings',
    'Current',
    'Overdraft',
    'Cash Credit',
    'Loan',
    'NRE',
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
          'Add new beneficiary',
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
          selectPhotoCircle(),
          bankDetails(),
          accountDetails(),
          addBeneficiaryButton(),
        ],
      ),
    );
  }

  selectPhotoCircle() {
    return InkWell(
      onTap: () => bottomSheet(),
      child: Container(
        width: 80.0,
        height: 80.0,
        margin: EdgeInsets.only(top: fixPadding * 2.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1.0,
              blurRadius: 4.0,
              color: greyColor.withOpacity(0.5),
            ),
          ],
        ),
        child: Icon(
          Icons.add_a_photo,
          size: 24.0,
          color: blackColor,
        ),
      ),
    );
  }

  bankDetails() {
    return Container(
      margin: EdgeInsets.only(
        left: fixPadding * 2.0,
        right: fixPadding * 2.0,
        top: fixPadding * 2.0,
      ),
      padding: EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
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
            'Bank Details',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          selectBankDropDown(),
          heightSpace,
          height5Space,
          ifscCodeTextField(),
          heightSpace,
        ],
      ),
    );
  }

  ifscCodeTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Enter IFSC',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  selectBankDropDown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        hintText: 'Select bank',
        hintStyle: black14MediumTextStyle,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: blackColor,
        size: 20.0,
      ),
      items: _bankList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: black14MediumTextStyle,
          ),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  accountDetails() {
    return Container(
      margin: EdgeInsets.only(
        left: fixPadding * 2.0,
        right: fixPadding * 2.0,
        top: fixPadding * 2.0,
      ),
      padding: EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(fixPadding),
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
            'Account Details',
            style: black16BoldTextStyle,
          ),
          heightSpace,
          accountNumberTextField(),
          heightSpace,
          height5Space,
          confirmAccountNumberTextField(),
          heightSpace,
          height5Space,
          selectAccountTypeDropDown(),
          heightSpace,
          height5Space,
          beneficiaryNameTextField(),
          heightSpace,
        ],
      ),
    );
  }

  beneficiaryNameTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 3.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: greyColor,
          ),
        ),
        isDense: true,
        hintText: 'Enter beneficiary name',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  selectAccountTypeDropDown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        hintText: 'Select account type',
        hintStyle: black14MediumTextStyle,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: blackColor,
        size: 20.0,
      ),
      items: _accountTypeList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: black14MediumTextStyle,
          ),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  confirmAccountNumberTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Confirm account number',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  accountNumberTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: grey14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
        isDense: true,
        hintText: 'Enter account number',
        hintStyle: grey14MediumTextStyle,
      ),
    );
  }

  addBeneficiaryButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
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
            'Add beneficiary',
            style: white16BoldTextStyle,
          ),
        ),
      ),
    );
  }

  bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: fixPadding,
            horizontal: fixPadding + 5.0,
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'Choose Option',
                      style: black16BoldTextStyle,
                    ),
                  ),
                  heightSpace,
                  Container(
                    height: 1.0,
                    color: greyColor,
                  ),
                  heightSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: chooseFromCameraOrGallery(
                      icon: Icons.camera_alt,
                      optionText: 'Camera',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: fixPadding),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: chooseFromCameraOrGallery(
                        icon: Icons.photo_album,
                        optionText: 'Upload from gallery',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  chooseFromCameraOrGallery({icon, optionText}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: blackColor,
        ),
        width5Space,
        Text(
          optionText,
          style: black14MediumTextStyle,
        ),
      ],
    );
  }
}
