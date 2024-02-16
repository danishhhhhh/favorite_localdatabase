
import 'package:firstapi/api/makeup_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletProduct extends StatelessWidget {
  final MakeupApi controllerApi;
  const TabletProduct({Key? key, required this.controllerApi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controllerApi.belajarApi.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: calculateCrossAxisCount(context),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.6,
              ),
              itemCount: controllerApi.belajarApi.length,
              itemBuilder: (context, index) {
                final data = controllerApi.belajarApi[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        data.imageLink,
                        width: 150,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Icon(
                                  Icons.favorite_outline_rounded,
                                  size: 35,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
    });
  }

  int calculateCrossAxisCount(BuildContext context) {
    double itemWidth = 250.0;

    int crossAxisCount =
        (MediaQuery.of(context).size.width / itemWidth).floor();

    return crossAxisCount > 0 ? crossAxisCount : 1;
  }
}
