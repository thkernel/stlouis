$(document).on('turbolinks:load', function(){

    $("#order-items").on('change', 'select', function(event) {
              
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[4];
        var field = array[5];
        console.log("Object ID: ",object_id );
        console.log("FIELD: ", field );
        var customer_id = $("#order_customer_id").val();

        console.log("ORDER CUSTOM: ", customer_id);
       

        if (field == "product"){
            $.ajax({
                type: "GET",
                headers: {
                        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                        },
                dataType: 'json',
                url: "product",
                data: { data: target_value},     
                success: function(response) {
                    var _price = response.data.unit_price;
                    var price = "order_order_items_attributes_" + object_id + "_price";
                    $("#"+price).val(_price);
                }
            });
        }else{
            $.ajax({
                type: "GET",
                headers: {
                        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                        },
                dataType: 'json',
                url: "food",
                data: { data: target_value, customer_id: customer_id },     
                success: function(response) {
                    
                    var _discount_amount = null;
                    var _price = null;

                    if (response.customer_discount){

                        _discount_amount = response.customer_discount.amount;
                    }
                    
                    if (response.data !== null){
                        _price = response.data.price;
                    }
                    

                    if (response.customer_discount !== null){
                        if (_price >= _discount_amount){
                            //_price = _price - _discount_amount;
                            //_price = 1500;
                            _price = _discount_amount;
                        }
                    }



                    var price = "order_order_items_attributes_" + object_id + "_price";
                    
                    $("#"+price).val(_price);
                }
            });
        }
        
        
    });


    $("#order-items").on('change', "input", function(event) {
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[4];
        console.log("Object ID: ",object_id );

        // calcul
        var discount = $("#order_order_items_attributes_" + object_id + "_discount").val();
        var price = $("#order_order_items_attributes_" + object_id + "_price").val();
        var amount = "order_order_items_attributes_" + object_id + "_amount";
     
        //var total_amount = (parseFloat((price )  * parseFloat(target_value)).toFixed(2)) - parseFloat(discount);
        var total_amount = parseFloat((price )  * parseFloat(target_value)) - parseFloat(discount);
        $("#"+amount).val(total_amount);
    });

    $("#order-items").on('change', "input", function(event) {
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[4];
        console.log("Object ID: ",object_id );

        // calcul
       
        var price = $("#order_order_items_attributes_" + object_id + "_price").val();
        var amount = "order_order_items_attributes_" + object_id + "_amount";
     
        var total_amount = parseFloat((price )  * parseFloat(target_value)).toFixed(2);
        $("#"+amount).val(total_amount);
    });


    // For Order item drinks

    $("#order-item-drinks").on('change', 'select', function(event) {
              
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[5];
        var field = array[6];
        console.log("Object ID: ",object_id );
        console.log("FIELD: ", field );
       

        if (field == "product"){
            $.ajax({
                type: "GET",
                headers: {
                        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                        },
                dataType: 'json',
                url: "product",
                data: { data: target_value},     
                success: function(response) {
                    var _price = response.data.unit_price;
                    var price = "order_order_item_drinks_attributes_" + object_id + "_unit_price";
                    $("#"+price).val(_price);
                }
            });
        }else{
            $.ajax({
                type: "GET",
                headers: {
                        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                        },
                dataType: 'json',
                url: "food",
                data: { data: target_value},     
                success: function(response) {
                    var _price = response.data.price;
                    var price = "order_order_items_attributes_" + object_id + "_price";
                    $("#"+price).val(_price);
                }
            });
        }
        
    });

    $("#order-item-drinks").on('change', "input", function(event) {
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[5];
        console.log("Object ID: ",object_id );

        // calcul
        var price = $("#order_order_item_drinks_attributes_" + object_id + "_unit_price").val();
        var amount = "order_order_item_drinks_attributes_" + object_id + "_amount";
     
        var total_amount = parseFloat((price )  * parseFloat(target_value)).toFixed(2);
        $("#"+amount).val(total_amount);
    });


    // On dependent Selection change
    $(".customer_id").on('change', 'select', function(event) {
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[4];
        var field = array[5];
        console.log("Object ID: ",object_id );
        console.log("FIELD: ", field );
        var customer_id = $("#order_customer_id").val();

        console.log("ORDER CUSTOM: ", customer_id);

        if (customer_id != null && customer_id != ""){
            $.ajax({
                type: "GET",
                headers: {
                        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                        },
                dataType: 'json',
                url: "solde",
                data: { data: target_value},  
                success: function(response) {
                    
                    var _solde = null;
                    
                    console.log("RESPONSE: ", response);
                    if (response.fidelity_card){

                        _solde = response.fidelity_card.balance;
                        
                        $(".customer-fidelity-card-solde").text("Solde de carte de fidélité: " + _solde);
                        $(".customer-fidelity-card-solde").css("display", "block");
                        
                        
                    }
                    else{
                         $(".customer-fidelity-card-solde").css("display", "none");
                        
                    } 
                }
            });

        }
        else{

            $(".customer-fidelity-card-solde").css("display", "none");
        }

    })


    
});

//order_order_items_attributes_1642339613677_food_id