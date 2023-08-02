import 'package:flutter/material.dart';
import 'package:travelplanning/Screens/bookingPage.dart';
import 'package:travelplanning/Screens/payment.dart';
// import 'package:travelplanning/Screens/Payment.dart';

class FinalPayment extends StatelessWidget {
  const FinalPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xffe3e3e3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(17, 35, 15, 21),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const BookingPage()));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          '<--',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            height: 1.38,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    'FINISH YOUR BOOKING',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.fromLTRB(11, 0, 7, 15),
                    padding: const EdgeInsets.fromLTRB(1, 36, 0, 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildRow('Trip Charge', 'Rs 2000'),
                        _buildRow('Hotel Charge', 'Rs 1000'),
                        _buildRow('Rental Car', 'Rs 500'),
                        _buildRow('Flight Charge', '-'),
                        const Divider(
                          color: Color(0x33000000),
                          thickness: 1,
                          height: 51,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40.5, bottom: 51),
                          width: 322.5,
                          height: 68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffffffff),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total     ',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '.................',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Rs 3500',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 148,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const Payment()),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: const Color(0xff72bcd4),
                      ),
                      child: const Text('Make Payment'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(33, 0, 33, 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
