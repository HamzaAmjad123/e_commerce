const String baseUrl="https://pos.impliessolutions.com/";
// const String baseUrl="https://cantabdealersautomation.com/";
//dsmkchsdfsejdlfkjsdjfsdfmfjsdk
const String loginUrl=baseUrl + "api/Authenticate/login";
const String getCatUrl=baseUrl+ "api/ItemType/getList";
const String getWareHouseUrl=baseUrl+ "api/WareHouse/getListByActiveUser";
const String getShipmentUrl=baseUrl + "api/Cargo/getShipmentsByWarehouse";
const String getLevelUrl=baseUrl+ "api/Level/getList";
const String getSereiesUrl=baseUrl+"api/Series/getList";
const String getClassesUrl=baseUrl + "api/Level/getList";
const String getItemsUrl=baseUrl+"api/Item/getList";
const String saveOrderUrl=baseUrl+"api/DealerOrders/saveDealerOrder";
const String orderListUrl=baseUrl + "api/Order/getList";
const String orderLogUrl=baseUrl + "api/Order/getOrderLogs";
const String getOrerDetailsUrl=baseUrl + "api/Order/get";
const String cashBookUrl=baseUrl + "api/Voucher/getDealerStatement";
const String sendPaymentUrl=baseUrl + "api/Voucher/createVoucherLineByDealer";
const  String dashboardUrl=baseUrl + "api/dashboard/dealersdatafordashboard";
const String approvedOrderUrl=baseUrl+"api/DealerOrders/getDealerHistoryList";
const String getDealerHistoryUrl=baseUrl + "api/DealerOrders/getDealerOrderList";
const String createObjUrl=baseUrl+"api/orderobjection/create";
const String selectAmountUrl=baseUrl + "api/PaymentMethod/getList";
const String markAsDeliveredUrl=baseUrl+ "api/DealerOrders/orderIsApprovedByDealer";
// Urls For Rider
const String riderApprovedOrdersurl=baseUrl + "api/RiderOrders/getApprovedOrdersListForRider";
const String riderHistoryOrdersurl=baseUrl + "api/RiderOrders/getApprovedOrdersHistoryListForRider";
const String deliveredOrderUrl=baseUrl + "api/RiderOrders/orderIsShipped";