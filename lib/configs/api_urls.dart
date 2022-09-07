
const String baseUrl="https://pos.impliessolutions.com/api/";
const String loginUrl=baseUrl + "Authenticate/login";
const String getCatUrl=baseUrl+ "ItemType/getList";
const String getLevelUrl=baseUrl+ "Level/getList";
const String getSereiesUrl=baseUrl+"Series/getList";
const String getItemsUrl=baseUrl+"Item/getList";
const String saveOrderUrl=baseUrl+"Order/save";
const String orderListUrl=baseUrl + "Order/getList";
const String getDealerHistoryUrl=baseUrl + "Order/getDealerOrderList";
const String orderLogUrl=baseUrl + "Order/getOrderLogs";
const String orderGetDetails=baseUrl + "Order/get";
const String cashBookUrl=baseUrl + "Voucher/getDealerStatement";

// Urls For Rider


const String riderApprovedOrdersurl=baseUrl + "Order/getApprovedOrdersListForRider";
const String riderHistoryOrdersurl=baseUrl + "Order/getApprovedOrdersHistoryListForRider";
const String deliveredOrderUrl=baseUrl + "Order/orderIsDelivered";