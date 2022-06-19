import 'data_type.dart';
import 'field_constants.dart';
import 'name_constants.dart';

class Queries {
  // //create item table
  // static const CREATE_ITEM_CATEGORY_TABLE = '''
  // CREATE TABLE ${NameConstants.ITEM_CATEGORY_TABLE}(
  // ${FieldConstants.id} ${DataType.primaryId},
  // ${FieldConstants.name} ${DataType.textType}
  // )
  // ''';
  //
  //llllllllllllll
  // static const CREATE_CUISINE_TABLE = '''
  // CREATE TABLE ${NameConstants.SAVING_TABLE}(
  // ${FieldConstants.id} ${DataType.textType},
  // ${FieldConstants.savingTitle} ${DataType.textType},
  // ${FieldConstants.savingSubTitle} ${DataType.textType},
  // ${FieldConstants.totalBalance} ${DataType.integerType},
  // ${FieldConstants.totalBalanceIn} ${DataType.integerType},
  // ${FieldConstants.totalBalanceOout} ${DataType.integerType},
  // ${FieldConstants.cashInOut} ${DataType.textType}
  // )
  // ''';


  static const CREATE_CUISINE_TABLE = '''
   CREATE TABLE ${NameConstants.SAVING_TABLE} (
   ${FieldConstants.createdTimeStamp} ${DataType.textType} NOT NULL UNIQUE,
   ${FieldConstants.data} ${DataType.textType}
   )
  ''';
//
// static const CREATE_MENU_ITEM_TABLE = '''
// CREATE TABLE ${NameConstants.MENU_ITEM_TABLE}(
// ${FieldConstants.id} ${DataType.textType},
// ${FieldConstants.itemId} ${DataType.textType},
// ${FieldConstants.description} ${DataType.textType},
// ${FieldConstants.name} ${DataType.textType},
// ${FieldConstants.imageUrl} ${DataType.textType},
// ${FieldConstants.cuisineCategory} ${DataType.textType},
// ${FieldConstants.itemCategory} ${DataType.textType},
// ${FieldConstants.itemType} ${DataType.textType},
// ${FieldConstants.price} ${DataType.doubleType},
// ${FieldConstants.taxPerItem} ${DataType.textType},
// ${FieldConstants.vendorId} ${DataType.textType},
// ${FieldConstants.foodCourtID} ${DataType.textType},
// ${FieldConstants.siteId} ${DataType.textType},
// ${FieldConstants.vendorName} ${DataType.textType},
// ${FieldConstants.itemStatus} ${DataType.textType},
// ${FieldConstants.rating} ${DataType.doubleType},
// ${FieldConstants.createdTime} ${DataType.textType},
// ${FieldConstants.updatedTime} ${DataType.textType},
// ${FieldConstants.active} ${DataType.integerType},
// ${FieldConstants.mrpItem} ${DataType.integerType},
// ${FieldConstants.quickBite} ${DataType.integerType},
// ${FieldConstants.trending} ${DataType.integerType},
// ${FieldConstants.quantity} ${DataType.integerType}
// )
// ''';
//
// static const String CREATE_VENDOR_TABLE = 'CREATE TABLE '
//     '${NameConstants.VENDOR_TABLE}'
//     '('
//     '${FieldConstants.id} ${DataType.textType},'
//     '${FieldConstants.vendorId} TEXT,'
//     '${FieldConstants.foodCourtID} TEXT,'
//     '${FieldConstants.imageUrl} TEXT,'
//     '${FieldConstants.brandName} TEXT,'
//     '${FieldConstants.vendorName} TEXT,'
//     '${FieldConstants.foodCourtName} TEXT,'
//     '${FieldConstants.startTime} TEXT,'
//     '${FieldConstants.endTime} TEXT,'
//     //'${FieldConstants.picture} BLOB,'
//     '${FieldConstants.extendedTime} TEXT,'
//     '${FieldConstants.manuallyExtendedTime} INTEGER,'
//     '${FieldConstants.active} INTEGER'
//     ')';
//
// static const CREATE_DISCOUNT_TABLE = '''
// CREATE TABLE ${NameConstants.DISCOUNT_TABLE}(
// ${FieldConstants.discountID} ${DataType.textType},
// ${FieldConstants.discountName} ${DataType.textType},
// ${FieldConstants.discountDescription} ${DataType.textType},
// ${FieldConstants.vendorId} ${DataType.textType},
// ${FieldConstants.vendorName} ${DataType.textType},
// ${FieldConstants.imageUrl} ${DataType.textType}
// )
// ''';
//
// //create order query
// static const CREATE_TABLE_ORDER = '''
//  CREATE TABLE ${NameConstants.ORDER_TABLE} (
//  ${FieldConstants.createdTimeStamp} ${DataType.textType} NOT NULL UNIQUE,
//  ${FieldConstants.orderId} ${DataType.textType},
//  ${FieldConstants.data} ${DataType.textType}
//  )
// ''';
//
// static const CREATE_TABLE_ORDER_LOCAL = '''
//  CREATE TABLE ${NameConstants.ORDER_TABLE_LOCAL} (
//  ${FieldConstants.createdTimeStamp} ${DataType.textType} NOT NULL UNIQUE,
//    ${FieldConstants.orderId} ${DataType.textType},
//  ${FieldConstants.data} ${DataType.textType}
//  )
// ''';
// static const CREATE_TABLE_PRINTERS = '''
//  CREATE TABLE ${NameConstants.PRINTERS_TABLE} (
//  ${FieldConstants.id} ${DataType.textType} NOT NULL UNIQUE,
//  ${FieldConstants.data} ${DataType.textType}
//  )
// ''';
//
// static const CREATE_TABLE_ORDER_ON_HOLD = '''
// CREATE TABLE ${NameConstants.ORDER_ON_HOLD} (
//   ${FieldConstants.orderId} ${DataType.textType} NOT NULL UNIQUE,
//   ${FieldConstants.customerName} ${DataType.textType},
//   ${FieldConstants.contactNumber} ${DataType.textType},
//   ${FieldConstants.date} ${DataType.textType},
//   ${FieldConstants.totalSale} ${DataType.doubleType},
//   ${FieldConstants.orderOnHoldReason} ${DataType.textType},
//   ${FieldConstants.email} ${DataType.textType}
// )
// ''';
//
// static const CREATE_TABLE_HELD_ITEMS = '''
// CREATE TABLE ${NameConstants.HELD_ITEMS} (
//  ${FieldConstants.id} ${DataType.textType},
// ${FieldConstants.itemId} ${DataType.textType},
// ${FieldConstants.description} ${DataType.textType},
// ${FieldConstants.name} ${DataType.textType},
// ${FieldConstants.imageUrl} ${DataType.textType},
// ${FieldConstants.cuisineCategory} ${DataType.textType},
// ${FieldConstants.itemCategory} ${DataType.textType},
// ${FieldConstants.itemType} ${DataType.textType},
// ${FieldConstants.price} ${DataType.doubleType},
// ${FieldConstants.taxPerItem} ${DataType.textType},
// ${FieldConstants.vendorId} ${DataType.textType},
// ${FieldConstants.foodCourtID} ${DataType.textType},
// ${FieldConstants.siteId} ${DataType.textType},
// ${FieldConstants.vendorName} ${DataType.textType},
// ${FieldConstants.itemStatus} ${DataType.textType},
// ${FieldConstants.rating} ${DataType.doubleType},
// ${FieldConstants.createdTime} ${DataType.textType},
// ${FieldConstants.updatedTime} ${DataType.textType},
// ${FieldConstants.active} ${DataType.integerType},
// ${FieldConstants.mrpItem} ${DataType.integerType},
// ${FieldConstants.quickBite} ${DataType.integerType},
// ${FieldConstants.trending} ${DataType.integerType},
// ${FieldConstants.quantity} ${DataType.integerType},
// ${FieldConstants.orderId} ${DataType.textType}
// )
// ''';
//
// // ${FieldConstants.deliveryAvailable} ${DataType.integerType},
// // ${FieldConstants.email} ${DataType.textType},
// // ${FieldConstants.foodCourtId} ${DataType.textType},
// // ${FieldConstants.mobile} ${DataType.textType},
// // ${FieldConstants.modeOfPayment} ${DataType.textType},
// // ${FieldConstants.orderNote} ${DataType.textType},
// // ${FieldConstants.staffId} ${DataType.textType}
// // ${FieldConstants.updateTimeStamp} ${DataType.textType}
// // ${FieldConstants.userId} ${DataType.textType}
// // ${FieldConstants.userName} ${DataType.textType}
// // ${FieldConstants.reason} ${DataType.textType}
//
// //create table query
// static const CREATE_CART_TABLE = '''
// CREATE TABLE ${NameConstants.CART_TABLE}(
// ${FieldConstants.id} ${DataType.textType},
// ${FieldConstants.itemId} ${DataType.textType},
// ${FieldConstants.description} ${DataType.textType},
// ${FieldConstants.name} ${DataType.textType},
// ${FieldConstants.imageUrl} ${DataType.textType},
// ${FieldConstants.cuisineCategory} ${DataType.textType},
// ${FieldConstants.itemCategory} ${DataType.textType},
// ${FieldConstants.itemType} ${DataType.textType},
// ${FieldConstants.price} ${DataType.doubleType},
// ${FieldConstants.taxPerItem} ${DataType.textType},
// ${FieldConstants.vendorId} ${DataType.textType},
// ${FieldConstants.foodCourtID} ${DataType.textType},
// ${FieldConstants.siteId} ${DataType.textType},
// ${FieldConstants.vendorName} ${DataType.textType},
// ${FieldConstants.itemStatus} ${DataType.textType},
// ${FieldConstants.rating} ${DataType.doubleType},
// ${FieldConstants.createdTime} ${DataType.textType},
// ${FieldConstants.updatedTime} ${DataType.textType},
// ${FieldConstants.active} ${DataType.integerType},
// ${FieldConstants.mrpItem} ${DataType.integerType},
// ${FieldConstants.quickBite} ${DataType.integerType},
// ${FieldConstants.trending} ${DataType.integerType},
// ${FieldConstants.quantity} ${DataType.integerType}
// )
// ''';
//
// //create customer table
// static const CREATE_TABLE_CUSTOMER = '''
// CREATE TABLE ${NameConstants.CUSTOMER_TABLE} (
//  ${FieldConstants.id} ${DataType.primaryId},
//  ${FieldConstants.name} ${DataType.textType},
//  ${FieldConstants.contactNumber} ${DataType.textType},
//  ${FieldConstants.email} ${DataType.textType},
//  ${FieldConstants.istharaPoint} ${DataType.doubleType},
//  ${FieldConstants.syncStatus} ${DataType.integerType}
// )
// ''';
//
// //create customer table
// static const CREATE_TABLE_USER = '''
// CREATE TABLE ${NameConstants.USER_TABLE} (
// ${FieldConstants.id} ${DataType.primaryId},
//  ${FieldConstants.name} ${DataType.textType},
//  ${FieldConstants.contactNumber} ${DataType.textType},
//  ${FieldConstants.email} ${DataType.textType}
// )
// ''';
//
// static const CREATE_MEAL_CATEGORY_TABLE = '''
// CREATE TABLE ${NameConstants.MEAL_CATEGORY_TABLE} (
// ${FieldConstants.mealCategory} ${DataType.textType},
// ${FieldConstants.itemId} ${DataType.textType}
// )
// ''';
//
// // create order table
// static const CREATE_TABLE_ORDERHISTORY = '''
//   CREATE TABLE ${NameConstants.ORDER_HISTORY_TABLE}(
//   ${FieldConstants.id} ${DataType.textType} NOT NULL UNIQUE,
//   ${FieldConstants.data} ${DataType.textType}
//       )
// ''';
// // create kothirtoy table
// static const CREATE_TABLE_KOTHISTORY = '''
//   CREATE TABLE ${NameConstants.KOT_HISTORY_TABLE}(
//   ${FieldConstants.foodCourtId} ${DataType.textType} NOT NULL UNIQUE,
//   ${FieldConstants.data} ${DataType.textType}
//       )
// ''';
//
// //create Cashier query
// static const CREATE_TABLE_CASHIER = '''
//  CREATE TABLE ${NameConstants.CASHIER_TABLE} (
//  ${FieldConstants.data} ${DataType.textType}
//  )
// ''';
//
// //create Open Cash query
// static const CREATE_TABLE_OPEN_CASH = '''
//  CREATE TABLE ${NameConstants.OPEN_CASH_TABLE} (
//  ${FieldConstants.data} ${DataType.textType}
//  )
// ''';
//
// static const CREATE_DEVICE_CONFIG = '''
// CREATE TABLE ${NameConstants.DEVICE_CONFIG} (
//   ${FieldConstants.createdTimeStamp} ${DataType.textType},
//   ${FieldConstants.deviceId} ${DataType.textType},
//   ${FieldConstants.deviceName} ${DataType.textType},
//   ${FieldConstants.foodCourtId} ${DataType.textType},
//   ${FieldConstants.foodCourtName} ${DataType.textType},
//   ${FieldConstants.imeiNum} ${DataType.textType},
//   ${FieldConstants.siteId} ${DataType.textType},
//   ${FieldConstants.siteName} ${DataType.textType}
// )
// ''';
//
// static const CREATE_TABLE_DAY_END_DATA = '''
// CREATE TABLE ${NameConstants.DAY_END_DATA_TABLE} (
//   ${FieldConstants.createdTimeStamp} ${DataType.textType} NOT NULL UNIQUE,
//   ${FieldConstants.data} ${DataType.textType}
// )
// ''';
//
// static const CREATE_TABLE_HANDOVER_LIST = '''
// CREATE TABLE ${NameConstants.HAND_OVER_LIST} (
// ${FieldConstants.handOverAmount} ${DataType.doubleType},
// ${FieldConstants.id} ${DataType.textType},
// ${FieldConstants.name} ${DataType.textType}
// )
// ''';
//
// static const CREATE_TABLE_OPEN_DENOMINATION = '''
// CREATE TABLE ${NameConstants.OPENING_CASH_DENOMINATION} (
// ${FieldConstants.staffId} ${DataType.textType},
// ${FieldConstants.staffName} ${DataType.textType},
// ${FieldConstants.foodCourtId} ${DataType.textType},
// ${FieldConstants.handOvered} ${DataType.integerType},
// ${FieldConstants.totalDenomination} ${DataType.doubleType}
// )
// ''';
//
// static const CREATE_TABLE_CASH_DATA = '''
// CREATE TABLE ${NameConstants.CASH_DATA} (
//  ${FieldConstants.staffId} ${DataType.textType},
//  ${FieldConstants.cashLabel} ${DataType.integerType},
//  ${FieldConstants.cashLabelCount} ${DataType.integerType}
// )
// ''';
}
