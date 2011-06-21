require 'helper'

class TestAr2json < MiniTest::Unit::TestCase
  def test_scoped_to_json
    x = User.scoped
    expected_result = "[{:name=>\"foo1\",:id=>\"1\"},{:name=>\"foo2\",:id=>\"2\"},{:name=>\"foo3\",:id=>\"3\"},{:name=>\"foo4\",:id=>\"4\"},{:name=>\"foo5\",:id=>\"5\"},{:name=>\"foo6\",:id=>\"6\"},{:name=>\"foo7\",:id=>\"7\"},{:name=>\"foo8\",:id=>\"8\"},{:name=>\"foo9\",:id=>\"9\"},{:name=>\"foo10\",:id=>\"10\"},{:name=>\"foo11\",:id=>\"11\"},{:name=>\"foo12\",:id=>\"12\"},{:name=>\"foo13\",:id=>\"13\"},{:name=>\"foo14\",:id=>\"14\"},{:name=>\"foo15\",:id=>\"15\"},{:name=>\"foo16\",:id=>\"16\"},{:name=>\"foo17\",:id=>\"17\"},{:name=>\"foo18\",:id=>\"18\"},{:name=>\"foo19\",:id=>\"19\"},{:name=>\"foo20\",:id=>\"20\"},{:name=>\"foo21\",:id=>\"21\"},{:name=>\"foo22\",:id=>\"22\"},{:name=>\"foo23\",:id=>\"23\"},{:name=>\"foo24\",:id=>\"24\"},{:name=>\"foo25\",:id=>\"25\"}]"
    assert_equal expected_result, x.to_json
  end

  def test_single_record_to_json
    x = User.where(:id => 1)
    assert_equal "[{:name=>\"foo1\",:id=>\"1\"}]", x.to_json
  end

  def test_columns
    x = User.where(:id => [1,2,3,4])
    assert_equal "[{:id=>\"1\"},{:id=>\"2\"},{:id=>\"3\"},{:id=>\"4\"}]", x.to_json([:id])
    assert_equal "[{:id=>\"1\",:name=>\"foo1\"},{:id=>\"2\",:name=>\"foo2\"},{:id=>\"3\",:name=>\"foo3\"},{:id=>\"4\",:name=>\"foo4\"}]", x.to_json([:id, :name])
  end
end
