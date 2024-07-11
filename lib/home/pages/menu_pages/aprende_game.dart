import 'dart:async';

import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/menu_pages/aprende_components/aprende_pages.dart';
import 'package:funciona_peru/home/pages/menu_pages/comienza_components/comienza_components.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AprendeGame extends StatelessWidget {
  const AprendeGame({super.key, required this.category, required this.imagenes, required this.descripcion});
  final String category;
  final List<String> imagenes;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    final PageController controllerPageView = PageController(
      viewportFraction: 0.85,
      initialPage: 0,
    );
    final Size size = MediaQuery.of(context).size;
    
    pasarDePagina() {
      if (context.mounted) {
        if (controllerPageView.positions.isNotEmpty) {
          controllerPageView.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          if (controllerPageView.page! + 1 == imagenes.length) {
            controllerPageView.animateToPage(0,
                duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          }
        }
      }
    }

    Timer.periodic(const Duration(seconds: 4), (timer) {
      //Este codigo se ejecuta cada 20 segundos
      pasarDePagina();
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: greyColor,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Explora, Aprende, Crece',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //PAGE VIEW de Licencias
              SizedBox(
                height: size.height * 0.5,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: imagenes.length,
                  controller: controllerPageView,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imagenes[index])),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black12,
                              Colors.black12,
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: controllerPageView,
                count: imagenes.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: color400,
                  dotColor: color100,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Descripción:',
                      style: Theme.of(context).textTheme.titleSmall),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      descripcion,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(25),
                child: ContinuarButton(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AprendePages(category: category,),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
