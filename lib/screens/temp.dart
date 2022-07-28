// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(item.name!),
// SizedBox(
// width: MediaQuery.of(context).size.width * 0.01,
// ),
// Text("${item.unitDiscountPercentage}"),
// SizedBox(
// width: MediaQuery.of(context).size.width * 0.02,
// ),
// Text("${item.unitPrice}"),
// SizedBox(
// width: MediaQuery.of(context).size.width * 0.04,
// ),
// Container(
// height: 15,
// width: 30,
// child: TextField(
// onChanged: onCange,
// controller: qtyController,
// keyboardType: TextInputType.numberWithOptions(),
//
// // maxLines: 1,
// // maxLength: 4,
// textInputAction: TextInputAction.done,
// obscureText: false,
// // controller: qtyController[index],
// decoration: InputDecoration(hintText: "0",
// border: InputBorder.none,),
// ),
// ),
// SizedBox(
// width: MediaQuery.of(context).size.width * 0.02,
// ),
// Text(totalPrice!),
// // Expanded(child: Text("12")),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Align(
// alignment: Alignment.bottomRight,
// child: IconButton(
// icon: Icon(Icons.shopping_cart,color: bgColor,),
// onPressed: (){
// print("need to add in cart");
// },
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Total Price"),
// Text(totalPrice!),
// ],
// )
//
// ],
// ),
// Row(
// children: [
// Expanded(
// child: Divider(
// thickness: 1,
// color: Colors.black,
// )),
//
// ],
// ),