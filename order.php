<script>
    $(document).ready(function() {
        $(".form-item").submit(function(e) {
            var form_data = $(this).serialize();
            var button_content = $(this).find('button[type=submit]');
            button_content.html('Adding...'); //Loading button text 

            $.ajax({//make ajax request to cart_process.php
                url: "cart_process.php",
                type: "POST",
                dataType: "json", //expect json value from server
                data: form_data
            }).done(function(data) { //on Ajax success
                $("#cart-info").html(data.items); //total items in cart-info element
                button_content.html('Add to Cart'); //reset button text to original text
                alert("Item added to Cart!"); //alert user
                if ($(".shopping-cart-box").css("display") === "block") { //if cart box is still visible
                    $(".cart-box").trigger("click"); //trigger click to update the cart box.
                }
            });
            e.preventDefault();
        });

        //Show Items in Cart
        $(".cart-box").click(function(e) { //when user clicks on cart box
            e.preventDefault();
            $(".shopping-cart-box").fadeIn(); //display cart box
            $("#shopping-cart-results").html('<img src="assets/images/ajax-loader.gif">'); //show loading image
            $("#shopping-cart-results").load("cart_process.php", {"load_cart": "1"}); //Make ajax request using jQuery Load() & update results
        });

        //Close Cart
        $(".close-shopping-cart-box").click(function(e) { //user click on cart box close link
            e.preventDefault();
            $(".shopping-cart-box").fadeOut(); //close cart-box
        });

        //Remove items from cart
        $("#shopping-cart-results").on('click', 'a.remove-item', function(e) {
            e.preventDefault();
            var pcode = $(this).attr("data-code"); //get product code
            $(this).parent().fadeOut(); //remove item element from box
            $.getJSON("cart_process.php", {"remove_code": pcode}, function(data) { //get Item count from Server
                $("#cart-info").html(data.items); //update Item count in cart-info
                $(".cart-box").trigger("click"); //trigger click on cart-box to update the items list
            });
        });

    });
</script>
<div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="#">Home</a>
            </li>

            <li class="active">Order Menu</li>
        </ul><!-- /.breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                Order Menu
            </h1>
        </div><!-- /.page-header -->
        <a href="#" class="cart-box" id="cart-info" title="View Cart">
            <?php
            if (isset($_SESSION["products"])) {
                echo count($_SESSION["products"]);
            } else {
                echo 0;
            }
            ?>
        </a>

        <div class="shopping-cart-box">
            <a href="#" class="close-shopping-cart-box" >Close</a>
            <h3>Your Shopping Cart</h3>
            <div id="shopping-cart-results">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <?php
                $results = $mysqli_conn->query("SELECT product_name, product_desc, product_code, product_image, product_price FROM products_list");
                $products_list = '<div class="row pricing-box">';

                while ($row = $results->fetch_assoc()) {
                    $products_list .= <<<EOT
                              <form class="form form-item">
                                <div class="col-xs-6 col-sm-3">
                                    <div class="widget-box widget-color-dark">
                                        <div class="widget-header">
                                            <h5 class="widget-title bigger lighter">{$row["product_name"]}</h5>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <ul class="list-unstyled spaced2">
                                                    <li class="center">
                                                        <img src="assets/images/{$row["product_image"]}">
                                                    </li>
                                                    <li>
                                                        <div class="item-box">
                                                           <div>
                                                            Qty : <input type="number" class="input-sm" max-leght="10" min-lenght="1" name="product_qty">
                                                           </div>
                                                        </li>
                                                    </li>
                                                        <input name="product_code" type="hidden" value="{$row["product_code"]}">                                                            
                                                </ul>

                                                <hr />
                                                <div class="price">                                                        
                                                  Price : {$currency} {$row["product_price"]}
                                                </div>
                                            </div>

                                            <div>
                                                <button type="submit" class="btn btn-block btn-warning">
                                                    <i class="ace-icon fa fa-shopping-cart bigger-110"></i>
                                                    <span>Buy</span>
                                                </button>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </form>       
EOT;
                }
                $products_list .= '</div>';

                echo $products_list;
                ?>
            </div>
        </div>
    </div>
</div>