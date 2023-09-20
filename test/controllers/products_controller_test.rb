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
    assert_select '.price', '300'
  end

  test 'render a new product form' do
  get new_product_path
    assert_response :success
    assert_select 'form'

    end
  test 'allow create a new product' do
    post products_path, params: { product: { title: 'Le Wagon Cap', description: 'Keep the sun out of your eyes', price: 25 } }
    assert_redirected_to products_path
  end
end
