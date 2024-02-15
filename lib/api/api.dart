import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {

  // String baseUrl = 'http://45.12.237.176:5000';

  /// Симферополь
  String baseUrl = 'http://192.168.0.102:3000';
  // String baseUrl = "25.67.41.148";

  /// Ви
  // static const String baseUrl = 'http://192.168.0.104:3000';

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
      'commentChargeRadioTerminalTelephone': commentChargeRadioTerminalTelephone,
      'commentDirectorChargeRadioTerminalTelephone': commentDirectorChargeRadioTerminalTelephone,
      'cleanlinessWorkplaceHost': cleanlinessWorkplaceHost,
      'cleanlinessWorkplaceHostFile': cleanlinessWorkplaceHostFile,
      'commentCleanlinessWorkplaceHost': commentCleanlinessWorkplaceHost,
      'commentDirectorCleanlinessWorkplaceHost': commentDirectorCleanlinessWorkplaceHost,
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
      String commentDirectorTakeRadioTerminalTelephone,
      bool sendMessageWatsApp,
      bool sendMessageTelegram,
      String? commentSendMessage,
      String commentDirectorSendMessage,
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
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorTakeRadioTerminalTelephone': commentDirectorTakeRadioTerminalTelephone,
      'commentDirectorSendMessage': commentDirectorSendMessage,
      'idUsers': idUser,
      'date' : date
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateHostBegin', data: data);
    return response.data;
  }


  Future<Map<String, dynamic>> updateHostEnd(
      String? commentDirectorChargeRadioTerminalTelephone,
      String? commentDirectorCleanlinessWorkplaceHost,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorChargeRadioTerminalTelephone': commentDirectorChargeRadioTerminalTelephone,
      'commentDirectorCleanlinessWorkplaceHost': commentDirectorCleanlinessWorkplaceHost,
      'idUsers': idUser,
      'date': date,
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
      'commentDirectorPutEverithingOnTheTables': commentDirectorPutEverithingOnTheTables,
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
      'commentDirectorCleanHumidor' : commentDirectorCleanHumidor,
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
    final response = await Dio().post('$baseUrl/WaiterBegin',
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

  Future<Map<String, dynamic>> updateWaiterBegin(
      String? commentDirectorTableArrangment,
      String? commentDirectorWipeTheTables,
      String? commentDirectorInspectionOfTheHall,
      String? commentDirectorArrangeOttomans,
      String? commentDirectorPutEverithingOnTheTables,
      String? commentDirectorWipeMenu,
      String? commentDirectorCleanWineCabinet,
      String? commentDirectorFillTheNapkinHolder,
      String? commentDirectorGarbageEmpty,
      String? commentDirectorPassDishesKitchen,
      String? commentDirectorRequestStartAndStopList,
      String? commentDirectorCleanHumidor,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorTableArrangment': commentDirectorTableArrangment,
      'commentDirectorWipeTheTables': commentDirectorWipeTheTables,
      'commentDirectorInspectionOfTheHall': commentDirectorInspectionOfTheHall,
      'commentDirectorArrangeOttomans': commentDirectorArrangeOttomans,
      'commentDirectorPutEverithingOnTheTables': commentDirectorPutEverithingOnTheTables,
      'commentDirectorWipeMenu': commentDirectorWipeMenu,
      'commentDirectorCleanWineCabinet': commentDirectorCleanWineCabinet,
      'commentDirectorFillTheNapkinHolder': commentDirectorFillTheNapkinHolder,
      'commentDirectorGarbageEmpty': commentDirectorGarbageEmpty,
      'commentDirectorPassDishesKitchen': commentDirectorPassDishesKitchen,
      'commentDirectorRequestStartAndStopList': commentDirectorRequestStartAndStopList,
      'commentDirectorCleanHumidor': commentDirectorCleanHumidor,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());

    final response = await Dio().post('$baseUrl/UpdateWaiterBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateWaiterEnd(
      String? commentDirectorChargerCandle,
      String? commentDirectorFixOttomansAndTables,
      String? commentDirectorCleanTables,
      String? commentDirectorPutAwayTheNapkins,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorChargerCandle': commentDirectorChargerCandle,
      'commentDirectorFixOttomansAndTables': commentDirectorFixOttomansAndTables,
      'commentDirectorCleanTables': commentDirectorCleanTables,
      'commentDirectorPutAwayTheNapkins': commentDirectorPutAwayTheNapkins,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());

    final response = await Dio().post('$baseUrl/UpdateWaiterEnd', data: data);
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
      'commentReportCompletedArt': commentReportCompleteArt,
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

  Future<Map<String, dynamic>> updateArtBegin(
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
      int id) async {
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
      'id': id,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateArtBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateArtEnd(
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
      int id) async {
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
      'id': id,
    };
    if (orderDressingRoomFile != null) {
      data['orderDressingRoomFile'] =
      await MultipartFile.fromFile(orderDressingRoomFile);
    }

    final formData = FormData.fromMap(data);
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateArtEnd',
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> updateDirectorArtBegin(
      String? commentDirectorListArtist,
      String? commentDirectorReadiness,
      String? commentDirectorSendListOfGirls,
      String? commentDirectorListDJ,
      String? commentDirectorAnalyzeGraph,
      String? commentDirectorControlArtistAnalize,
      String? commentDirectorFiveMinutes,
      String? commentDirectorCard,
      String? commentDirectorToyOrder,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorListArtist': commentDirectorListArtist,
      'commentDirectorReadiness': commentDirectorReadiness,
      'commentDirectorSendListOfGirls': commentDirectorSendListOfGirls,
      'commentDirectorListDJ': commentDirectorListDJ,
      'commentDirectorAnalyzeGraph': commentDirectorAnalyzeGraph,
      'commentDirectorControlArtistAnalize': commentDirectorControlArtistAnalize,
      'commentDirectorFiveMinutes': commentDirectorFiveMinutes,
      'commentDirectorCard': commentDirectorCard,
      'commentDirectorToyOrder': commentDirectorToyOrder,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateDirectorArtBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateDirectorArtEnd(
      String? commentDirectorReportCompletedArt,
      String? commentDirectorReportCompleteMarket,
      String? commentDirectorSendReportChat,
      String? commentDirectorOrderDressingRoom,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorReportCompletedArt': commentDirectorReportCompletedArt,
      'commentDirectorReportCompleteMarket': commentDirectorReportCompleteMarket,
      'commentDirectorSendReportChat': commentDirectorSendReportChat,
      'commentDirectorOrderDressingRoom': commentDirectorOrderDressingRoom,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateDirectorArtBegin', data: data);
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
      'commentCloseShift': commentCloseShift,
      'commentDirectorCloseShift': commentDirectorCloseShift,
      'cleanlinessWorkplace': cleanlinessWorkplace,
      'cleanlinessWorkplaceFile': cleanlinessWorkplaceFile,
      'commentCleanlinessWorkplace': commentCleanlinessWorkplace,
      'commentDirectorCleanlinessWorkplace': commentDirectorCleanlinessWorkplace,
      'idUser': idUser,
    };
    debugPrint(data.toString());

    if (cleanlinessWorkplaceFile != null) {
      data['cleanlinessWorkplaceFile'] =
      await MultipartFile.fromFile(cleanlinessWorkplaceFile);
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

  Future<Map<String, dynamic>> updateBarmanBegin(
      String? commentDirectorOpenCheckout,
      String? commentDirectorCheckAndTakeAlcogol,
      String? commentDirectorExtractorHumidifier,
      String? commentDirectorWriteStopList,
      String? commentDirectorRubTheDishes,
      String? commentDirectorWipeDustSelvingBegin,
      String? commentDirectorCleaning,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorOpenCheckout': commentDirectorOpenCheckout,
      'commentDirectorCheckAndTakeAlcogol': commentDirectorCheckAndTakeAlcogol,
      'commentDirectorExtractorHumidifier': commentDirectorExtractorHumidifier,
      'commentDirectorWriteStopList': commentDirectorWriteStopList,
      'commentDirectorRubTheDishes': commentDirectorRubTheDishes,
      'commentDirectorWipeDustSelvingBegin': commentDirectorWipeDustSelvingBegin,
      'commentDirectorCleaning': commentDirectorCleaning,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/UpdateBarmanBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateBarmanEnd(
      String? commentDirectorApplication,
      String? commentDirectorFillOutReport,
      String? commentDirectorCloseShift,
      String? commentDirectorCleanlinessWorkplace,
      String? commentDirectorWipeDustShelvingEnd,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorApplication': commentDirectorApplication,
      'commentDirectorFillOutReport': commentDirectorFillOutReport,
      'commentDirectorCloseShift': commentDirectorCloseShift,
      'commentDirectorCleanlinessWorkplace': commentDirectorCleanlinessWorkplace,
      'commentDirectorWipeDustShelvingEnd': commentDirectorWipeDustShelvingEnd,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());

    final response = await Dio().post('$baseUrl/UpdateBarmanEnd', data: data);
    return response.data;
  }

  /// Все запросы к Клинингу
  Future<Map<String, dynamic>> cleaningBegin(
      String date,
      String time,
      bool washFloors,
      bool wipeTablesWindowShelves,
      String? commentCabinet,
      String? commentDirectorCabinet,
      bool corridor,
      bool relax,
      bool guestbook,
      bool toilet,
      bool wipeWindowSills,
      bool wipePanelBox,
      bool wipePaintings,
      bool wipeInteriorDoors,
      String? commentFirstFloor,
      String? commentDirectorFirstFloor,
      bool wipeWalls,
      bool cleanSinks,
      bool cleanToilets,
      bool wipeMirrors,
      bool wipeDispensers,
      bool fillDispensers,
      String? commentToilets,
      String? commentDirectorToilets,
      bool washStairsSecondFloor,
      String? commentWashStairsSecondFloor,
      String? commentDirectorWashStairsSecondFloor,
      bool washFloorsSecondFloor,
      bool washStage,
      bool wipeLargeMirror,
      bool vacuum,
      bool wipeBaseboardsOnColumn,
      bool prepareCrazyRoom,
      String? commentSecondFloor,
      String? commentDirectorSecondFloor,
      bool washFloorsBar,
      bool washDishesBar,
      String? commentBar,
      String? commentDirectorBar,
      bool washFloorsAlice,
      bool wipeMirrorsHallway,
      bool fillDispensersAlice,
      bool wipeBathroomMirror,
      bool cleanSinkToilet,
      bool wipeReception,
      bool wipeTableGuestRoom,
      bool vacuumStairs,
      String? commentAlice,
      String? commentDirectorAlice,
      bool takeAllTrash,
      String? commentTakeAllTrash,
      String? commentDirectorTakeAllTrash,
      bool wipeIronWindowSills,
      bool wipeDoorSign,
      bool removeCobwebs,
      bool emptyTrashCan,
      String? commentStreet,
      String? commentDirectorStreet,
      bool checkRoomsCobwebs,
      String? commentCheckRoomsCobwebs,
      String? commentDirectorCheckRoomsCobwebs,
      bool checkCleanlinessBathrooms1,
      String? commentCheckCleanlinessBathrooms1,
      bool checkCleanlinessBathrooms2,
      String? commentCheckCleanlinessBathrooms2,
      bool checkCleanlinessBathrooms3,
      String? commentCheckCleanlinessBathrooms3,
      bool checkCleanlinessBathrooms4,
      String? commentCheckCleanlinessBathrooms4,
      bool checkCleanlinessBathrooms5,
      String? commentCheckCleanlinessBathrooms5,
      bool checkCleanlinessBathrooms6,
      String? commentCheckCleanlinessBathrooms6,
      bool checkCleanlinessBathrooms7,
      String? commentCheckCleanlinessBathrooms7,
      bool checkCleanlinessBathrooms8,
      String? commentCheckCleanlinessBathrooms8,
      bool checkCleanlinessBathrooms9,
      String? commentCheckCleanlinessBathrooms9,
      bool checkCleanlinessBathrooms10,
      String? commentCheckCleanlinessBathrooms10,
      bool checkCleanlinessBathrooms11,
      String? commentCheckCleanlinessBathrooms11,
      bool checkCleanlinessBathrooms12,
      String? commentCheckCleanlinessBathrooms12,
      bool checkCleanlinessBathrooms13,
      String? commentCheckCleanlinessBathrooms13,
      bool checkCleanlinessBathrooms14,
      String? commentCheckCleanlinessBathrooms14,
      bool checkCleanlinessBathrooms15,
      String? commentCheckCleanlinessBathrooms15,
      bool checkCleanlinessBathrooms16,
      String? commentCheckCleanlinessBathrooms16,
      String? commentDirectorCheckCleanlinessBathrooms,
      int idUser) async {
    Map<String, dynamic> data = {
      'date': date,
      'time': time,
      'washFloors': washFloors,
      'wipeTablesWindowShelves': wipeTablesWindowShelves,
      'commentCabinet': commentCabinet,
      'commentDirectorCabinet': commentDirectorCabinet,
      'corridor': corridor,
      'relax': relax,
      'guestbook': guestbook,
      'toilet': toilet,
      'wipeWindowSills': wipeWindowSills,
      'wipePanelBox': wipePanelBox,
      'wipePaintings': wipePaintings,
      'wipeInteriorDoors': wipeInteriorDoors,
      'commentFirstFloor': commentFirstFloor,
      'commentDirectorFirstFloor': commentDirectorFirstFloor,
      'wipeWalls': wipeWalls,
      'cleanSinks': cleanSinks,
      'cleanToilets': cleanToilets,
      'wipeMirrors': wipeMirrors,
      'wipeDispensers': wipeDispensers,
      'fillDispensers': fillDispensers,
      'commentToilets': commentToilets,
      'commentDirectorToilets': commentDirectorToilets,
      'washStairsSecondFloor': washStairsSecondFloor,
      'commentWashStairsSecondFloor': commentWashStairsSecondFloor,
      'commentDirectorWashStairsSecondFloor': commentDirectorWashStairsSecondFloor,
      'washFloorsSecondFloor': washFloorsSecondFloor,
      'washStage': washStage,
      'wipeLargeMirror': wipeLargeMirror,
      'vacuum': vacuum,
      'wipeBaseboardsOnColumn': wipeBaseboardsOnColumn,
      'prepareCrazyRoom': prepareCrazyRoom,
      'commentSecondFloor': commentSecondFloor,
      'commentDirectorSecondFloor': commentDirectorSecondFloor,
      'washFloorsBar': washFloorsBar,
      'washDishesBar': washDishesBar,
      'commentBar': commentBar,
      'commentDirectorBar': commentDirectorBar,
      'washFloorsAlice': washFloorsAlice,
      'wipeMirrorsHallway': wipeMirrorsHallway,
      'fillDispensersAlice': fillDispensersAlice,
      'wipeBathroomMirror': wipeBathroomMirror,
      'cleanSinkToilet': cleanSinkToilet,
      'wipeReception': wipeReception,
      'wipeTableGuestRoom': wipeTableGuestRoom,
      'vacuumStairs': vacuumStairs,
      'commentAlice': commentAlice,
      'commentDirectorAlice': commentDirectorAlice,
      'takeAllTrash': takeAllTrash,
      'commentTakeAllTrash': commentTakeAllTrash,
      'commentDirectorTakeAllTrash': commentDirectorTakeAllTrash,
      'wipeIronWindowSills': wipeIronWindowSills,
      'wipeDoorSign': wipeDoorSign,
      'removeCobwebs': removeCobwebs,
      'emptyTrashCan': emptyTrashCan,
      'commentStreet': commentStreet,
      'commentDirectorStreet': commentDirectorStreet,
      'checkRoomsCobwebs': checkRoomsCobwebs,
      'commentCheckRoomsCobwebs': commentCheckRoomsCobwebs,
      'commentDirectorCheckRoomsCobwebs': commentDirectorCheckRoomsCobwebs,
      'checkCleanlinessBathrooms1': checkCleanlinessBathrooms1,
      'commentCheckCleanlinessBathrooms1': commentCheckCleanlinessBathrooms1,
      'checkCleanlinessBathrooms2': checkCleanlinessBathrooms2,
      'commentCheckCleanlinessBathrooms2': commentCheckCleanlinessBathrooms2,
      'checkCleanlinessBathrooms3': checkCleanlinessBathrooms3,
      'commentCheckCleanlinessBathrooms3': commentCheckCleanlinessBathrooms3,
      'checkCleanlinessBathrooms4': checkCleanlinessBathrooms4,
      'commentCheckCleanlinessBathrooms4': commentCheckCleanlinessBathrooms4,
      'checkCleanlinessBathrooms5': checkCleanlinessBathrooms5,
      'commentCheckCleanlinessBathrooms5': commentCheckCleanlinessBathrooms5,
      'checkCleanlinessBathrooms6': checkCleanlinessBathrooms6,
      'commentCheckCleanlinessBathrooms6': commentCheckCleanlinessBathrooms6,
      'checkCleanlinessBathrooms7': checkCleanlinessBathrooms7,
      'commentCheckCleanlinessBathrooms7': commentCheckCleanlinessBathrooms7,
      'checkCleanlinessBathrooms8': checkCleanlinessBathrooms8,
      'commentCheckCleanlinessBathrooms8': commentCheckCleanlinessBathrooms8,
      'checkCleanlinessBathrooms9': checkCleanlinessBathrooms9,
      'commentCheckCleanlinessBathrooms9': commentCheckCleanlinessBathrooms9,
      'checkCleanlinessBathrooms10': checkCleanlinessBathrooms10,
      'commentCheckCleanlinessBathrooms10': commentCheckCleanlinessBathrooms10,
      'checkCleanlinessBathrooms11': checkCleanlinessBathrooms11,
      'commentCheckCleanlinessBathrooms11': commentCheckCleanlinessBathrooms11,
      'checkCleanlinessBathrooms12': checkCleanlinessBathrooms12,
      'commentCheckCleanlinessBathrooms12': commentCheckCleanlinessBathrooms12,
      'checkCleanlinessBathrooms13': checkCleanlinessBathrooms13,
      'commentCheckCleanlinessBathrooms13': commentCheckCleanlinessBathrooms13,
      'checkCleanlinessBathrooms14': checkCleanlinessBathrooms14,
      'commentCheckCleanlinessBathrooms14': commentCheckCleanlinessBathrooms14,
      'checkCleanlinessBathrooms15': checkCleanlinessBathrooms15,
      'commentCheckCleanlinessBathrooms15': commentCheckCleanlinessBathrooms15,
      'checkCleanlinessBathrooms16': checkCleanlinessBathrooms16,
      'commentCheckCleanlinessBathrooms16': commentCheckCleanlinessBathrooms16,
      'commentDirectorCheckCleanlinessBathrooms': commentDirectorCheckCleanlinessBathrooms,
      'idUser': idUser
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/CleaningBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> cleaningEnd(
      String date,
      String time,
      bool emptyTrashCansAllBathrooms,
      String? commentEmptyTrashCansAllBathrooms,
      String? commentDirectorEmptyTrashCansAllBathrooms,
      bool emptyTrashCanStreet,
      String? commentEmptyTrashCanStreet,
      String? commentDirectorEmptyTrashCanStreet,
      bool washFloorsAllRooms,
      String? commentWashFloorsAllRooms,
      String? commentDirectorWashFloorsAllRooms,
      bool takeTrashStorageRoom,
      String? commentTakeTrashStorageRoom,
      String? commentDirectorTakeTrashStorageRoom,
      bool countNumberCleanTowels,
      String? commentCountNumberCleanTowels,
      String? commentDirectorCountNumberCleanTowels,
      int idUser
      ) async {
    Map<String, dynamic> data = {
      'date' : date,
      'time' : time,
      'emptyTrashCansAllBathrooms' : emptyTrashCansAllBathrooms ,
      'commentEmptyTrashCansAllBathrooms' : commentEmptyTrashCansAllBathrooms,
      'commentDirectorEmptyTrashCansAllBathrooms' : commentDirectorEmptyTrashCansAllBathrooms,
      'emptyTrashCanStreet' : emptyTrashCanStreet,
      'commentEmptyTrashCanStreet' : commentEmptyTrashCanStreet,
      'commentDirectorEmptyTrashCanStreet' : commentDirectorEmptyTrashCanStreet,
      'washFloorsAllRooms' : washFloorsAllRooms,
      'commentWashFloorsAllRooms' : commentWashFloorsAllRooms,
      'commentDirectorWashFloorsAllRooms' : commentDirectorWashFloorsAllRooms,
      'takeTrashStorageRoom' : takeTrashStorageRoom,
      'commentTakeTrashStorageRoom' : commentTakeTrashStorageRoom,
      'commentDirectorTakeTrashStorageRoom' : commentDirectorTakeTrashStorageRoom,
      'countNumberCleanTowels' : countNumberCleanTowels,
      'commentCountNumberCleanTowels' : commentCountNumberCleanTowels,
      'commentDirectorCountNumberCleanTowels' : commentDirectorCountNumberCleanTowels,
      'idUser': idUser
    };
    debugPrint(data.toString());
    final response = await Dio().post('$baseUrl/CleaningEnd', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> showCleaningBegin(String? date) async {
    final response = await Dio().post('$baseUrl/ShowCleaningBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> showCleaningEnd(String? date) async {
    final response = await Dio().post('$baseUrl/ShowCleaningEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> updateCleaningBegin(
      String? commentDirectorCabinet,
      String? commentDirectorFirstFloor,
      String? commentDirectorToilets,
      String? commentDirectorWashStairsSecondFloor,
      String? commentDirectorSecondFloor,
      String? commentDirectorBar,
      String? commentDirectorAlice,
      String? commentDirectorTakeAllTrash,
      String? commentDirectorStreet,
      String? commentDirectorCheckRoomsCobwebs,
      String? commentDirectorCheckCleanlinessBathrooms,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorCabinet': commentDirectorCabinet,
      'commentDirectorFirstFloor': commentDirectorFirstFloor,
      'commentDirectorToilets': commentDirectorToilets,
      'commentDirectorWashStairsSecondFloor': commentDirectorWashStairsSecondFloor,
      'commentDirectorSecondFloor': commentDirectorSecondFloor,
      'commentDirectorBar': commentDirectorBar,
      'commentDirectorAlice': commentDirectorAlice,
      'commentDirectorTakeAllTrash': commentDirectorTakeAllTrash,
      'commentDirectorStreet': commentDirectorStreet,
      'commentDirectorCheckRoomsCobwebs': commentDirectorCheckRoomsCobwebs,
      'commentDirectorCheckCleanlinessBathrooms': commentDirectorCheckCleanlinessBathrooms,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());

    final response = await Dio().post('$baseUrl/UpdateCleaningBegin', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateCleaningEnd(
      String? commentDirectorEmptyTrashCansAllBathrooms,
      String? commentDirectorEmptyTrashCanStreet,
      String? commentDirectorWashFloorsAllRooms,
      String? commentDirectorTakeTrashStorageRoom,
      String? commentDirectorCountNumberCleanTowels,
      int idUser,
      String date) async {
    Map<String, dynamic> data = {
      'commentDirectorEmptyTrashCansAllBathrooms': commentDirectorEmptyTrashCansAllBathrooms,
      'commentDirectorEmptyTrashCanStreet': commentDirectorEmptyTrashCanStreet,
      'commentDirectorWashFloorsAllRooms': commentDirectorWashFloorsAllRooms,
      'commentDirectorTakeTrashStorageRoom': commentDirectorTakeTrashStorageRoom,
      'commentDirectorCountNumberCleanTowels': commentDirectorCountNumberCleanTowels,
      'idUsers': idUser,
      'date': date,
    };
    debugPrint(data.toString());

    final response = await Dio().post('$baseUrl/UpdateCleaningEnd', data: data);
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

  Future<String?> checkReportCleaningBegin(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportCleaningBegin', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null) {
      return response.data['Login'] as String;
    }
    return null;
  }

  Future<String?> checkReportCleaningEnd(String? date) async {
    final response = await Dio().post('$baseUrl/CheckReportCleaningEnd', data: {"Date": date});
    debugPrint(response.data.toString());
    if(response.data != null) {
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

  Future<List> branchId () async {
    final response = await Dio().post('$baseUrl/BranchId');
    return response.data;
  }

  Future<List> branchSelection(int branch) async {
    final response = await Dio().post('$baseUrl/BranchSelection', data: {"Branch_idBranch": branch});
    // debugPrint(response.data.toString());
    if(response.statusCode == 400) {
      return [{"message": "Error"}];
    } else if (response.data.length == 0) {
      return [{"message": "Нет сотрудников"}];
    }
    return response.data;
  }





}
