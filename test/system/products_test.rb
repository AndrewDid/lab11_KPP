require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit products_path
  	 click_on "New Product"
  	 fill_in "Name", with: "Water"
  	 fill_in "Price", with: "5"
  	 fill_in "Unit", with: "l"
  	 click_on "Create"

     #find(".container").find("#container_products").find(".col-md-4 blog-main box text-center")
     #find(".btn btn-warning", :visible => false)
     sleep 3
     find(".btn-group", match: :first).click_on("Calculate")
     fill_in "count", with: "3"
     click_on "Calculate price"
     assert_text "Total price of Water for 3.0 l is $15.0"
   end
end
