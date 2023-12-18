import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  /// Симферополь
  // String baseUrl = 'http://192.168.0.102:3000';

  // Ви
  static const String baseUrl = 'http://192.168.0.104:3000';

  /// Севастополь
  // String baseUrl = 'http://192.168.1.55:3000';

  /// все запросы к Host
  Future<Map<String, dynamic>> hostEnd(
      String date,
      String time,
      bool chargeRadioTerminalTelephone,
      String? commentChargeRadioTerminalTelephone,
      String? commentDirectorChargeRadioTerminalTelephone,
      bool cleanlinessWorkplaceHost,
      String? cleanlinessWorkplaceHostFile,
      String? commentCleanlinessWorkplaceHost,
      String? commentDirectorCleanlinessWorkplaceHost,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'chargeRadioTerminalTelephone': chargeRadioTerminalTelephone,
      'commentChargeRadioTerminalTelephone':
          commentChargeRadioTerminalTelephone,
      'commentDirectorChargeRadioTerminalTelephone':
          commentDirectorChargeRadioTerminalTelephone,
      'cleanlinessWorkplaceHost': cleanlinessWorkplaceHost,
      'cleanlinessWorkplaceHostFile': cleanlinessWorkplaceHostFile,
      'commentCleanlinessWorkplaceHost': commentCleanlinessWorkplaceHost,
      'commentDirectorCleanlinessWorkplaceHost':
          commentDirectorCleanlinessWorkplaceHost,
      'idUser': idUser,
    };
    debugPrint(data.toString());

    if (cleanlinessWorkplaceHostFile != null) {
      data['cleanlinessWorkplaceHostFile'] =
          await MultipartFile.fromFile(cleanlinessWorkplaceHostFile);
    }

    final formData = FormData.fromMap(data);
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/HostEnd',
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> hostBegin(
      String date,
      String time,
      bool takeRadioTerminalTelephone,
      String? commentTakeRadioTerminalTelephone,
      String? commentDirectorTakeRadioTerminalTelephone,
      bool sendMessageWatsApp,
      bool sendMessageTelegram,
      String? commentSendMessage,
      String? commentDirectorSendMessage,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'takeRadioTerminalTelephone': takeRadioTerminalTelephone,
      'commentTakeRadioTerminalTelephone': commentTakeRadioTerminalTelephone,
      'commentDirectorTakeRadioTerminalTelephone': commentDirectorTakeRadioTerminalTelephone,
      'sendMessageWatsApp': sendMessageWatsApp,
      'sendMessageTelegram': sendMessageTelegram,
      'commentSendMessage': commentSendMessage,
      'commentDirectorSendMessage': commentDirectorSendMessage,
      'idUsers': idUser,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/HostBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> showHostBegin(String? date) async {
    final response = await Dio().post('$baseUrl/ShowHostBegin', data: {'Date' :date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> showHostEnd(String date) async {
    final response = await Dio().post('$baseUrl/ShowHostEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> updateHostBegin(
      String? commentDirectorTakeRadioTerminalTelephone,
      String? commentDirectorSendMessage,
      int idUser) async {
    Map<String, dynamic> data = {
      'commentDirectorTakeRadioTerminalTelephone': commentDirectorTakeRadioTerminalTelephone,
      'commentDirectorSendMessage': commentDirectorSendMessage,
      'idUsers': idUser,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateHostBegin', data: data);
    return response.data;
  }


  Future<Map<String, dynamic>> updateHostEnd(
      String? commentDirectorChargeRadioTerminalTelephone,
      String? commentDirectorCleanlinessWorkplaceHost,
      int idUser) async {
    Map<String, dynamic> data = {
      'commentDirectorChargeRadioTerminalTelephone': commentDirectorChargeRadioTerminalTelephone,
      'commentDirectorCleanlinessWorkplaceHost': commentDirectorCleanlinessWorkplaceHost,
      'idUsers': idUser,
    };
    debugPrint(data.toString());

    final response = await Dio().post('$baseUrl/UpdateHostEnd', data: data);
    return response.data;
  }

  /// Все запросы к Waiter
  Future<Map<String, dynamic>> waiterBegin(
      String date,
      String time,
      bool tableArrangement,
      String? tableArrangementFile,
      String? commentTableArrangment,
      String? commentDirectorTableArrangment,
      bool wipeTheTables,
      String? wipeTheTablesFile,
      String? commentWipeTheTables,
      String? commentDirectorWipeTheTables,
      bool inspectionOfTheHall,
      String? inspectionOfTheHallFile,
      String? commentInspectionOfTheHall,
      String? commentDirectorInspectionOfTheHall,
      bool arrangeOttomans,
      String? arrangeOttomansFile,
      String? commentArrangeOttomans,
      String? commentDirectorArrangeOttomans,
      bool putEverythingOnTheTables,
      String? putEverythingOnTheTablesFile,
      String? commentPutEverithingOnTheTables,
      String? commentDirectorPutEverithingOnTheTables,
      bool wipeMenu,
      String? wipeMenuFile,
      String? commentWipeMenu,
      String? commentDirectorWipeMenu,
      bool cleanWineCabinet,
      String? commentCleanWineCabinet,
      String? commentDirectorCleanWineCabinet,
      bool fillTheNapkinHolder,
      String? commentFillTheNapkinHolder,
      String? commentDirectorFillTheNapkinHolder,
      bool garbageEmpty,
      String? commentGarbageEmpty,
      String? commentDirectorGarbageEmpty,
      bool passDishesKitchen,
      String? commentPassDishesKitchen,
      String? commentDirectorPassDishesKitchen,
      bool requestStartAndStopList,
      String? commentRequestStartAndStopList,
      String? commentDirectorRequestStartAndStopList,
      bool cleanHumidor,
      String? commentCleanHumidor,
      String? commentDirectorCleanHumidor,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'tableArrangement': tableArrangement,
      'tableArrangementFile': tableArrangementFile,
      'commentTableArrangment': commentTableArrangment,
      'commentDirectorTableArrangment': commentDirectorTableArrangment,
      'wipeTheTables': wipeTheTables,
      'wipeTheTablesFile': wipeTheTablesFile,
      'commentWipeTheTables': commentWipeTheTables,
      'commentDirectorWipeTheTables': commentDirectorWipeTheTables,
      'inspectionOfTheHall': inspectionOfTheHall,
      'inspectionOfTheHallFile': inspectionOfTheHallFile,
      'commentInspectionOfTheHall': commentInspectionOfTheHall,
      'commentDirectorInspectionOfTheHall': commentDirectorInspectionOfTheHall,
      'arrangeOttomans': arrangeOttomans,
      'arrangeOttomansFile': arrangeOttomansFile,
      'commentArrangeOttomans': commentArrangeOttomans,
      'commentDirectorArrangeOttomans': commentDirectorArrangeOttomans,
      'putEverythingOnTheTables': putEverythingOnTheTables,
      'putEverythingOnTheTablesFile': putEverythingOnTheTablesFile,
      'commentPutEverithingOnTheTables': commentPutEverithingOnTheTables,
      'commentDirectorPutEverithingOnTheTables':
          commentDirectorPutEverithingOnTheTables,
      'wipeMenu': wipeMenu,
      'wipeMenuFile': wipeMenuFile,
      'commentWipeMenu': commentWipeMenu,
      'commentDirectorWipeMenu': commentDirectorWipeMenu,
      'cleanWineCabinet': cleanWineCabinet,
      'commentCleanWineCabinet': commentCleanWineCabinet,
      'commentDirectorCleanWineCabinet': commentDirectorCleanWineCabinet,
      'fillTheNapkinHolder': fillTheNapkinHolder,
      'commentFillTheNapkinHolder': commentFillTheNapkinHolder,
      'commentDirectorFillTheNapkinHolder': commentDirectorFillTheNapkinHolder,
      'garbageEmpty': garbageEmpty,
      'commentGarbageEmpty': commentGarbageEmpty,
      'commentDirectorGarbageEmpty': commentDirectorGarbageEmpty,
      'passDishesKitchen': passDishesKitchen,
      'commentPassDishesKitchen': commentPassDishesKitchen,
      'commentDirectorPassDishesKitchen': commentDirectorPassDishesKitchen,
      'requestStartAndStopList': requestStartAndStopList,
      'commentRequestStartAndStopList': commentRequestStartAndStopList,
      'commentDirectorRequestStartAndStopList':
          commentDirectorRequestStartAndStopList,
      'cleanHumidor': cleanHumidor,
      'commentCleanHumidor': commentCleanHumidor,
      'idUser': idUser,
    };
    debugPrint(data.toString());

    if (tableArrangementFile != null) {
      data['tableArrangementFile'] =
          await MultipartFile.fromFile(tableArrangementFile);
    }

    if (wipeTheTablesFile != null) {
      data['wipeTheTablesFile'] =
          await MultipartFile.fromFile(wipeTheTablesFile);
    }

    if (inspectionOfTheHallFile != null) {
      data['inspectionOfTheHallFile'] =
          await MultipartFile.fromFile(inspectionOfTheHallFile);
    }

    if (arrangeOttomansFile != null) {
      data['arrangeOttomansFile'] =
          await MultipartFile.fromFile(arrangeOttomansFile);
    }

    if (putEverythingOnTheTablesFile != null) {
      data['putEverythingOnTheTablesFile'] =
          await MultipartFile.fromFile(putEverythingOnTheTablesFile);
    }

    if (wipeMenuFile != null) {
      data['wipeMenuFile'] = await MultipartFile.fromFile(wipeMenuFile);
    }

    final formData = FormData.fromMap(data);
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/waiterBegin',
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
    return response.data;
  }

  Future<int?> waiterEnd(
      String date,
      String time,
      bool chargerCandle,
      String? commentChargerCandle,
      String? commentDirectorChargerCandle,
      bool fixOttomansAndTables,
      String? commentFixOttomansAndTables,
      String? commentDirectorFixOttomansAndTables,
      bool cleanTables,
      String? commentCleanTables,
      String? commentDirectorCleanTables,
      bool putAwayTheNapkins,
      String? commentPutAwayTheNapkins,
      String? commentDirectorPutAwayTheNapkins,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'chargerCandle': chargerCandle,
      'commentChargerCandle': commentChargerCandle,
      'commentDirectorChargerCandle': commentDirectorChargerCandle,
      'fixOttomansAndTables': fixOttomansAndTables,
      'commentFixOttomansAndTables': commentFixOttomansAndTables,
      'commentDirectorFixOttomansAndTables': commentDirectorFixOttomansAndTables,
      'cleanTables': cleanTables,
      'commentCleanTables': commentCleanTables,
      'commentDirectorCleanTables': commentDirectorCleanTables,
      'putAwayTheNapkins': putAwayTheNapkins,
      'commentPutAwayTheNapkins': commentPutAwayTheNapkins,
      'commentDirectorPutAwayTheNapkins': commentDirectorPutAwayTheNapkins,
      'idUsers': idUser,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/WaiterEnd', data: data);
    debugPrint(response.statusCode.toString());
    return response.statusCode;
  }

  Future<Map<String, dynamic>> showWaiterBegin(String? date) async {
    final response = await Dio().post('$baseUrl/ShowWaiterBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> showWaiterEnd(String? date) async {
    final response = await Dio().post('$baseUrl/ShowWaiterEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  /// Запросы к Art
  Future<void> artBegin(
    String date,
    String time,
    bool listArtist,
    String? commentListArtist,
    String? commentDirectorListArtist,
    bool readiness,
    String? commentReadiness,
    String? commentDirectorReadiness,
    bool sendListOfGirls,
    String? commentSendListOfGirls,
    String? commentDirectorSendListOfGirls,
    bool listDJ,
    String? commentListDJ,
    String? commentDirectorListDJ,
    bool analyzeGraph,
    String? commentAnalyzeGraph,
    String? commentDirectorAnalyzeGraph,
    bool controlArtistAnalize,
    String? commentControlArtistAnalize,
    String? commentDirectorControlArtistAnalize,
    bool fiveMinutes,
    String? commentFiveMinutes,
    String? commentDirectorFiveMinutes,
    bool firstCard,
    bool secondCard,
    bool thirdCard,
    String? commentCard,
    String? commentDirectorCard,
    bool control1,
    String? commentControl1,
    bool control2,
    String? commentControl2,
    bool control3,
    String? commentControl3,
    bool control4,
    String? commentControl4,
    bool control5,
    String? commentControl5,
    bool toyOrder,
    String? commentToyOrder,
    String? commentDirectorToyOrder,
    int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'listArtist' : listArtist,
      'commentListArtist' : commentListArtist,
      'commentDirectorListArtist' : commentDirectorListArtist,
      'readiness' : readiness,
      'commentReadiness' : commentReadiness,
      'commentDirectorReadiness' : commentDirectorReadiness,
      'sendListOfGirls' : sendListOfGirls,
      'commentSendListOfGirls' : commentSendListOfGirls,
      'commentDirectorSendListOfGirls' : commentDirectorSendListOfGirls,
      'listDJ' : listDJ,
      'commentListDJ' : commentListDJ,
      'commentDirectorListDJ' : commentDirectorListDJ,
      'analyzeGraph' : analyzeGraph,
      'commentAnalyzeGraph' : commentAnalyzeGraph,
      'commentDirectorAnalyzeGraph' : commentDirectorAnalyzeGraph,
      'controlArtistAnalize' : controlArtistAnalize,
      'commentControlArtistAnalize' : commentControlArtistAnalize,
      'commentDirectorControlArtistAnalize' : commentDirectorControlArtistAnalize,
      'fiveMinutes' : fiveMinutes,
      'commentFiveMinutes' : commentFiveMinutes,
      'commentDirectorFiveMinutes' : commentDirectorFiveMinutes,
      'firstCard' : firstCard,
      'secondCard' : secondCard,
      'thirdCard' : thirdCard,
      'commentCard' : commentCard,
      'commentDirectorCard' : commentDirectorCard,
      'control1' : control1,
      'commentControl1' : commentControl1,
      'control2' : control2,
      'commentControl2' : commentControl2,
      'control3' : control3,
      'commentControl3' : commentControl3,
      'control4' : control4,
      'commentControl4' : commentControl4,
      'control5' : control5,
      'commentControl5' : commentControl5,
      'toyOrder' : toyOrder,
      'commentToyOrder' : commentToyOrder,
      'commentDirectorToyOrder' : commentDirectorToyOrder,
      'idUsers': idUser,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/ArtBegin', data: data);
  }

  Future<Map<String, dynamic>> showArtBegin(String? date) async {
    final response = await Dio().post('$baseUrl/ShowArtBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>>? artEnd(
      String date,
      String time,
      bool reportCompletedArt,
      String? commentReportCompleteArt,
      String? commentDirectorReportCompletedArt,
      bool reportCompleteMarket,
      String? commentReportCompleteMarket,
      String? commentDirectorReportCompleteMarket,
      bool art,
      bool bar,
      bool market,
      bool hostes,
      String? commentSendReportChat,
      String? commentDirectorSendReportChat,
      bool orderDressingRoom,
      String? orderDressingRoomFile,
      String? commentOrderDressingRoom,
      String? commentDirectorOrderDressingRoom,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'reportCompletedArt': reportCompletedArt,
      'commitReportCompleteArt': commentReportCompleteArt,
      'commentDirectorReportCompletedArt': commentDirectorReportCompletedArt,
      'reportCompleteMarket': reportCompleteMarket,
      'commentReportCompleteMarket': commentReportCompleteMarket,
      'commentDirectorReportCompleteMarket': commentDirectorReportCompleteMarket,
      'art': art,
      'bar': bar,
      'market': market,
      'hostes': hostes,
      'commentSendReportChat': commentSendReportChat,
      'commentDirectorSendReportChat': commentDirectorSendReportChat,
      'orderDressingRoom': orderDressingRoom,
      'orderDressingRoomFile': orderDressingRoomFile,
      'commentOrderDressingRoom': commentOrderDressingRoom,
      'commentDirectorOrderDressingRoom': commentDirectorOrderDressingRoom,
      'idUser': idUser,
    };
    debugPrint(data.toString());

    if (orderDressingRoomFile != null) {
      data['orderDressingRoomFile'] =
      await MultipartFile.fromFile(orderDressingRoomFile);
    }

    final formData = FormData.fromMap(data);
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/ArtEnd',
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> showArtEnd(String? date) async {
    final response = await Dio().post('$baseUrl/ShowArtEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }


/// Все запросы к Barman

  Future<Map<String, dynamic>> barmanBegin(
      String date,
      String time,
      bool openCheckout,
      String? commentOpenCheckout,
      String? commentDirectorOpenCheckout,
      bool checkAndTakeAlcogol,
      String? checkAndTakeAlcogolFile,
      String? commentCheckAndTakeAlcogol,
      String? commentDirectorCheckAndTakeAlcogol,
      bool extractorHumidifier,
      String? commentExtractorHumidifier,
      String? commentDirectorExtractorHumidifier,
      bool writeStopList,
      String? commentWriteStopList,
      String? commentDirectorWriteStopList,
      bool rubTheDishes,
      String? rubTheDishesFile,
      String? commentRubTheDishes,
      String? commentDirectorRubTheDishes,
      bool wipeDustShelvingBegin,
      String? wipeDustShelvingBeginFile,
      String? commentWipeDustShelvingBegin,
      String? commentDirectorWipeDustShelvingBegin,
      bool cleaning,
      String? cleaningFile,
      String? commentCleaning,
      String? commentDirectorCleaning,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'openCheckout': openCheckout,
      'commentOpenCheckout': commentOpenCheckout,
      'commentDirectorOpenCheckout': commentDirectorOpenCheckout,
      'checkAndTakeAlcogol': checkAndTakeAlcogol,
      'checkAndTakeAlcogolFile': checkAndTakeAlcogolFile,
      'commentCheckAndTakeAlcogol': commentCheckAndTakeAlcogol,
      'commentDirectorCheckAndTakeAlcogol': commentDirectorCheckAndTakeAlcogol,
      'extractorHumidifier': extractorHumidifier,
      'commentExtractorHumidifier': commentExtractorHumidifier,
      'commentDirectorExtractorHumidifier': commentDirectorExtractorHumidifier,
      'writeStopList': writeStopList,
      'commentWriteStopList': commentWriteStopList,
      'commentDirectorWriteStopList': commentDirectorWriteStopList,
      'rubTheDishes': rubTheDishes,
      'rubTheDishesFile': rubTheDishesFile,
      'commentRubTheDishes': commentRubTheDishes,
      'commentDirectorRubTheDishes': commentDirectorRubTheDishes,
      'wipeDustShelvingBegin': wipeDustShelvingBegin,
      'wipeDustShelvingBeginFile': wipeDustShelvingBegin,
      'commentWipeDustShelvingBegin': commentWipeDustShelvingBegin,
      'commentDirectorWipeDustShelvingBegin': commentDirectorWipeDustShelvingBegin,
      'cleaning': cleaning,
      'cleaningFile': cleaningFile,
      'commentCleaning': commentCleaning,
      'commentDirectorCleaning': commentDirectorCleaning,
      'idUser': idUser,
    };
    debugPrint(data.toString());

    if (checkAndTakeAlcogolFile != null) {
      data['checkAndTakeAlcogolFile'] =
      await MultipartFile.fromFile(checkAndTakeAlcogolFile);
    }

    if (rubTheDishesFile != null) {
      data['rubTheDishesFile'] =
      await MultipartFile.fromFile(rubTheDishesFile);
    }

    if (cleaningFile != null) {
      data['cleaningFile'] =
      await MultipartFile.fromFile(cleaningFile);
    }

    final formData = FormData.fromMap(data);
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/barmanBegin',
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> barmanEnd(
      String date,
      String time,
      bool alcogol,
      bool nonAlcogol,
      bool tobacco,
      String? commentApplication,
      String? commentDirectorApplication,
      bool fillOutReport,
      String? commentFillOutReport,
      String? commentDirectorFillOutReport,
      bool closeShift,
      String? commentCloseShift,
      String? commentDirectorCloseShift,
      bool cleanlinessWorkplace,
      String? cleanlinessWorkplaceFile,
      String? commentCleanlinessWorkplace,
      String? commentDirectorCleanlinessWorkplace,
      bool wipeDustShelvingEnd,
      String? wipeDustShelvingEndFile,
      String? commentWipeDustShelvingEnd,
      String? commentDirectorWipeDustShelvingEnd,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'alcogol': alcogol,
      'nonAlcogol': nonAlcogol,
      'tobacco': tobacco,
      'commentApplication': commentApplication,
      'commentDirectorApplication': commentDirectorApplication,
      'fillOutReport': fillOutReport,
      'commentFillOutReport': commentFillOutReport,
      'commentDirectorFillOutReport': commentDirectorFillOutReport,
      'closeShift': closeShift,
      'commentDirectorCloseShift': commentDirectorCloseShift,
      'cleanlinessWorkplace': cleanlinessWorkplace,
      'cleanlinessWorkplaceFile': cleanlinessWorkplaceFile,
      'commentCleanlinessWorkplace': commentCleanlinessWorkplace,
      'commentDirectorCleanlinessWorkplace': commentDirectorCleanlinessWorkplace,
      'wipeDustShelvingEnd' : wipeDustShelvingEnd,
      'wipeDustShelvingEndFile': wipeDustShelvingEndFile,
      'commentWipeDustShelvingEnd': commentWipeDustShelvingEnd,
      'commentDirectorWipeDustShelvingEnd' : commentDirectorWipeDustShelvingEnd,
      'idUser': idUser,
    };
    debugPrint(data.toString());

    if (cleanlinessWorkplaceFile != null) {
      data['cleanlinessWorkplaceFile'] =
      await MultipartFile.fromFile(cleanlinessWorkplaceFile);
    }

    if (wipeDustShelvingEndFile != null) {
      data['wipeDustShelvingEndFile'] = await MultipartFile.fromFile(wipeDustShelvingEndFile);
    }

    final formData = FormData.fromMap(data);
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/BarmanEnd',
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> showBarmanBegin(String? date) async {
    final response = await Dio().post('$baseUrl/ShowBarmanBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> showBarmanEnd(String? date) async {
    final response = await Dio().post('$baseUrl/ShowBarmanEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  /// Проверка наличия Отчета по дате
  Future<String?> checkReportBarmanEnd(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportBarmanEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null) {
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportBarmanBegin(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportBarmanBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null) {
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportWaiterEnd(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportWaiterEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null) {
      debugPrint(response.data['Login'].toString());
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportWaiterBegin(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportWaiterBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null) {
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportHostBegin(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportHostBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    if (response.data != null) {
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportHostEnd(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportHostEnd', data: {"Date": date});
    // debugPrint('reponse HostEnd ${response.data['Login'].toString()}');
    if(response.data != null) {
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportArtEnd(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportArtEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null){
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportArtBegin(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportArtBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    if (response.data != null){
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<Map<String, dynamic>> registration(
      String login,
      String password,
      String post) async {
    Map<String, dynamic> data = {
      'Login': login,
      'Password': password,
      'Post': post,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/Registration', data: data);
    return response.data;
  }

   authorization(
      String login,
      String password
      ) async {
    Map<String, dynamic> data = {
      'Login': login,
      'Password': password,
    };
    try {
      final response = await Dio().post('$baseUrl/Authorization', data: data);
      debugPrint(response.data.toString());
      return response.data['idUsers'];
    } catch(e) {
      return 'Error';
    }
  }

  String getPhoto(String image) {
    return '$baseUrl/$image';
  }

  Future<Map<String, dynamic>> showUser(int idUsers) async {
      try{
        debugPrint(idUsers.toString());
        final response = await Dio().post('$baseUrl/ShowUser', data: {"idUsers": idUsers});
        debugPrint(response.data.toString());
        return response.data;
      } catch(e) {
        return {"message": "error"};
      }
  }






}
