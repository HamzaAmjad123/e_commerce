
const String baseUrl="https://pos.impliessolutions.com/api/";
const String loginUrl=baseUrl + "Authenticate/login";
const String getCatUrl=baseUrl+ "ItemType/getList";
const String getWareHouseUrl=baseUrl+ "WareHouse/getListByActiveUser";
const String getShipmentUrl=baseUrl + "Cargo/getShipmentsByWarehouse";
const String getLevelUrl=baseUrl+ "Level/getList";
const String getSereiesUrl=baseUrl+"Series/getList";
const String getClassesUrl=baseUrl + "Level/getList";
const String getItemsUrl=baseUrl+"Item/getList";
const String saveOrderUrl=baseUrl+"Order/save";
const String orderListUrl=baseUrl + "Order/getList";
const String getDealerHistoryUrl=baseUrl + "Order/getDealerOrderList";
const String orderLogUrl=baseUrl + "Order/getOrderLogs";
const String getOrerDetailsUrl=baseUrl + "Order/get";
const String cashBookUrl=baseUrl + "Voucher/getDealerStatement";
const String sendPaymentUrl=baseUrl + "Voucher/createVoucherLineByDealer";
const  String dashboardUrl=baseUrl + "Dashboard/GetDataDashboard?";
const String approvedOrderUrl=baseUrl+"Order/getDealerHistoryList";
const String createObjUrl=baseUrl+"orderobjection/create";
const String selectAmountUrl=baseUrl + "PaymentMethod/getList";


// Urls For Rider
const String riderApprovedOrdersurl=baseUrl + "Order/getApprovedOrdersListForRider";
const String riderHistoryOrdersurl=baseUrl + "Order/getApprovedOrdersHistoryListForRider";
const String deliveredOrderUrl=baseUrl + "Order/orderIsShipped";