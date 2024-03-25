import 'package:get/get.dart';

class CompaniesController extends GetxController {
  var selectedCompanies = <String>[].obs;
  var isChecked = <String, RxBool>{}.obs; // Make the map observable

  bool isCompanyChecked(String companyName) {
    return isChecked[companyName]?.value ?? false;
  }

  void toggleCompany(String companyName) {
    if (selectedCompanies.contains(companyName)) {
      selectedCompanies.remove(companyName);
    } else {
      selectedCompanies.add(companyName);
    }
    
    if (!isChecked.containsKey(companyName)) {
      isChecked[companyName] = false.obs;
    }
    
    isChecked[companyName]!.value = !isChecked[companyName]!.value;
  }
}
