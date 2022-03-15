import 'package:bankx/pages/screens.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final notificationList = [
    {
      'title': 'Deposited successfully..!',
      'notification':
          'Congratulation... Your money successfully deposited to your bank account.',
    },
    {
      'title': 'Use your card & get upto 20% cashback',
      'notification':
          'Use your BankX card to any store and get upto 20% cashback.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Notifications',
          style: black18BoldTextStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1.0,
      ),
      body:
          (notificationList.length == 0) ? noNotifications() : notifications(),
    );
  }

  notifications() {
    return ListView.builder(
      itemCount: notificationList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final notification = notificationList[index];
        return Dismissible(
          key: Key('$notification'),
          onDismissed: (direction) {
            setState(() {
              notificationList.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${notification['title']} dismissed"),
              ),
            );
          },
          background: Container(
            margin: EdgeInsets.only(
              top: fixPadding * 2.0,
            ),
            color: redColor,
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
              top: fixPadding * 2.0,
            ),
            padding: EdgeInsets.all(fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1.0,
                  blurRadius: 4.0,
                  color: greyColor.withOpacity(0.5),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications,
                    size: 24.0,
                    color: whiteColor,
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification['title'],
                        style: black14BoldTextStyle,
                      ),
                      heightSpace,
                      Text(
                        notification['notification'],
                        style: black14MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  noNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.notifications_off,
            color: greyColor,
            size: 46.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'No new notifications',
            style: grey16BoldTextStyle,
          )
        ],
      ),
    );
  }
}
