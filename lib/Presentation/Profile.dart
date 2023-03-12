import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery101/extra/drawer.dart';
import 'package:grocery101/extra/appbar.dart';
import 'package:mobile_number/mobile_number.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    if (!mounted) return;

    setState(() {});
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: appBar(),
      ),
      drawer: drawer(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.753), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: AssetImage("assets/jj.jpg"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10, left: 15),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Samuel Abera",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "@sam609",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "+$_mobileNumber",
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
