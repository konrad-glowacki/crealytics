def read_from_enumerator(enumerator)
  result = []

  loop do
    begin
      result << enumerator.next
    rescue StopIteration
      break
    end
  end

  result
end

RSpec::Matchers.define :be_empty do
  match do |enumerator|
    read_from_enumerator(enumerator).empty?
  end
end

RSpec::Matchers.define :return_elements do |*expected|
  read_elements = nil

  match do |enumerator|
    read_elements = read_from_enumerator(enumerator)
    read_elements == expected
  end

  failure_message do |enumerator|
    "expected that #{enumerator} would return #{expected.inspect}, but it returned #{read_elements.inspect}"
  end
end
