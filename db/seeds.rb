(1..100).each do |number|
  Task.create(content: 'test content' + number.to_s, status: 'お試し' + number.to_s)
end