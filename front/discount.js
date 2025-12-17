//Discount Library

const DiscountLib = {

    calculate: function(cartItems) {
        let subtotal = 0;
        let totalQuantity = 0;

        // get total price, quantity
        cartItems.forEach(item => {
            const price = parseFloat(item.price);
            const quantity = parseInt(item.quantity);
            
            subtotal += price * quantity;
            totalQuantity += quantity;
        });

        // check condition for discount
        let discountAmount = 0;
        let discountType = "No Discount";

         // buy 3+ 10% discount
        if (totalQuantity >= 3) {
            discountAmount = subtotal * 0.10;
            discountType = "Discount (10%)";
        }

        // result
        return {
            subtotal: subtotal,
            discountAmount: discountAmount,
            finalTotal: subtotal - discountAmount,
            discountType: discountType
        };
    }
};