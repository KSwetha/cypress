require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
include Devise::TestHelpers

  setup do
    collection_fixtures('query_cache', 'test_id')
    collection_fixtures('measures',"_id")
    collection_fixtures('products','_id','vendor_id')
    collection_fixtures('records', '_id','test_id')
    collection_fixtures('product_tests', '_id')
    collection_fixtures('patient_populations', '_id')
    collection_fixtures('test_executions', '_id')
    collection_fixtures2('patient_cache','value', '_id' ,'test_id', 'patient_id')
    
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.where({:first_name => 'bobby', :last_name => 'tables'}).first
    sign_in @user
  end
  
  test "index" do
    m1 = Measure.where(:hqmf_id => '0001').first
    m2 = Measure.where(:hqmf_id => '0348').first

    get :index, {:product_test_id =>'4f58f8de1d41c851eb000478' , :measure_id => m1._id}
    assert_response :success
    showAll  = assigns[:showAll]
    selected = assigns[:selected]
    assert showAll == false
    assert selected.id == m1.id
    
    #measure selected that wasnt in the test
    get :index, {:product_test_id =>'4f58f8de1d41c851eb000478' , :measure_id => m2._id}
    showAll  = assigns[:showAll]
    selected = assigns[:selected]
    result   = assigns[:result]
    assert showAll == false
    assert selected.id == m2.id
    assert result['measure_id'].to_s == m2.id.to_s
    assert result['numerator']   == '0'
    assert result['antinumerator'] == 0
    assert result['denominator'] == '0'
    assert result['exclusions']  == '0'


    get :index, {:product_test_id =>'4f58f8de1d41c851eb000478'}
    showAll  = assigns[:showAll]
    result   = assigns[:result]

    assert showAll == true
    assert result['measure_id']  == '-'
    assert result['numerator']   == '-'
    assert result['antinumerator'] == '-'
    assert result['denominator'] == '-'
    assert result['exclusions']  == '-'

    expected_result = {"measure_id" => m1['hqmf_id'],
      "effective_date" => 1293753600,
      "denominator" => 48,
      "numerator" => 44,
      "antinumerator" => 4,
      "exclusions" => 0 }
    QME::QualityReport.any_instance.stubs(:result).returns(expected_result)
    QME::QualityReport.any_instance.stubs(:calculated?).returns(true)

    get :index, {:measure_id => m1.id}
    result  = assigns[:result]
    showAll = assigns[:showAll]
    assert showAll == false
    assert result['measure_id'].to_s  == m1.id.to_s, '1'
    assert result['numerator']    == 44, "Measure Evaluator reported wrong result for a measure"
    assert result['denominator']  == 48, "Measure Evaluator reported wrong result for a measure"
    assert result['exclusions']   == 0 , "Measure Evaluator reported wrong result for a measure"
    assert result['antinumerator']== 4 , "Measure Evaluator reported wrong result for a measure"
  end

  test "show" do
    r1 = Record.find("4f5bb2ef1d41c841b3000046")
    get :show, {:id => r1.id}
    test = assigns[:test]
    product = assigns[:product]
    vendor  = assigns[:vendor]
    results = assigns[:results]

    assert_equal "4f58f8de1d41c851eb000478", test.id.to_s   
    assert_equal "4f57a88a1d41c851eb000004", product.id.to_s
    assert_equal  "4f57a8791d41c851eb000002", vendor.id.to_s
    assert_equal 7, results.count  , "Expected pateint cache results not == "

  end

  test "table_measure" do
    m1 = Measure.where(:hqmf_id => '0001').first
    m2 = Measure.where(:hqmf_id => '0002').first

    get :table_measure,{:measure_id => m1.id }
    assert assigns[:patients].count == 3

    get :table_measure,{:measure_id => m2.id }
    assert assigns[:patients].count == 2

    get :table_measure,{:product_test_id =>'4f58f8de1d41c851eb000478' , :measure_id => m1.id}
    assert assigns[:patients].count == 4

    get :table_measure,{:product_test_id =>'4f58f8de1d41c851eb000478' , :measure_id => m2.id}
    assert assigns[:patients].count == 3
  end

  test "table_all" do
    get :table_all,{}
    assert_equal 5, assigns[:patients].count

    get :table_all,{:product_test_id => '4f58f8de1d41c851eb000478'}
    assert assigns[:patients].count == 1
  end

  test "download" do
    r1 = Record.find("4f5bb2ef1d41c841b3000046")

    get :download,{:id => r1.id , :format => 'c32' }
    assert_response :success,"Failed to download C32 zip file"
    get :download,{:id => r1.id , :format => 'ccr' }
    assert_response :success,"Failed to download CCR zip file"
    get :download,{:id => r1.id , :format => 'html'}
    assert_response :success,"Failed to download HTML zip file"

    get :download,{:format => 'c32' }
    assert_response :success,"Failed to download Master Patient List C32 zip file"
    get :download,{:format => 'ccr' }
    assert_response :success,"Failed to download Master Patient List CCR zip file"
    get :download,{:format => 'html'}
    assert_response :success,"Failed to download Master Patient List HTML zip file"
  end

end
