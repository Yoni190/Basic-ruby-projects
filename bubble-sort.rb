def bubble_sort(nums)
  i = 0
  j = 1
  max_index = nums.length
  while max_index > 0
    while i < nums.length && nums[j] != nil
        if nums[i] > nums[j]
          nums[i] = nums[j] + nums[i]
          nums[j] = nums[i] - nums[j]
          nums[i] = nums[i] - nums[j]
          i += 1
          j += 1
        else
          i += 1
          j += 1
        end
    end
    i = 0
    j = 1
    max_index -= 1
  end
  nums
end

p bubble_sort([4,3,78,2,0,2])



  