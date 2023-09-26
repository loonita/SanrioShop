require 'test_helper'
class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path
    assert_response :success
    assert_select '.product', 3
    assert_select '.category', 2

  end
  test 'render a list of products filtered by category' do
    get products_path(category_id: categories(:cute).id)
    assert_response :success
    assert_select '.product', 3
  end
  test 'render a list of products filtered by min_price and max_price' do
    get products_path(min_price: 160, max_price: 300)
    assert_response :success
    assert_select '.product', 2
    assert_select 'h2', 'My Melody Plush'
  end
  test 'render a list of products filtered by query_text' do
    get products_path(query_text: 'lamp')
    assert_response :success
    assert_select '.product', 1
    assert_select 'h2', 'Cinnamon Roll Lamp'
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
    post products_path, params: {
      product: {
        title: 'kuromi plush',
        description: 'bonito',
        price: 25 ,
        category_id: categories(:cute).id
      }
    }
    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product successfully created'
  end
  test 'does not allow create a new product with empty fields' do
    post products_path, params: { product: { title: '', description: 'ffdgdg', price: 30 } }
    assert_response :unprocessable_entity
  end
  test 'render an edit product form' do
    get edit_product_path(products(:Cinnamon))
    assert_response :success
    assert_select 'form'

  end
  test 'allow to update a product' do
    patch product_path(products(:Cinnamon)), params: { product: { price: 450 } }
    assert_redirected_to products_path

    assert_equal flash[:notice], 'Product successfully updated'
  end
  test 'can delete products' do
    assert_difference('Product.count', -1) do
    delete product_path(products(:Cinnamon))
    end
    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product successfully deleted'
  end
end





