import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final bool isBackButtonVisible;
  const LandingPage(
      {super.key,
      required this.child,
      this.maxWidth = 600,
      this.isBackButtonVisible = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffc04848), Color(0xff232F49)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                surfaceTintColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 20,
                color: Colors.white,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Image.network(
                            'https://intelicity-assets.s3.sa-east-1.amazonaws.com/gates_logo.png',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: child,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    isBackButtonVisible
                        ? IconButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.primaryBlue,
                              size: 32,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
