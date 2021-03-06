# Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
#
#     Note:
#     You must not modify the array (assume the array is read only).
#     You must use only constant, O(1) extra space.
#     Your runtime complexity should be less than O(n2).
#         There is only one duplicate number in the array, but it could be repeated more than once.
class FindDuplicateNumber

  def find_duplicate(nums)

    nwe_nums = nums.sort

    nwe_nums.each_with_index do |_, i|
      if nwe_nums[i] == nwe_nums[i - 1]
        return nwe_nums[i]
      end
    end

  end


  def find_dup_bs(nums)
    low = 1
    high = nums.size - 1
    while low < high
      mid = low + (high-low)/2
      count = 0
      nums.each do |n|
        if n <= mid
          count += 1
        end
      end
      if count <= mid
        low = mid + 1
      else
        high = mid
      end

    end
    low
  end

  # two_pointer
  def find_dup(nums)
    slow = nums[0]
    fast = nums[slow]

    # Keep advancing 'slow' by one step and 'fast' by two steps until they
    # meet inside the loop.
    while slow != fast
      slow = nums[slow]
      fast = nums[nums[fast]]

    end
    fast = 0
    # Start up another pointer from the end of the array and march it forward
    # until it hits the pointer inside the array.
    while slow != fast
      slow = nums[slow]
      fast = nums[fast]
    end

    slow
  end

end

f = FindDuplicateNumber.new
nums = [3, 1, 3, 4, 2]
p f.find_duplicate(nums)
p f.find_dup_bs(nums)