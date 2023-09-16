require 'test_helper'
class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path
    assert_response :success
    assert_select '.product'

  end
  test 'render a detailed product page' do
    get product_path(products(:Cinnamon))
    assert_response :success
    assert_select '.title', 'Cinnamon Roll Lamp'
    assert_select '.description', 'Moon led lamp'
    assert_select '.price', 300
  end
end
