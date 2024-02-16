import 'package:firstapi/api/makeup_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MobileProduct extends StatelessWidget {
  final MakeupApi controllerApi;

  const MobileProduct({Key? key, required this.controllerApi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controllerApi.belajarApi.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 45, bottom: 110),
              itemCount: controllerApi.belajarApi.length,
              itemBuilder: (context, index) {
                final data = controllerApi.belajarApi[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFd5d5d5).withOpacity(1),
                        offset: const Offset(8, 8),
                        blurRadius: 50,
                        spreadRadius: -10,
                      ),
                    ],
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.network(
                          data.imageLink,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: const Icon(
                                      Icons.favorite_outline_rounded,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
