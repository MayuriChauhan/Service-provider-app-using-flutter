import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/service_model.dart';

class ServiceProvider with ChangeNotifier{
  late ServiceModel serviceModel;
  List<ServiceModel>search=[];
  serviceModels(QueryDocumentSnapshot element) {
    serviceModel = ServiceModel(img: element.get("img"),
        heading: element.get("heading"),
        price: element.get("price"),
        desc: element.get("desc"),
        serviceID: element.get("serviceID")
    );
    search.add(serviceModel);
  }
List<ServiceModel> cleaningServiceList=[];
fetchCleaningServiceData()async{
  List<ServiceModel> newList=[];
  QuerySnapshot value= await FirebaseFirestore.instance.collection("CleaningService").get();
  value.docs.forEach(
        (element) {
          serviceModels(element);
          newList.add(serviceModel);
        },
    );
    cleaningServiceList=newList;
    notifyListeners();
  }

  List<ServiceModel>get getCleaningServiceDataList{
    return cleaningServiceList;
  }

  List<ServiceModel> repairServiceList=[];
fetchRepairServiceData()async{
  List<ServiceModel> newList=[];
  QuerySnapshot value=
  await FirebaseFirestore.instance.collection("RepairService").get();
  value.docs.forEach(
        (element) {
          serviceModels(element);
          newList.add(serviceModel);
    },
  );
  repairServiceList=newList;
  notifyListeners();
}

List<ServiceModel>get getRepairServiceDataList{
  return repairServiceList;
}

  List<ServiceModel> handymanServiceList=[];
  fetchHandymanServiceData()async{
    List<ServiceModel> newList=[];
    QuerySnapshot value= await FirebaseFirestore.instance.collection("HandymanService").get();
    value.docs.forEach(
          (element) {
        serviceModels(element);
        newList.add(serviceModel);
      },
    );
    handymanServiceList=newList;
    notifyListeners();
  }

  List<ServiceModel>get getHandymanServiceDataList{
    return handymanServiceList;
  }

  List<ServiceModel> paintServiceList=[];
  fetchPaintServiceData()async{
    List<ServiceModel> newList=[];
    QuerySnapshot value= await FirebaseFirestore.instance.collection("HomePainting&WaterProofingServices").get();
    value.docs.forEach(
          (element) {
        serviceModels(element);
        newList.add(serviceModel);
      },
    );
    paintServiceList=newList;
    notifyListeners();
  }

  List<ServiceModel>get getPaintServiceDataList{
    return paintServiceList;
  }

  List<ServiceModel> pestcontrolServiceList=[];
  fetchPestControlServiceData()async{
    List<ServiceModel> newList=[];
    QuerySnapshot value= await FirebaseFirestore.instance.collection("PestControlServices").get();
    value.docs.forEach(
          (element) {
        serviceModels(element);
        newList.add(serviceModel);
      },
    );
    pestcontrolServiceList=newList;
    notifyListeners();
  }

  List<ServiceModel>get getPestControlServiceDataList{
    return pestcontrolServiceList;
  }


  //////////search return/////////
List<ServiceModel> get getAllServiceSearch{
    return search;
}
}