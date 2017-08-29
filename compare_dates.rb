def compare_dates(d1, d2)
  comp1 = date_component(d1)
  comp2 = date_component(d2)

  for i in 0..2
    if comp1[i] > comp2[i]
      return d1
    elsif comp2[i] > comp1[i]
      return d2
    end
  end
  0
end

def date_component(d)
  components = []
  d =~ /(\d{4})-(\d{2})-(\d{2})/
  components << $~[1].to_i
  components << $~[2].to_i
  components << $~[3].to_i
end

p compare_dates('2017-05-20', '2017-05-20')
