import 'package:gsheets/gsheets.dart';

class GoogleSheetProvider {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "project-cafe-373712",
  "private_key_id": "57d92543d452b0d9c442a5df1e16e4a3aebed414",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDc2PMVfnkjjXa7\nuWgY8XUdlLMfE//SbqYj+l160QZsas12BG2AYvo+fytpi+Hj2D1lYAFuLQprKbfA\n8fFVk92Wsz4O9QkInEmpYYlOSW7T7aVB2kBp4KUhNNULUw+02yE4CAKVl6abtzWQ\nqDz6XJhcFt+A9+y0jCq5Cg3L5nanDNZ19Q0P0n94ufX7+7ihhsDJNXgiE0lgzvaj\nMPf47SDDaGzxWT+liwssWKzOgezJNIk7SI/gFJVV8ZjVrQOC9GjCerh0Om1dqS0g\nzQv+7h08ABpWN4KzeJ9RdkwbQOrA7Rrhhg/ZuGGR0kbN9Y70xb6SzC9rVD7afeoz\nAzrWFiyNAgMBAAECggEAPOr1BnlH9fgYB8kpPzQfX4T8cbalCsktt9/gODf/IxnE\nyeiHwfHLYEDY2zjUGvKzYMq+KkNvS8cKokS6kqYCagbQN/T8RG1D3l6Crt8PnJLB\nUmxe9zWZpxK5L3H+c588RwXinJvjv7EmK9xUUaUH++LtTNhWaSj+weLVkmhkU0hy\nlB3MgKr7x8B6OwZLST/I0u2i/iRQKF4ZRPjnXOHU2oifVEs7djn4+dren9JDfQuE\n4Qileksj7+IfA7pKSXkr7atAq1+Djjxu7UVBTIVHqy3Iu+rTa8i6fyUX1hpPevtO\ny+iJvDqBeMxfevENiuhgA8MOQnpe/d+n5W+QSRoSGwKBgQDvJrM1NirrpBwhbs+9\nqDc2kM0YKVR4QroU7PS6XUb/9OMOwtYRCh6dflsS7ApV/YtYriegfD6hcFITV+2X\nNscQMmR2UyPD1bh/UmREYK60lHaVICpyKULOPZC5s11rq+VvvdsLN33/ufhvQyQk\n3gy71Njxr9kTaPbuvSxv75cQ7wKBgQDsaCBHgUuxY4kI5DMMrMEFIxE4eNRdtTTw\n2Wb+7R94+gDgjvTtvfpZgJeDUOQd0ZZXlDV7oTOs+iKHU8T8+rVCi1rCMdpUSKkn\nvSTnZjBzrCeIZtJP1tA6HQ7NegjCtH7m/SFrFFmj7B4uIkPaCLRILgOjunA81kvw\nsHs5CYMiQwKBgQDDocnZjp0ftFjatJY2FGROO7e6uxyBYDxun8Q2q9VHzqDrU1Dg\nEYIn3dRMr1BpNYaHHbgG3Xwyffp2HmiaWVIQGtj5vls0eSF67gBduyVPTV+P8Aco\n6j3fDpfUgTi7uptuhEWqcFOfHRdwlOD9U7Pg92Ycl3ghG61ccN3oF3thewKBgQCD\n/t+HDTomIV0yCbg3K33aUGodDdoFOFgG4lwPmnYoJe63cxpuY9SUhKgUOeYkgBFh\ndO8nyCoCOudsh+lFFvZ94TEbnJo61RcdiQ5B5VzIOScZkc97pIU+7VqGf8zEaeMx\nNcSi9QnX7M4tFBSueI2wf4CoukBQt5ZPHTqv7g+54QKBgQCrjaz4EGkmipIsVZl6\nCbN2nicm2Cdhi/khEUdLIabx58ZfXGa0zZzaPdRgLVFPuAx7CYb+VaReLe4jf/22\n8k96aU/4atAyl+cClkJux9Y+8U7gCuz3qfyl4bnS+OwSFVsuwIsTL/WS6HaxoLNk\nfaHuQ8WnD3cM4ucaHedm0ivB7g==\n-----END PRIVATE KEY-----\n",
  "client_email": "project-cafe-sheet-api@project-cafe-373712.iam.gserviceaccount.com",
  "client_id": "113001180826695936562",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/project-cafe-sheet-api%40project-cafe-373712.iam.gserviceaccount.com"
}
''';

  static final _spreadsheetId = "1-ICzhUxud4blXiv6tE09LArKXWyAGsOJqVGNxsmon_8";

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _menuSheet;
  static Worksheet? _orderSheet;
  static Worksheet? _orderdetailSheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _menuSheet = spreadsheet.worksheetByTitle('menu');
    _orderSheet = spreadsheet.worksheetByTitle('orders');
    _orderdetailSheet = spreadsheet.worksheetByTitle('orderdetail');
  }

  static Future<Worksheet> get menuSheet async {
    if (_menuSheet == null) {
      await init();
    }
    return _menuSheet!;
  }

  static Future<Worksheet> get orderSheet async {
    if (_orderSheet == null) {
      await init();
    }
    return _orderSheet!;
  }

  static Future<Worksheet> get orderdetailSheet async {
    if (_orderdetailSheet == null) {
      await init();
    }
    return _orderdetailSheet!;
  }
}
