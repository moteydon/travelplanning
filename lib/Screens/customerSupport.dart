import 'package:flutter/material.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(23.5, 16, 39, 16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(9.5, 0, 0, 2),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    height: 1.38,
                    color: Color(0xff000000),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/contactus.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15.5, 0, 0, 0),
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                        'We\'re here to assist you! If you have any questions, concerns, or need assistance with our travel app, our dedicated customer support team is just a call away. We strive to provide prompt and helpful responses to all inquiries. Additionally, we welcome your feedback and suggestions to continually improve our app and enhance your travel planning experience. We value your input, so please don\'t hesitate to share your thoughts with us. Thank you for choosing our travel app, and we look forward to assisting you!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.38,
                          color: Color(0xff000000),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Call us',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.38,
                          color: Color(0xff000000),
                          decoration: TextDecoration.none,
                        ),
                        children: [
                          TextSpan(
                            text: '\n9876543210',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.38,
                              color: Color(0xff000000),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
