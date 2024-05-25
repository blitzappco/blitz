import 'dart:async';
import 'package:blitz/providers/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'homescreen.dart';
import '../pages/onboarding/onboarding.dart';

import '../providers/account_provider.dart';

import '../utils/vars.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showImage = true;

  Future<void> requestLocationPermissions() async {
    await Permission.location.request();
  }

  @override
  void initState() {
    requestLocationPermissions();

    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _showImage = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final account = Provider.of<AccountProvider>(context, listen: false);
        final tickets = Provider.of<TicketsProvider>(context, listen: false);

        await account.loadAccount();

        if (account.token == '' || account.account.id == '') {
          if (jury) {
            await account.onboarding("+40712345678");
            await account.verifyCode("0000");

            await account.getTrips();
            await account.getPaymentMethods();

            await tickets.getTicketTypes(account.token, "bucuresti");
            await tickets.getLastTicket(account.token, "bucuresti");

            Timer(
                const Duration(milliseconds: 500),
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Homescreen())));
          } else {
            Timer(
                const Duration(milliseconds: 100),
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Onboarding())));
          }
        } else {
          await account.getTrips();
          await account.getPaymentMethods();

          await tickets.getTicketTypes(account.token, "bucuresti");

          await tickets.getLastTicket(account.token, "bucuresti");

          Timer(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homescreen()),
            );
          });
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _showImage
              ? Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                )
              : const CircularProgressIndicator(
                  color: blitzPurple,
                ),
        ),
      ),
    );
  }
}
