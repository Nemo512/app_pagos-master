import 'package:bankx/pages/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Perfil',
          style: black18BoldTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWithImageEdit(),
                height20Space,
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'Cambiar contraseña o Huella Digital',
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: NearByBanks(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Bancos Cercanos',
                  ),
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: NearByATMs(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Cajeros Cercanos',
                  ),
                ),
                heightSpace,
                height5Space,
                Text(
                  'Nosotros',
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                height5Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: Privacypolicy(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Política de Privacidad',
                  ),
                ),
                heightSpace,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: TermOfUse(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Terminos y Condiciones',
                  ),
                ),
                heightSpace,
                height5Space,
                Text(
                  'APPAGOS',
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                height5Space,
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.rightToLeft,
                      child: Support(),
                    ),
                  ),
                  child: accountFunctionalities(
                    settingTitle: 'Soporte',
                  ),
                ),
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'Reportar fallos',
                ),
                heightSpace,
                accountFunctionalities(
                  settingTitle: 'App Version 0.1',
                ),
                height20Space,
                logoutLink(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  nameWithImageEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/user/user_9.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            Text(
              'Fulana de Tal',
              style: black16BoldTextStyle,
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            result = await Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: EditProfile(),
              ),
            );
          },
          child: Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              Icons.edit,
              size: 24.0,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  logoutLink() {
    return InkWell(
      onTap: () => sureToLogoutDialog(),
      child: Row(
        children: [
          Icon(
            Icons.exit_to_app,
            color: redColor,
            size: 22.0,
          ),
          widthSpace,
          Text(
            'Cerrar Sesión',
            style: red14MediumTextStyle,
          ),
        ],
      ),
    );
  }

  sureToLogoutDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(fixPadding),
                ),
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '¿Seguro que deseas Salir?',
                          style: black16BoldTextStyle,
                        ),
                        height20Space,
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: cancelOrLogout(
                                    selectionText: 'Cancelar', isCancel: true),
                              ),
                            ),
                            width20Space,
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  deletePreferences();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                },
                                child: cancelOrLogout(
                                    selectionText: 'Cerrar Sesión',
                                    isCancel: false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  deletePreferences() async {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.clear();
  }

  cancelOrLogout({selectionText, isCancel}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: fixPadding - 5.0),
      decoration: BoxDecoration(
        color: (isCancel) ? whiteColor : primaryColor,
        border: (isCancel) ? Border.all(color: primaryColor) : Border(),
        borderRadius: BorderRadius.circular(fixPadding),
      ),
      child: Text(
        selectionText,
        style: (isCancel) ? black14MediumTextStyle : white14MediumTextStyle,
      ),
    );
  }

  accountFunctionalities({settingTitle}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingTitle,
              style: black14MediumTextStyle,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: blackColor,
              size: 16.0,
            ),
          ],
        ),
        heightSpace,
        Container(
          height: 1.0,
          color: greyColor,
        ),
      ],
    );
  }
}
