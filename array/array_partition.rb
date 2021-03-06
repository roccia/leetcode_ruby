# Given an array of 2n integers, your task is to group these integers
# into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn)
# which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
class ArrayPartition

  def array_pair_sum(nums)
    return nums.min if nums.size <= 2
    new_ary = nums.sort
    result = 0
    new_ary.each_with_index do |_,index|
       if index.even?
           result += new_ary[index]
       end
    end
    result
  end


   def array_sum(nums)
     sorted_array = nums.sort
     sum = 0
     i = 0
     while i < sorted_array.size
       sum += sorted_array[i]
       i += 2
     end

     sum
   end
end

a = ArrayPartition.new
p a.array_sum([1,2,3,2])