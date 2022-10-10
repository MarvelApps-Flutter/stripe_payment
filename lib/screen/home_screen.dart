import 'package:flutter/material.dart';
import '../constant/string_constant.dart';
import '../dummy_data/dummy_data.dart';
import '../services/payment_services.dart';
import 'confirmation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [_footerButton(context)],
      body: _body(),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            CircleAvatar(
              backgroundColor: Colors.blue.shade700,
              child: const Text(
                StringConstant.g,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: kToolbarHeight,
            ),
            const Text(
              StringConstant.companyName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              StringConstant.subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            _featureBoxAndAmount(),
            ..._assuranceCardList(),
          ],
        ),
      ),
    );
  }

  List<Widget> _assuranceCardList() {
    return List<Widget>.generate(
      DummyData.assuranceCardDetailList.length,
      (index) {
        return Container(
          decoration: BoxDecoration(
            color: index % 2 == 0
                ? Colors.blue.shade100.withOpacity(0.4)
                : Colors.green.shade100.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Image.asset(
                DummyData.assuranceCardDetailList[index].imgPath,
                height: 35,
                width: 35,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DummyData.assuranceCardDetailList[index].title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    DummyData.assuranceCardDetailList[index].subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Container _featureBoxAndAmount() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstant.dollarSign,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                StringConstant.amount,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(right: 35),
            width: double.infinity,
            child: Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children: List<Widget>.generate(
                DummyData.featureList.length,
                (index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade400,
                        size: 22,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        DummyData.featureList[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      index == 3
                          ? const SizedBox(
                              width: 12,
                            )
                          : const SizedBox(),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            StringConstant.knowMore,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade800,
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }

  Padding _footerButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: InkWell(
        onTap: () async {
          await PaymentService().makePayment(
              context: context,
              amount: 499,
              asyncGapCheck: (String? transactionId) {
                if (!mounted) return;
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ConfirmationScreen(
                            transactionID: transactionId ?? ""))));
              });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                StringConstant.processToPayment,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_right_alt_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
