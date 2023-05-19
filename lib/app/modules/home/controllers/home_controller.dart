import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/employee_model.dart';

class HomeController extends GetxController {

  RxList employeeList = <Employee>[].obs;

  var nameC = TextEditingController();
  var roleC = TextEditingController();
  var imageUrlC = TextEditingController();

  editEmployee(int id) {
    employeeList.removeAt(id);
    employeeList.insert(id,
        Employee(
            id: id,
            name: nameC.text,
            role: roleC.text,
            imageUrl: imageUrlC.text));
    Get.back();
  }

  addEmployee() {
    employeeList.add(Employee(
        id: employeeList.length,
        name: nameC.text,
        role: roleC.text,
        imageUrl: imageUrlC.text));
    clearTextControllers();
    Get.back();
  }

  clearTextControllers(){
    nameC.clear();
    roleC.clear();
    imageUrlC.clear();
  }

  deleteEmployee(int id) {
    Get.defaultDialog(
      radius: 8,
      title: 'Warning',
      middleText: 'Do you want to delete?',
      actions: [
        ElevatedButton(
          onPressed: () {
            employeeList.removeAt(id);
            Get.back();
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('No'),
        ),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
