<?php
include("config.php");

if (!isset($_SESSION["REMOTE_ADDR"])) {
    $_SESSION["REMOTE_ADDR"] = $_SERVER['REMOTE_ADDR'];
} else {
    
}
?>
<script type="text/javascript" language="javascript" src="jquery_1.5.2.js"></script>
<script type="text/javascript" language="javascript" src="vasplus_programming_blog_shopping_cart_v4.js"></script>
<link type="text/css" rel="stylesheet" media="all" href="vasplus_programming_blog_shopping_cart_v4.css" />

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
            <li class="active">Order</li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">

                <div class="row">
                    <!--<div class="col-xs-7 col-sm-12">-->
                    <div class="col-xs-6 pricing-box">
                        <!--<div class="row">-->
                        <?php
                        $dataPerPage = 4;
                        if (isset($_GET['page'])) {
                            $noPage = $_GET['page'];
                        } else {
                            $noPage = 1;
                        }

                        $offset = ($noPage - 1) * $dataPerPage;
                        $vpb_check_items = mysql_query("select * from `products` order by `id` desc LIMIT $offset, $dataPerPage");

                        if (mysql_num_rows($vpb_check_items) < 1) {
                            ?>
                            <div id="response" align="center">
                                <div id="vpb_shopping_cart_is_currently_empty" class="well" align="left">
                                    There are no items to display.
                                </div>
                            </div>
                            <?php
                        } else {
                            while ($vpb_get_items = mysql_fetch_array($vpb_check_items)) {
                                ?>
                                <div id="vasplus_programming_blog_shopping_cart_inner_left_wrapper" class="col-xs-5 col-sm-6 pricing-box">
                                    <div class="widget-box widget-color-dark">
                                        <div class="widget-header">
                                            <h5 class="widget-title bigger lighter"><?php echo strip_tags($vpb_get_items['name']); ?></h5>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <ul class="list-unstyled spaced2">
                                                    <li class="text-center">
                                                        <img src="<?php echo strip_tags($vpb_get_items['image']); ?>"  width="150" height="150"/>
                                                    </li>
<!--                                                    <li class="text-center">
                                                        <?php echo strip_tags($vpb_get_items['description']); ?>
                                                    </li>-->
                                                </ul>

                                                <hr />
                                                <div class="price">
                                                    Price: Rp <?php echo number_format(strip_tags($vpb_get_items['price'])); ?>
                                                </div>
                                            </div>

                                            <div>
                                                <a onclick="vpb_add_to_cart('<?php echo strip_tags($vpb_get_items['name']); ?>', '<?php echo strip_tags($vpb_get_items['price']); ?>', 'add');"  class="btn btn-block btn-primary">
                                                    <i class="ace-icon fa fa-shopping-cart bigger-110"></i>
                                                    <span>Add To Cart</span>
                                                </a>
                                                <!--<input type="button" value="Add to Cart" title="Add this item to cart" />-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            }
                        }
                        $query = "SELECT COUNT(*) AS jumData FROM products";
                        $hasil = mysql_query($query);
                        $data = mysql_fetch_array($hasil);

                        $jumData = $data['jumData'];
                        $jumPage = ceil($jumData / $dataPerPage);

                        $showPage = "";
                        echo "<br/><ul class='pagination middle'>";
                        if ($noPage > 1) {
                            echo "<li><a href='" . $_SERVER['PHP_SELF'] . "?m=o&page=" . ($noPage - 1) . "'><< Prev</a></li>";
                        }
                        for ($page = 1; $page <= $jumPage; $page++) {
                            if ((($page >= $noPage - 3) && ($page <= $noPage + 3)) || ($page == 1) || ($page == $jumPage)) {
                                if (($showPage == 1) && ($page != 2)) {
                                    echo "<li class='disabled'><a href='#'>...</a></li>";
                                }
                                if (($showPage != ($jumPage - 1)) && ($page == $jumPage)) {
                                    echo "<li class='disabled'><a href='#'>...</a></li>";
                                }
                                if ($page == $noPage) {
                                    echo "<li class='active'><a href='#'>" . $page . "</a></li>";
                                } else {
                                    echo "<li><a href='" . $_SERVER['PHP_SELF'] . "?m=o&page=" . $page . "'>" . $page . "</a></li>";
                                }
                                $showPage = $page;
                            }
                        }

                        if ($noPage < $jumPage) {
                            echo "<li><a href='" . $_SERVER['PHP_SELF'] . "?m=o&page=" . ($noPage + 1) . "'>Next >></a></li>";
                        }

                        echo "</ul>";
                        ?>
                        <!--</div>-->
                    </div>


                    <div class="col-xs-6">
                        <div id="vasplus_programming_blog_shopping_cart_right_wrapper">
                            <h2 class="shopping_cart_status">Shopping Cart Status</h2>
                            <div class="checkout_user_info" style="display:none;">
                                <div id="vasplus_programming_blog_cart_titles" style="float:left; width:340px;">Success</div>
                                <div>
                                    <input type="hidden" class="vpb_final_total_field" id="cartItemsTotals" disabled="disabled" readonly="readonly" value="" />
                                </div>
                            </div>

                            <div id="checkout_user_info" style="display:none;">
                            </div>
                            <div id="shopping_cart_status">
                                <?php
                                $vpb_check_all_items = mysql_query("select * from `products_added` where `username` = '" . mysql_real_escape_string($_SESSION["REMOTE_ADDR"]) . "' order by `id` asc");
                                if (mysql_num_rows($vpb_check_all_items) < 1) {
                                    ?>
                                    <div id="response" align="center">
                                        <div id="vpb_shopping_cart_is_currently_empty" class="well" align="left">
                                            Your shopping cart is empty
                                        </div></div>
                                    <?php
                                } else {
                                    $vpb_check_itemsTotal = mysql_query("select sum(amount) as `items_total` from `products_added` where `username` = '" . mysql_real_escape_string($_SESSION["REMOTE_ADDR"]) . "'");
                                    $vpb_get_itemsTotal = mysql_fetch_array($vpb_check_itemsTotal);
                                    $groundtotal = ($vpb_get_itemsTotal["items_total"]); //Get total of all added items
                                    ?>
                                    <div id="response" align="center" style="float:left;">
                                        <div id="vpb_item_numbers" class="vpb_all_tops">No</div>
                                        <div id="vpb_item_namess" class="vpb_all_tops" align="left">Item Name</div>
                                        <div id="vpb_item_prices" class="vpb_all_tops">Price</div>
                                        <div id="vpb_item_quantities" class="vpb_all_tops">Qty</div>
                                        <div id="vpb_item_amounts" class="vpb_all_tops">Amount</div>
                                        <div id="vpb_item_actions" class="vpb_all_tops">Action</div><br clear="all" />
                                        <?php
                                        $number_of_items = 1;
                                        while ($vpb_get_all_items = mysql_fetch_array($vpb_check_all_items)) {
                                            $item_id = strip_tags($vpb_get_all_items["id"]);
                                            $item_name = strip_tags($vpb_get_all_items["item_added"]);
                                            $price = strip_tags($vpb_get_all_items["price"]);
                                            $quantity = strip_tags($vpb_get_all_items["quantity"]);
                                            $amount = strip_tags($vpb_get_all_items["amount"]);
                                            $date = strip_tags($vpb_get_all_items["date"]);
                                            ?>
                                            <div id="items_cover<?php echo $item_id; ?>" style="">
                                                <div id="vpb_item_numbers" style="border-top:0px solid #FFF;"><?php echo $number_of_items++; ?></div>
                                                <div id="vpb_item_namess" style="border-top:0px solid #FFF;" align="left"><?php echo $item_name; ?></div>
                                                <div id="vpb_item_prices" style="border-top:0px solid #FFF;">Rp <?php echo number_format($price); ?></div>
                                                <div id="vpb_item_quantities" style="border-top:0px solid #FFF;"><?php echo $quantity; ?></div>
                                                <div id="vpb_item_amounts" style="border-top:0px solid #FFF;">Rp <?php echo number_format($amount); ?></div>
                                                <div id="vpb_item_actions" style="padding-bottom:9px; padding-top:9px;border-top:0px solid #FFF;"><a href="javascript:void(0);" style="width:10px; height:10px; padding:3px;padding-left:8px;padding-right:8px; text-decoration:none;" id="vpb_cart_buttons" title="Remove this item" onclick="vpb_remove_this_item('<?php echo $item_id; ?>');">X</a></div>
                                                <br clear="all" /></div>
                                            <?php
                                        }
                                        ?>
                                        <div style="border:1px solid #E2E2E2;border:0px solid #FFF;width:495px;margin-top:25px;">
                                            <div style="width:295px;float:left; padding-top:1px; font-weight:bold;" align="left">
                                                <input type="hidden" class="vpb_total_field" disabled="disabled" id="new_sum" value="Items Total: $<?php echo $groundtotal; ?>" />
                                                Items Total: Rp <?php echo number_format($groundtotal); ?>
                                            </div>
                                            <div style="width:100px;float:left;" align="right"><input type="button" value="Clear Cart" title="Clear entire cart items" id="vpb_cart_buttons" onclick="vpb_clear_cart('<?php echo $_SESSION["REMOTE_ADDR"]; ?>');" /></div>
                                            <input type="hidden" id="vpb_main_total_cart_items" value="<?php echo $groundtotal; ?>" />
                                            <div style="width:100px;float:left;" align="right"><input type="button" value="Checkout" title="Check out to make payment" id="vasplus_p_blog_add_to_cart_button" onclick="vpb_checkout();" /></div>
                                        </div><br clear="all" />
                                        <?php
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                </div>
            </div><!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div>